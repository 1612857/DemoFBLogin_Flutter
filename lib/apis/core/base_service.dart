import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_widget_tot/models/base_response.dart';

import 'auth_service.dart';
import 'errors.dart';

abstract class BaseLoopBackApi {
  HttpClient _httpClient;
  LoopBackAuth auth;

  BaseLoopBackApi()
      : _httpClient = new HttpClient(),
        auth = new LoopBackAuth();

  Future<dynamic> request(
      {String method,
      String url,
      Map<String, dynamic> urlParams,
      Map<String, dynamic> postBody,
      bool isWrapBaseResponse = true}) async {
    _httpClient.idleTimeout = new Duration(seconds: 60);
    var uri = Uri.parse(url);
    if (urlParams != null && urlParams.length > 0) {
      List.from(urlParams.keys).forEach((k) {
        if (urlParams[k] == null) {
          urlParams.remove(k);
        }
      });
      uri = uri.replace(queryParameters: urlParams);
    }
    HttpClientRequest request =
        await _httpClient.openUrl(method, uri).catchError((e) {
      throw NetServiceError(
          type: ErrorType.NETWORK_ERROR, message: 'Net error');
    })
          ..headers.contentType = ContentType.json
          ..headers.chunkedTransferEncoding = false;

    var tokenId = this.auth.accessToken().id;
    if (tokenId != null) {
      request.headers.add(HttpHeaders.authorizationHeader, tokenId);
    }

    if (postBody != null) {
      var stringBody = json.encode(postBody);
      request.headers.contentLength = utf8.encode(stringBody).length;
      request.write(stringBody);
    }

    HttpClientResponse response = await request.close().catchError((e) {
      throw new NetServiceError(
          type: ErrorType.NETWORK_ERROR,
          message: 'Connection error, please try later.');
    });

    print('api: ${uri} -> ${response.statusCode}');

    if (response.headers.contentType.toString() !=
        ContentType.json.toString()) {
      throw new NetServiceError(
          type: ErrorType.UNSUPPORT_TYPE,
          message: 'Server returned an unsupported content type: '
              '${response.headers.contentType} from ${request.uri}');
    }

    if (response.statusCode == HttpStatus.noContent) {
      return "";
    }

    if (response.statusCode != HttpStatus.ok) {
      switch (response.statusCode) {
        case HttpStatus.badRequest:
          throw new NetServiceError(
              type: ErrorType.WRONG_CURRENT_PASSWORD,
              message: 'There is an error, please try later.');
        case HttpStatus.unauthorized:
          throw new NetServiceError(
              type: ErrorType.AUTH_FAIL,
              message: 'There is an error, please try later.');
        case HttpStatus.internalServerError:
          throw new NetServiceError(
              type: ErrorType.SYSTEM_ERROR,
              message: 'There is an error, please try later.');
        default:
          throw new NetServiceError(
              type: ErrorType.SYSTEM_ERROR,
              message: 'There is an error, please try later.');
      }
    }
    String raw = await response.transform(utf8.decoder).join();
    dynamic data = json.decode(raw);

    if (isWrapBaseResponse) {
      BaseResponse resp = BaseResponse.fromJson(data);
      if (resp.success) {
        return resp.data;
      } else {
        print('api fail!');
        throw new NetServiceError(type: resp.errorType, message: resp.message);
      }
    } else {
      return data;
    }
  }

  String getModelPath();

  dynamic fromJson(Map<String, Object> item);
}
