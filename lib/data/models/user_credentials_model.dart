// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_credentials_model.freezed.dart';
part 'user_credentials_model.g.dart';

@freezed
class UserCredentialsModel with _$UserCredentialsModel {
  const factory UserCredentialsModel({
    @JsonKey(name: 'full_name') final String? name,
    @JsonKey(name: 'token') final String? idToken,
    @JsonKey(name: 'email') final String? email,
    @JsonKey(name: 'role') final String? role,
  }) = _AdsModel;

  factory UserCredentialsModel.fromJson(Map<String, dynamic> json) =>
      _$UserCredentialsModelFromJson(json);
}
