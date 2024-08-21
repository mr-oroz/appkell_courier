// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressDetailsModelImpl _$$AddressDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AddressDetailsModelImpl(
      streetName: json['streetName'] as String?,
      number: json['number'] as String?,
      floor: json['floor'] as String?,
      apartment: json['apartment'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AddressDetailsModelImplToJson(
        _$AddressDetailsModelImpl instance) =>
    <String, dynamic>{
      'streetName': instance.streetName,
      'number': instance.number,
      'floor': instance.floor,
      'apartment': instance.apartment,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
