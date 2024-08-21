// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credentials_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdsModelImpl _$$AdsModelImplFromJson(Map<String, dynamic> json) =>
    _$AdsModelImpl(
      name: json['full_name'] as String?,
      idToken: json['token'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$AdsModelImplToJson(_$AdsModelImpl instance) =>
    <String, dynamic>{
      'full_name': instance.name,
      'token': instance.idToken,
      'email': instance.email,
      'role': instance.role,
    };
