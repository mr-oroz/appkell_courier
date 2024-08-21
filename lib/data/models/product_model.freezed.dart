// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KitchenList _$KitchenListFromJson(Map<String, dynamic> json) {
  return _KitchenList.fromJson(json);
}

/// @nodoc
mixin _$KitchenList {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitchenListCopyWith<KitchenList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitchenListCopyWith<$Res> {
  factory $KitchenListCopyWith(
          KitchenList value, $Res Function(KitchenList) then) =
      _$KitchenListCopyWithImpl<$Res, KitchenList>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$KitchenListCopyWithImpl<$Res, $Val extends KitchenList>
    implements $KitchenListCopyWith<$Res> {
  _$KitchenListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitchenListImplCopyWith<$Res>
    implements $KitchenListCopyWith<$Res> {
  factory _$$KitchenListImplCopyWith(
          _$KitchenListImpl value, $Res Function(_$KitchenListImpl) then) =
      __$$KitchenListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$KitchenListImplCopyWithImpl<$Res>
    extends _$KitchenListCopyWithImpl<$Res, _$KitchenListImpl>
    implements _$$KitchenListImplCopyWith<$Res> {
  __$$KitchenListImplCopyWithImpl(
      _$KitchenListImpl _value, $Res Function(_$KitchenListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$KitchenListImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitchenListImpl implements _KitchenList {
  const _$KitchenListImpl({this.id, this.name});

  factory _$KitchenListImpl.fromJson(Map<String, dynamic> json) =>
      _$$KitchenListImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'KitchenList(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KitchenListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitchenListImplCopyWith<_$KitchenListImpl> get copyWith =>
      __$$KitchenListImplCopyWithImpl<_$KitchenListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitchenListImplToJson(
      this,
    );
  }
}

abstract class _KitchenList implements KitchenList {
  const factory _KitchenList({final int? id, final String? name}) =
      _$KitchenListImpl;

  factory _KitchenList.fromJson(Map<String, dynamic> json) =
      _$KitchenListImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$KitchenListImplCopyWith<_$KitchenListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  Unit? get unit => throw _privateConstructorUsedError;
  String? get composition => throw _privateConstructorUsedError;
  PriceModel? get price => throw _privateConstructorUsedError;
  String? get manufacturer => throw _privateConstructorUsedError;
  bool? get inStock =>
      throw _privateConstructorUsedError; // final int? category,
  int? get weight => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {int id,
      String? title,
      double quantity,
      Unit? unit,
      String? composition,
      PriceModel? price,
      String? manufacturer,
      bool? inStock,
      int? weight,
      List<String> images});

  $PriceModelCopyWith<$Res>? get price;
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? quantity = null,
    Object? unit = freezed,
    Object? composition = freezed,
    Object? price = freezed,
    Object? manufacturer = freezed,
    Object? inStock = freezed,
    Object? weight = freezed,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit?,
      composition: freezed == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceModel?,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      inStock: freezed == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as bool?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceModelCopyWith<$Res>? get price {
    if (_value.price == null) {
      return null;
    }

    return $PriceModelCopyWith<$Res>(_value.price!, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? title,
      double quantity,
      Unit? unit,
      String? composition,
      PriceModel? price,
      String? manufacturer,
      bool? inStock,
      int? weight,
      List<String> images});

  @override
  $PriceModelCopyWith<$Res>? get price;
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? quantity = null,
    Object? unit = freezed,
    Object? composition = freezed,
    Object? price = freezed,
    Object? manufacturer = freezed,
    Object? inStock = freezed,
    Object? weight = freezed,
    Object? images = null,
  }) {
    return _then(_$ProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit?,
      composition: freezed == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceModel?,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      inStock: freezed == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as bool?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  const _$ProductModelImpl(
      {required this.id,
      this.title,
      this.quantity = 0,
      this.unit,
      this.composition,
      this.price,
      this.manufacturer,
      this.inStock,
      this.weight,
      final List<String> images = const []})
      : _images = images;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  final int id;
  @override
  final String? title;
  @override
  @JsonKey()
  final double quantity;
  @override
  final Unit? unit;
  @override
  final String? composition;
  @override
  final PriceModel? price;
  @override
  final String? manufacturer;
  @override
  final bool? inStock;
// final int? category,
  @override
  final int? weight;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, quantity: $quantity, unit: $unit, composition: $composition, price: $price, manufacturer: $manufacturer, inStock: $inStock, weight: $weight, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.composition, composition) ||
                other.composition == composition) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.inStock, inStock) || other.inStock == inStock) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      quantity,
      unit,
      composition,
      price,
      manufacturer,
      inStock,
      weight,
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {required final int id,
      final String? title,
      final double quantity,
      final Unit? unit,
      final String? composition,
      final PriceModel? price,
      final String? manufacturer,
      final bool? inStock,
      final int? weight,
      final List<String> images}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  int get id;
  @override
  String? get title;
  @override
  double get quantity;
  @override
  Unit? get unit;
  @override
  String? get composition;
  @override
  PriceModel? get price;
  @override
  String? get manufacturer;
  @override
  bool? get inStock;
  @override // final int? category,
  int? get weight;
  @override
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceModel _$PriceModelFromJson(Map<String, dynamic> json) {
  return _PriceModel.fromJson(json);
}

/// @nodoc
mixin _$PriceModel {
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'old_price')
  double get oldPrice => throw _privateConstructorUsedError;
  int? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_my_discount')
  bool get isMyDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_my_price')
  bool get isMyPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceModelCopyWith<PriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceModelCopyWith<$Res> {
  factory $PriceModelCopyWith(
          PriceModel value, $Res Function(PriceModel) then) =
      _$PriceModelCopyWithImpl<$Res, PriceModel>;
  @useResult
  $Res call(
      {double price,
      @JsonKey(name: 'old_price') double oldPrice,
      int? discount,
      @JsonKey(name: 'is_my_discount') bool isMyDiscount,
      @JsonKey(name: 'is_my_price') bool isMyPrice});
}

/// @nodoc
class _$PriceModelCopyWithImpl<$Res, $Val extends PriceModel>
    implements $PriceModelCopyWith<$Res> {
  _$PriceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? oldPrice = null,
    Object? discount = freezed,
    Object? isMyDiscount = null,
    Object? isMyPrice = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      oldPrice: null == oldPrice
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      isMyDiscount: null == isMyDiscount
          ? _value.isMyDiscount
          : isMyDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      isMyPrice: null == isMyPrice
          ? _value.isMyPrice
          : isMyPrice // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceModelImplCopyWith<$Res>
    implements $PriceModelCopyWith<$Res> {
  factory _$$PriceModelImplCopyWith(
          _$PriceModelImpl value, $Res Function(_$PriceModelImpl) then) =
      __$$PriceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double price,
      @JsonKey(name: 'old_price') double oldPrice,
      int? discount,
      @JsonKey(name: 'is_my_discount') bool isMyDiscount,
      @JsonKey(name: 'is_my_price') bool isMyPrice});
}

/// @nodoc
class __$$PriceModelImplCopyWithImpl<$Res>
    extends _$PriceModelCopyWithImpl<$Res, _$PriceModelImpl>
    implements _$$PriceModelImplCopyWith<$Res> {
  __$$PriceModelImplCopyWithImpl(
      _$PriceModelImpl _value, $Res Function(_$PriceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? oldPrice = null,
    Object? discount = freezed,
    Object? isMyDiscount = null,
    Object? isMyPrice = null,
  }) {
    return _then(_$PriceModelImpl(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      oldPrice: null == oldPrice
          ? _value.oldPrice
          : oldPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      isMyDiscount: null == isMyDiscount
          ? _value.isMyDiscount
          : isMyDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      isMyPrice: null == isMyPrice
          ? _value.isMyPrice
          : isMyPrice // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceModelImpl implements _PriceModel {
  const _$PriceModelImpl(
      {this.price = 0,
      @JsonKey(name: 'old_price') this.oldPrice = 0,
      this.discount,
      @JsonKey(name: 'is_my_discount') this.isMyDiscount = false,
      @JsonKey(name: 'is_my_price') this.isMyPrice = false});

  factory _$PriceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceModelImplFromJson(json);

  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey(name: 'old_price')
  final double oldPrice;
  @override
  final int? discount;
  @override
  @JsonKey(name: 'is_my_discount')
  final bool isMyDiscount;
  @override
  @JsonKey(name: 'is_my_price')
  final bool isMyPrice;

  @override
  String toString() {
    return 'PriceModel(price: $price, oldPrice: $oldPrice, discount: $discount, isMyDiscount: $isMyDiscount, isMyPrice: $isMyPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceModelImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.oldPrice, oldPrice) ||
                other.oldPrice == oldPrice) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.isMyDiscount, isMyDiscount) ||
                other.isMyDiscount == isMyDiscount) &&
            (identical(other.isMyPrice, isMyPrice) ||
                other.isMyPrice == isMyPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, price, oldPrice, discount, isMyDiscount, isMyPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceModelImplCopyWith<_$PriceModelImpl> get copyWith =>
      __$$PriceModelImplCopyWithImpl<_$PriceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceModelImplToJson(
      this,
    );
  }
}

abstract class _PriceModel implements PriceModel {
  const factory _PriceModel(
      {final double price,
      @JsonKey(name: 'old_price') final double oldPrice,
      final int? discount,
      @JsonKey(name: 'is_my_discount') final bool isMyDiscount,
      @JsonKey(name: 'is_my_price') final bool isMyPrice}) = _$PriceModelImpl;

  factory _PriceModel.fromJson(Map<String, dynamic> json) =
      _$PriceModelImpl.fromJson;

  @override
  double get price;
  @override
  @JsonKey(name: 'old_price')
  double get oldPrice;
  @override
  int? get discount;
  @override
  @JsonKey(name: 'is_my_discount')
  bool get isMyDiscount;
  @override
  @JsonKey(name: 'is_my_price')
  bool get isMyPrice;
  @override
  @JsonKey(ignore: true)
  _$$PriceModelImplCopyWith<_$PriceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DishProductModel _$DishProductModelFromJson(Map<String, dynamic> json) {
  return _DishProductModel.fromJson(json);
}

/// @nodoc
mixin _$DishProductModel {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get composition => throw _privateConstructorUsedError;
  int? get calories => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int? get category => throw _privateConstructorUsedError;
  int? get position => throw _privateConstructorUsedError;
  List<ImageModel>? get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DishProductModelCopyWith<DishProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishProductModelCopyWith<$Res> {
  factory $DishProductModelCopyWith(
          DishProductModel value, $Res Function(DishProductModel) then) =
      _$DishProductModelCopyWithImpl<$Res, DishProductModel>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? composition,
      int? calories,
      int? price,
      int? category,
      int? position,
      List<ImageModel>? images});
}

/// @nodoc
class _$DishProductModelCopyWithImpl<$Res, $Val extends DishProductModel>
    implements $DishProductModelCopyWith<$Res> {
  _$DishProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? composition = freezed,
    Object? calories = freezed,
    Object? price = freezed,
    Object? category = freezed,
    Object? position = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      composition: freezed == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as String?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DishProductModelImplCopyWith<$Res>
    implements $DishProductModelCopyWith<$Res> {
  factory _$$DishProductModelImplCopyWith(_$DishProductModelImpl value,
          $Res Function(_$DishProductModelImpl) then) =
      __$$DishProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? composition,
      int? calories,
      int? price,
      int? category,
      int? position,
      List<ImageModel>? images});
}

/// @nodoc
class __$$DishProductModelImplCopyWithImpl<$Res>
    extends _$DishProductModelCopyWithImpl<$Res, _$DishProductModelImpl>
    implements _$$DishProductModelImplCopyWith<$Res> {
  __$$DishProductModelImplCopyWithImpl(_$DishProductModelImpl _value,
      $Res Function(_$DishProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? composition = freezed,
    Object? calories = freezed,
    Object? price = freezed,
    Object? category = freezed,
    Object? position = freezed,
    Object? images = freezed,
  }) {
    return _then(_$DishProductModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      composition: freezed == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as String?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DishProductModelImpl implements _DishProductModel {
  const _$DishProductModelImpl(
      {this.id,
      this.title,
      this.composition,
      this.calories,
      this.price,
      this.category,
      this.position,
      final List<ImageModel>? images})
      : _images = images;

  factory _$DishProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DishProductModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? composition;
  @override
  final int? calories;
  @override
  final int? price;
  @override
  final int? category;
  @override
  final int? position;
  final List<ImageModel>? _images;
  @override
  List<ImageModel>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DishProductModel(id: $id, title: $title, composition: $composition, calories: $calories, price: $price, category: $category, position: $position, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DishProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.composition, composition) ||
                other.composition == composition) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.position, position) ||
                other.position == position) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, composition, calories,
      price, category, position, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DishProductModelImplCopyWith<_$DishProductModelImpl> get copyWith =>
      __$$DishProductModelImplCopyWithImpl<_$DishProductModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DishProductModelImplToJson(
      this,
    );
  }
}

abstract class _DishProductModel implements DishProductModel {
  const factory _DishProductModel(
      {final String? id,
      final String? title,
      final String? composition,
      final int? calories,
      final int? price,
      final int? category,
      final int? position,
      final List<ImageModel>? images}) = _$DishProductModelImpl;

  factory _DishProductModel.fromJson(Map<String, dynamic> json) =
      _$DishProductModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get composition;
  @override
  int? get calories;
  @override
  int? get price;
  @override
  int? get category;
  @override
  int? get position;
  @override
  List<ImageModel>? get images;
  @override
  @JsonKey(ignore: true)
  _$$DishProductModelImplCopyWith<_$DishProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) {
  return _ImageModel.fromJson(json);
}

/// @nodoc
mixin _$ImageModel {
  int? get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageModelCopyWith<ImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageModelCopyWith<$Res> {
  factory $ImageModelCopyWith(
          ImageModel value, $Res Function(ImageModel) then) =
      _$ImageModelCopyWithImpl<$Res, ImageModel>;
  @useResult
  $Res call({int? id, String? image});
}

/// @nodoc
class _$ImageModelCopyWithImpl<$Res, $Val extends ImageModel>
    implements $ImageModelCopyWith<$Res> {
  _$ImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageModelImplCopyWith<$Res>
    implements $ImageModelCopyWith<$Res> {
  factory _$$ImageModelImplCopyWith(
          _$ImageModelImpl value, $Res Function(_$ImageModelImpl) then) =
      __$$ImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? image});
}

/// @nodoc
class __$$ImageModelImplCopyWithImpl<$Res>
    extends _$ImageModelCopyWithImpl<$Res, _$ImageModelImpl>
    implements _$$ImageModelImplCopyWith<$Res> {
  __$$ImageModelImplCopyWithImpl(
      _$ImageModelImpl _value, $Res Function(_$ImageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
  }) {
    return _then(_$ImageModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageModelImpl implements _ImageModel {
  const _$ImageModelImpl({this.id, this.image});

  factory _$ImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? image;

  @override
  String toString() {
    return 'ImageModel(id: $id, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageModelImplCopyWith<_$ImageModelImpl> get copyWith =>
      __$$ImageModelImplCopyWithImpl<_$ImageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageModelImplToJson(
      this,
    );
  }
}

abstract class _ImageModel implements ImageModel {
  const factory _ImageModel({final int? id, final String? image}) =
      _$ImageModelImpl;

  factory _ImageModel.fromJson(Map<String, dynamic> json) =
      _$ImageModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$ImageModelImplCopyWith<_$ImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReellSuccessModel _$ReellSuccessModelFromJson(Map<String, dynamic> json) {
  return _ReellSuccessModel.fromJson(json);
}

/// @nodoc
mixin _$ReellSuccessModel {
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'saved_files')
  List<String> get savedFiles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReellSuccessModelCopyWith<ReellSuccessModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReellSuccessModelCopyWith<$Res> {
  factory $ReellSuccessModelCopyWith(
          ReellSuccessModel value, $Res Function(ReellSuccessModel) then) =
      _$ReellSuccessModelCopyWithImpl<$Res, ReellSuccessModel>;
  @useResult
  $Res call(
      {String? message, @JsonKey(name: 'saved_files') List<String> savedFiles});
}

/// @nodoc
class _$ReellSuccessModelCopyWithImpl<$Res, $Val extends ReellSuccessModel>
    implements $ReellSuccessModelCopyWith<$Res> {
  _$ReellSuccessModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? savedFiles = null,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      savedFiles: null == savedFiles
          ? _value.savedFiles
          : savedFiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReellSuccessModelImplCopyWith<$Res>
    implements $ReellSuccessModelCopyWith<$Res> {
  factory _$$ReellSuccessModelImplCopyWith(_$ReellSuccessModelImpl value,
          $Res Function(_$ReellSuccessModelImpl) then) =
      __$$ReellSuccessModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? message, @JsonKey(name: 'saved_files') List<String> savedFiles});
}

/// @nodoc
class __$$ReellSuccessModelImplCopyWithImpl<$Res>
    extends _$ReellSuccessModelCopyWithImpl<$Res, _$ReellSuccessModelImpl>
    implements _$$ReellSuccessModelImplCopyWith<$Res> {
  __$$ReellSuccessModelImplCopyWithImpl(_$ReellSuccessModelImpl _value,
      $Res Function(_$ReellSuccessModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? savedFiles = null,
  }) {
    return _then(_$ReellSuccessModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      savedFiles: null == savedFiles
          ? _value._savedFiles
          : savedFiles // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReellSuccessModelImpl implements _ReellSuccessModel {
  const _$ReellSuccessModelImpl(
      {this.message,
      @JsonKey(name: 'saved_files') final List<String> savedFiles = const []})
      : _savedFiles = savedFiles;

  factory _$ReellSuccessModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReellSuccessModelImplFromJson(json);

  @override
  final String? message;
  final List<String> _savedFiles;
  @override
  @JsonKey(name: 'saved_files')
  List<String> get savedFiles {
    if (_savedFiles is EqualUnmodifiableListView) return _savedFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedFiles);
  }

  @override
  String toString() {
    return 'ReellSuccessModel(message: $message, savedFiles: $savedFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReellSuccessModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._savedFiles, _savedFiles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_savedFiles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReellSuccessModelImplCopyWith<_$ReellSuccessModelImpl> get copyWith =>
      __$$ReellSuccessModelImplCopyWithImpl<_$ReellSuccessModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReellSuccessModelImplToJson(
      this,
    );
  }
}

abstract class _ReellSuccessModel implements ReellSuccessModel {
  const factory _ReellSuccessModel(
          {final String? message,
          @JsonKey(name: 'saved_files') final List<String> savedFiles}) =
      _$ReellSuccessModelImpl;

  factory _ReellSuccessModel.fromJson(Map<String, dynamic> json) =
      _$ReellSuccessModelImpl.fromJson;

  @override
  String? get message;
  @override
  @JsonKey(name: 'saved_files')
  List<String> get savedFiles;
  @override
  @JsonKey(ignore: true)
  _$$ReellSuccessModelImplCopyWith<_$ReellSuccessModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
