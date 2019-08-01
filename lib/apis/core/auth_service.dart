import 'dart:async';
import 'dart:convert';

import 'package:flutter_widget_tot/models/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum AccessStatus {
  NOT_REMEMBER_ME,
  TOKEN_NULL,
  TOKEN_EXPIRE,
  EXCEPTION,
  TOKEN_VALID,
}

class LoopBackAuth {
  String _prefix = "LoopBackAuth_";

  AccessToken _token = new AccessToken();
  bool _isRememberMe = false;

  static final LoopBackAuth _instance = new LoopBackAuth._internal();

  factory LoopBackAuth() {
    return _instance;
  }

  LoopBackAuth._internal();

  Future<AccessStatus> loadAccessToken() async {
    try {
      var isRememberMe = await _getPersist("rememberMe") as bool;
      if (isRememberMe == null || !isRememberMe) {
        return AccessStatus.NOT_REMEMBER_ME;
      }
      _isRememberMe = isRememberMe;

      var accessTokenStr = await _getPersist("accessToken");
      var accessToken =
          AccessToken.fromJson(new JsonDecoder().convert(accessTokenStr));
      if (accessToken == null) {
        return AccessStatus.TOKEN_NULL;
      }
      _token = accessToken;

      var expires = await _getPersist("expires") as String;
      DateTime expireDate = DateTime.parse(expires);
      DateTime today = new DateTime.now();
      if (today.compareTo(expireDate) > 0) {
        return AccessStatus.TOKEN_EXPIRE;
      }
    } catch (e) {
      return AccessStatus.EXCEPTION;
    }

    return AccessStatus.TOKEN_VALID;
  }


  void setAccessToken(AccessToken token, bool isRememberMe) {
    _token = token;
    _isRememberMe = isRememberMe;
    this.save();
  }

  AccessToken accessToken() {
    return _token;
  }


  bool rememberMe() {
    return _isRememberMe;
  }

  // Persist
  void save() {
    _setPersist('rememberMe', _isRememberMe);
    _setPersist('accessToken', new JsonEncoder().convert(_token.toJson()));

    if (_token.ttl == null) {
      _setPersist('expires', null);
    } else {
      final today = new DateTime.now();
      final expires = new DateTime.fromMillisecondsSinceEpoch(
          today.millisecondsSinceEpoch + (_token.ttl * 1000));
      _setPersist('expires', expires.toString());
    }
  }

  void clear() {
    _token = new AccessToken();
    save();
  }

  Future<dynamic> _getPersist(String prop) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get('${this._prefix}$prop');
  }

  void _setPersist(String prop, dynamic value) async {
    final key = '${this._prefix}$prop';
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (value == null) {
      await prefs.remove(key);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw new Error();
    }
  }
}
