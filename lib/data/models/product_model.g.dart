// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitchenListImpl _$$KitchenListImplFromJson(Map<String, dynamic> json) =>
    _$KitchenListImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$KitchenListImplToJson(_$KitchenListImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['id'] as int,
      title: json['title'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
      unit: $enumDecodeNullable(_$UnitEnumMap, json['unit']),
      composition: json['composition'] as String?,
      price: json['price'] == null
          ? null
          : PriceModel.fromJson(json['price'] as Map<String, dynamic>),
      manufacturer: json['manufacturer'] as String?,
      inStock: json['inStock'] as bool?,
      weight: json['weight'] as int?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'quantity': instance.quantity,
      'unit': _$UnitEnumMap[instance.unit],
      'composition': instance.composition,
      'price': instance.price,
      'manufacturer': instance.manufacturer,
      'inStock': instance.inStock,
      'weight': instance.weight,
      'images': instance.images,
    };

const _$UnitEnumMap = {
  Unit.gram: 'gram',
  Unit.kg: 'kg',
  Unit.liter: 'liter',
  Unit.st: 'items',
};

_$PriceModelImpl _$$PriceModelImplFromJson(Map<String, dynamic> json) =>
    _$PriceModelImpl(
      price: (json['price'] as num?)?.toDouble() ?? 0,
      oldPrice: (json['old_price'] as num?)?.toDouble() ?? 0,
      discount: json['discount'] as int?,
      isMyDiscount: json['is_my_discount'] as bool? ?? false,
      isMyPrice: json['is_my_price'] as bool? ?? false,
    );

Map<String, dynamic> _$$PriceModelImplToJson(_$PriceModelImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'is_my_discount': instance.isMyDiscount,
      'is_my_price': instance.isMyPrice,
    };

_$DishProductModelImpl _$$DishProductModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DishProductModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      composition: json['composition'] as String?,
      calories: json['calories'] as int?,
      price: json['price'] as int?,
      category: json['category'] as int?,
      position: json['position'] as int?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DishProductModelImplToJson(
        _$DishProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'composition': instance.composition,
      'calories': instance.calories,
      'price': instance.price,
      'category': instance.category,
      'position': instance.position,
      'images': instance.images,
    };

_$ImageModelImpl _$$ImageModelImplFromJson(Map<String, dynamic> json) =>
    _$ImageModelImpl(
      id: json['id'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$ImageModelImplToJson(_$ImageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };

_$ReellSuccessModelImpl _$$ReellSuccessModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReellSuccessModelImpl(
      message: json['message'] as String?,
      savedFiles: (json['saved_files'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReellSuccessModelImplToJson(
        _$ReellSuccessModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'saved_files': instance.savedFiles,
    };
