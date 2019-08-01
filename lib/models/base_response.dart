import 'dart:io';

import 'package:flutter_widget_tot/apis/core/errors.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

// this is model for only my account
@JsonSerializable(nullable: false)
class BaseResponse {
  bool success;
  String message;
  String code;
  dynamic data;

  BaseResponse(this.success, this.message, this.code, this.data);

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    final account = _$BaseResponseFromJson(json);
    return account;
  }
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  ErrorType get errorType {
    switch (code) {
      case 'C401':
        return ErrorType.OBJECT_NOT_FOUND;
      case 'C402':
        return ErrorType.PERMISSION_DENIED;
      case 'C403':
        return ErrorType.INVALID_DATA;
      case 'C500':
        return ErrorType.SYSTEM_ERROR;
      default:
        return ErrorType.UNKNOWN;
    }
  }
}
