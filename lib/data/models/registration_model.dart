// ignore_for_file: invalid_annotation_target

import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_model.freezed.dart';
part 'registration_model.g.dart';

@freezed
class RegistrationModel with _$RegistrationModel {
  const RegistrationModel._();
  factory RegistrationModel({
    final String? role,
    final String? companyName,
    final String? fio,
    final String? whatsappNumber,
    final String? email,
    final String? password,
    @JsonKey(includeToJson: false, includeFromJson: false)
    final File? frontPassport,
    @JsonKey(includeToJson: false, includeFromJson: false)
    final File? backPassport,
    @JsonKey(includeToJson: false, includeFromJson: false)
    final File? legalFileFaces,
  }) = _RegistrationModel;

  factory RegistrationModel.fromJson(Map<String, Object> json) =>
      _$RegistrationModelFromJson(json);

  Map<String, dynamic> toMap() {
    return {
      if (role != null && role!.isNotEmpty) 'role': role,
      if (companyName != null && companyName!.isNotEmpty)
        'shop_name': companyName,
      if (fio != null && fio!.isNotEmpty) 'full_name': fio,
      if(legalFileFaces != null ) "entity_file": legalFileFaces,
      if (whatsappNumber != null && whatsappNumber!.isNotEmpty)
        'phone': whatsappNumber!
            .replaceAll('+', '')
            .replaceAll(' ', '')
            .replaceAll('(', '')
            .replaceAll(')', '')
            .replaceAll('-', ''),
      if (email != null && email!.isNotEmpty) 'email': email,
      if (password != null && password!.isNotEmpty) 'password': password,
    };
  }
}
