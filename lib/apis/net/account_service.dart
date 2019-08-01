import 'dart:async';

import 'package:flutter_widget_tot/apis/core/auth_service.dart';
import 'package:flutter_widget_tot/apis/core/base_service.dart';
import 'package:flutter_widget_tot/models/base_model.dart';
import 'package:flutter_widget_tot/models/user.dart';

import '../loopback_config.dart';

class AccountService extends BaseLoopBackApi {
  final LoopBackAuth auth;

  AccountService() : auth = new LoopBackAuth();

  Future<User> login(String email, String password) async {
    return Future.delayed(Duration(milliseconds: 2000), () {
      User me = User("123456", "demo@m.com", "DEMO", "", "", "", "", "");
      auth.setAccessToken(AccessToken(id: "123456", userId: "123456", user: me), false);
      return me;
    });
  }

  Future<dynamic> logout() async {
    final url = [LoopBackConfig.getPath(), LoopBackConfig.getApiVersion(), getModelPath(), 'logout'].join('/');
    final result = await this.request(
      method: 'POST',
      url: url,
      isWrapBaseResponse: false
    );
    return result;
  }

  Future<User> getInfo() async {
    final url = [LoopBackConfig.getPath(), LoopBackConfig.getApiVersion(), getModelPath(), 'getInfo'].join('/');
    final result = await this.request(
      method: 'GET',
      url: url,
    );

    return User.fromJson(result);
  }

  @override
  String getModelPath() {
    return "Accounts";
  }

  String getSettingModelPath() {
    return "Account-Settings";
  }

  @override
  dynamic fromJson(Map<String, Object> item) {
    return User.fromJson(item);
  }

}
