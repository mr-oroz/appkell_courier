// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_create_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FcmCreateModelImpl _$$FcmCreateModelImplFromJson(Map<String, dynamic> json) =>
    _$FcmCreateModelImpl(
      name: json['name'] as String?,
      registrationId: json['registration_id'] as String,
      deviceId: json['device_id'] as String?,
      active: json['active'] as bool? ?? true,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$FcmCreateModelImplToJson(
        _$FcmCreateModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'registration_id': instance.registrationId,
      'device_id': instance.deviceId,
      'active': instance.active,
      'type': instance.type,
    };
