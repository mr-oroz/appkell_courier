// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      id: json['id'] as String,
      image: json['file'] as String?,
      product: json['product'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      date: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isRead: json['is_read'] as bool? ?? false,
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file': instance.image,
      'product': instance.product,
      'title': instance.title,
      'description': instance.description,
      'created_at': instance.date?.toIso8601String(),
      'is_read': instance.isRead,
    };
