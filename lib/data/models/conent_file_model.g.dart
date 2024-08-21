// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conent_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentFileModelImpl _$$ContentFileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentFileModelImpl(
      id: json['id'] as String?,
      thumbnailPath: json['thumbnailPath'] as String?,
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$$ContentFileModelImplToJson(
        _$ContentFileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thumbnailPath': instance.thumbnailPath,
      'isActive': instance.isActive,
    };

_$ContentModelImpl _$$ContentModelImplFromJson(Map<String, dynamic> json) =>
    _$ContentModelImpl(
      user: json['user'] as int?,
      file: json['file'] as String?,
      dish: json['dish'] as String?,
      product: json['product'] as int?,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String? ?? null,
    );

Map<String, dynamic> _$$ContentModelImplToJson(_$ContentModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'file': instance.file,
      'dish': instance.dish,
      'product': instance.product,
      'description': instance.description,
      'created_at': instance.createdAt,
    };
