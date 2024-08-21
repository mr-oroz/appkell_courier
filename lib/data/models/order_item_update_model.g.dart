// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemUpdateModelImpl _$$OrderItemUpdateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderItemUpdateModelImpl(
      id: json['id'] as int,
      weight: (json['quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderItemUpdateModelImplToJson(
        _$OrderItemUpdateModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.weight,
    };
