// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_verify_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CodeVerifyModelImpl _$$CodeVerifyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CodeVerifyModelImpl(
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$CodeVerifyModelImplToJson(
        _$CodeVerifyModelImpl instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'code': instance.code,
    };
