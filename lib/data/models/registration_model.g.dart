// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistrationModelImpl _$$RegistrationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RegistrationModelImpl(
      role: json['role'] as String?,
      companyName: json['companyName'] as String?,
      fio: json['fio'] as String?,
      whatsappNumber: json['whatsappNumber'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$RegistrationModelImplToJson(
        _$RegistrationModelImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'companyName': instance.companyName,
      'fio': instance.fio,
      'whatsappNumber': instance.whatsappNumber,
      'email': instance.email,
      'password': instance.password,
    };
