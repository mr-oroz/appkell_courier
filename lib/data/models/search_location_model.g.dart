// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchLocationModelImpl _$$SearchLocationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchLocationModelImpl(
      placeId: json['place_id'] as int?,
      licence: json['licence'] as String?,
      osmType: json['osm_type'] as String?,
      osmId: json['osmId'] as int?,
      boundingbox: (json['boundingbox'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lat: json['lat'] as String?,
      lon: json['lon'] as String?,
      displayName: json['display_name'] as String?,
      placeRank: json['placeRank'] as int?,
      category: json['category'] as String?,
      type: json['type'] as String?,
      importance: (json['importance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SearchLocationModelImplToJson(
        _$SearchLocationModelImpl instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'licence': instance.licence,
      'osm_type': instance.osmType,
      'osmId': instance.osmId,
      'boundingbox': instance.boundingbox,
      'lat': instance.lat,
      'lon': instance.lon,
      'display_name': instance.displayName,
      'placeRank': instance.placeRank,
      'category': instance.category,
      'type': instance.type,
      'importance': instance.importance,
    };
