import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

enum Unit {
  @JsonValue('gram')
  gram,
  @JsonValue('kg')
  kg,
  @JsonValue('liter')
  liter,
  @JsonValue('items')
  st;

  bool get isGram => this == gram;
  bool get isKg => this == kg;
  bool get isLiter => this == liter;
  bool get isItems => this == st;
}


@freezed
class KitchenList with _$KitchenList {
  const factory KitchenList({
    final int? id,
    final String? name,
  }) = _KitchenList;

  factory KitchenList.fromJson(Map<String, dynamic> json) => _$KitchenListFromJson(json);
}


@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    final String? title,
    @Default(0) final double quantity,
    final Unit? unit,
    final String? composition,
    final PriceModel? price,
    final String? manufacturer,
    final bool? inStock,
    // final int? category,
    final int? weight,
    @Default([]) final List<String> images,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class PriceModel with _$PriceModel {
  const factory PriceModel({
    @Default(0) double price,
    @Default(0) @JsonKey(name: 'old_price') final double oldPrice,
    final int? discount,
    @Default(false) @JsonKey(name: 'is_my_discount') final bool isMyDiscount,
    @Default(false) @JsonKey(name: 'is_my_price') final bool isMyPrice,
  }) = _PriceModel;

  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);
}


@freezed
class DishProductModel with _$DishProductModel {
  const factory DishProductModel({
    final String? id,
    final String? title,
    final String? composition,
    final int? calories,
    final int? price,
    final int? category,
    final int? position,
    final List<ImageModel>? images,
  }) = _DishProductModel;

  factory DishProductModel.fromJson(Map<String, dynamic> json) => _$DishProductModelFromJson(json);
}

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    final int? id,
    final String? image,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);
}


@freezed
class ReellSuccessModel with _$ReellSuccessModel {
  const factory ReellSuccessModel({
    final String? message,
    @Default([]) @JsonKey(name: 'saved_files') final List<String> savedFiles,
  }) = _ReellSuccessModel;

  factory ReellSuccessModel.fromJson(Map<String, dynamic> json) => _$ReellSuccessModelFromJson(json);
}