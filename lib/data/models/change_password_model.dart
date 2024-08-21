// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_model.freezed.dart';
part 'change_password_model.g.dart';

@freezed
class ChangePasswordModel with _$ChangePasswordModel {
  const ChangePasswordModel._();
  const factory ChangePasswordModel({
    @JsonKey(name: 'email') final String? email,
    @JsonKey(name: 'phone') final String? phone,
    @JsonKey(name: 'password') final String? password,
    @JsonKey(name: 'password2') final String? password2,
    @JsonKey(name: 'code') final String? code,
  }) = _AdsModel;

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordModelFromJson(json);

  Map<String, dynamic> toMap() {
    return {
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (password != null) 'password': password,
      if (password2 != null) 'password2': password2,
      if (code != null) 'code': code,
    };
  }
}
