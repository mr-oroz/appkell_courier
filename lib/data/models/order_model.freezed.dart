// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  int get id => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'timestamp_delivery')
  String? get timeStampDelivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  OrderStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment')
  String? get orderComments => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get houseAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  double? get houseLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  double? get houseLongitude =>
      throw _privateConstructorUsedError; // final String? storeAddress,
// final double? storeLatitude,
// final double? storeLongitude,
  @JsonKey(name: 'fast_order')
  String? get quickOrderText => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'products')
  List<ProductModel> get products => throw _privateConstructorUsedError;
  @JsonKey(name: 'pay_check')
  String? get payCheck => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_type')
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'shopа')
  ProfileModel? get shopData => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_basement')
  String? get subBasement => throw _privateConstructorUsedError;
  @JsonKey(name: 'do_not_disturb')
  bool? get doNotDistirb => throw _privateConstructorUsedError;
  String? get floor => throw _privateConstructorUsedError;
  String? get apartment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {int id,
      int price,
      String? image,
      @JsonKey(name: 'timestamp_delivery') String? timeStampDelivery,
      @JsonKey(name: 'status') OrderStatus status,
      @JsonKey(name: 'phone') String? phoneNumber,
      @JsonKey(name: 'comment') String? orderComments,
      @JsonKey(name: 'address') String? houseAddress,
      @JsonKey(name: 'latitude') double? houseLatitude,
      @JsonKey(name: 'longitude') double? houseLongitude,
      @JsonKey(name: 'fast_order') String? quickOrderText,
      DateTime? date,
      @JsonKey(name: 'products') List<ProductModel> products,
      @JsonKey(name: 'pay_check') String? payCheck,
      @JsonKey(name: 'payment_type') PaymentMethod paymentMethod,
      @JsonKey(name: 'shopа') ProfileModel? shopData,
      @JsonKey(name: 'sub_basement') String? subBasement,
      @JsonKey(name: 'do_not_disturb') bool? doNotDistirb,
      String? floor,
      String? apartment});

  $ProfileModelCopyWith<$Res>? get shopData;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? image = freezed,
    Object? timeStampDelivery = freezed,
    Object? status = null,
    Object? phoneNumber = freezed,
    Object? orderComments = freezed,
    Object? houseAddress = freezed,
    Object? houseLatitude = freezed,
    Object? houseLongitude = freezed,
    Object? quickOrderText = freezed,
    Object? date = freezed,
    Object? products = null,
    Object? payCheck = freezed,
    Object? paymentMethod = null,
    Object? shopData = freezed,
    Object? subBasement = freezed,
    Object? doNotDistirb = freezed,
    Object? floor = freezed,
    Object? apartment = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStampDelivery: freezed == timeStampDelivery
          ? _value.timeStampDelivery
          : timeStampDelivery // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      orderComments: freezed == orderComments
          ? _value.orderComments
          : orderComments // ignore: cast_nullable_to_non_nullable
              as String?,
      houseAddress: freezed == houseAddress
          ? _value.houseAddress
          : houseAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      houseLatitude: freezed == houseLatitude
          ? _value.houseLatitude
          : houseLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      houseLongitude: freezed == houseLongitude
          ? _value.houseLongitude
          : houseLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      quickOrderText: freezed == quickOrderText
          ? _value.quickOrderText
          : quickOrderText // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      payCheck: freezed == payCheck
          ? _value.payCheck
          : payCheck // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      shopData: freezed == shopData
          ? _value.shopData
          : shopData // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      subBasement: freezed == subBasement
          ? _value.subBasement
          : subBasement // ignore: cast_nullable_to_non_nullable
              as String?,
      doNotDistirb: freezed == doNotDistirb
          ? _value.doNotDistirb
          : doNotDistirb // ignore: cast_nullable_to_non_nullable
              as bool?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      apartment: freezed == apartment
          ? _value.apartment
          : apartment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res>? get shopData {
    if (_value.shopData == null) {
      return null;
    }

    return $ProfileModelCopyWith<$Res>(_value.shopData!, (value) {
      return _then(_value.copyWith(shopData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int price,
      String? image,
      @JsonKey(name: 'timestamp_delivery') String? timeStampDelivery,
      @JsonKey(name: 'status') OrderStatus status,
      @JsonKey(name: 'phone') String? phoneNumber,
      @JsonKey(name: 'comment') String? orderComments,
      @JsonKey(name: 'address') String? houseAddress,
      @JsonKey(name: 'latitude') double? houseLatitude,
      @JsonKey(name: 'longitude') double? houseLongitude,
      @JsonKey(name: 'fast_order') String? quickOrderText,
      DateTime? date,
      @JsonKey(name: 'products') List<ProductModel> products,
      @JsonKey(name: 'pay_check') String? payCheck,
      @JsonKey(name: 'payment_type') PaymentMethod paymentMethod,
      @JsonKey(name: 'shopа') ProfileModel? shopData,
      @JsonKey(name: 'sub_basement') String? subBasement,
      @JsonKey(name: 'do_not_disturb') bool? doNotDistirb,
      String? floor,
      String? apartment});

  @override
  $ProfileModelCopyWith<$Res>? get shopData;
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? image = freezed,
    Object? timeStampDelivery = freezed,
    Object? status = null,
    Object? phoneNumber = freezed,
    Object? orderComments = freezed,
    Object? houseAddress = freezed,
    Object? houseLatitude = freezed,
    Object? houseLongitude = freezed,
    Object? quickOrderText = freezed,
    Object? date = freezed,
    Object? products = null,
    Object? payCheck = freezed,
    Object? paymentMethod = null,
    Object? shopData = freezed,
    Object? subBasement = freezed,
    Object? doNotDistirb = freezed,
    Object? floor = freezed,
    Object? apartment = freezed,
  }) {
    return _then(_$OrderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStampDelivery: freezed == timeStampDelivery
          ? _value.timeStampDelivery
          : timeStampDelivery // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      orderComments: freezed == orderComments
          ? _value.orderComments
          : orderComments // ignore: cast_nullable_to_non_nullable
              as String?,
      houseAddress: freezed == houseAddress
          ? _value.houseAddress
          : houseAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      houseLatitude: freezed == houseLatitude
          ? _value.houseLatitude
          : houseLatitude // ignore: cast_nullable_to_non_nullable
              as double?,
      houseLongitude: freezed == houseLongitude
          ? _value.houseLongitude
          : houseLongitude // ignore: cast_nullable_to_non_nullable
              as double?,
      quickOrderText: freezed == quickOrderText
          ? _value.quickOrderText
          : quickOrderText // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      payCheck: freezed == payCheck
          ? _value.payCheck
          : payCheck // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      shopData: freezed == shopData
          ? _value.shopData
          : shopData // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      subBasement: freezed == subBasement
          ? _value.subBasement
          : subBasement // ignore: cast_nullable_to_non_nullable
              as String?,
      doNotDistirb: freezed == doNotDistirb
          ? _value.doNotDistirb
          : doNotDistirb // ignore: cast_nullable_to_non_nullable
              as bool?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      apartment: freezed == apartment
          ? _value.apartment
          : apartment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  const _$OrderModelImpl(
      {required this.id,
      this.price = 0,
      this.image,
      @JsonKey(name: 'timestamp_delivery') this.timeStampDelivery,
      @JsonKey(name: 'status') this.status = OrderStatus.pending,
      @JsonKey(name: 'phone') this.phoneNumber,
      @JsonKey(name: 'comment') this.orderComments,
      @JsonKey(name: 'address') this.houseAddress,
      @JsonKey(name: 'latitude') this.houseLatitude,
      @JsonKey(name: 'longitude') this.houseLongitude,
      @JsonKey(name: 'fast_order') this.quickOrderText,
      this.date,
      @JsonKey(name: 'products') final List<ProductModel> products = const [],
      @JsonKey(name: 'pay_check') this.payCheck,
      @JsonKey(name: 'payment_type') this.paymentMethod = PaymentMethod.cash,
      @JsonKey(name: 'shopа') this.shopData,
      @JsonKey(name: 'sub_basement') this.subBasement,
      @JsonKey(name: 'do_not_disturb') this.doNotDistirb,
      this.floor,
      this.apartment})
      : _products = products;

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final int price;
  @override
  final String? image;
  @override
  @JsonKey(name: 'timestamp_delivery')
  final String? timeStampDelivery;
  @override
  @JsonKey(name: 'status')
  final OrderStatus status;
  @override
  @JsonKey(name: 'phone')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'comment')
  final String? orderComments;
  @override
  @JsonKey(name: 'address')
  final String? houseAddress;
  @override
  @JsonKey(name: 'latitude')
  final double? houseLatitude;
  @override
  @JsonKey(name: 'longitude')
  final double? houseLongitude;
// final String? storeAddress,
// final double? storeLatitude,
// final double? storeLongitude,
  @override
  @JsonKey(name: 'fast_order')
  final String? quickOrderText;
  @override
  final DateTime? date;
  final List<ProductModel> _products;
  @override
  @JsonKey(name: 'products')
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey(name: 'pay_check')
  final String? payCheck;
  @override
  @JsonKey(name: 'payment_type')
  final PaymentMethod paymentMethod;
  @override
  @JsonKey(name: 'shopа')
  final ProfileModel? shopData;
  @override
  @JsonKey(name: 'sub_basement')
  final String? subBasement;
  @override
  @JsonKey(name: 'do_not_disturb')
  final bool? doNotDistirb;
  @override
  final String? floor;
  @override
  final String? apartment;

  @override
  String toString() {
    return 'OrderModel(id: $id, price: $price, image: $image, timeStampDelivery: $timeStampDelivery, status: $status, phoneNumber: $phoneNumber, orderComments: $orderComments, houseAddress: $houseAddress, houseLatitude: $houseLatitude, houseLongitude: $houseLongitude, quickOrderText: $quickOrderText, date: $date, products: $products, payCheck: $payCheck, paymentMethod: $paymentMethod, shopData: $shopData, subBasement: $subBasement, doNotDistirb: $doNotDistirb, floor: $floor, apartment: $apartment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.timeStampDelivery, timeStampDelivery) ||
                other.timeStampDelivery == timeStampDelivery) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.orderComments, orderComments) ||
                other.orderComments == orderComments) &&
            (identical(other.houseAddress, houseAddress) ||
                other.houseAddress == houseAddress) &&
            (identical(other.houseLatitude, houseLatitude) ||
                other.houseLatitude == houseLatitude) &&
            (identical(other.houseLongitude, houseLongitude) ||
                other.houseLongitude == houseLongitude) &&
            (identical(other.quickOrderText, quickOrderText) ||
                other.quickOrderText == quickOrderText) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.payCheck, payCheck) ||
                other.payCheck == payCheck) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.shopData, shopData) ||
                other.shopData == shopData) &&
            (identical(other.subBasement, subBasement) ||
                other.subBasement == subBasement) &&
            (identical(other.doNotDistirb, doNotDistirb) ||
                other.doNotDistirb == doNotDistirb) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.apartment, apartment) ||
                other.apartment == apartment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        price,
        image,
        timeStampDelivery,
        status,
        phoneNumber,
        orderComments,
        houseAddress,
        houseLatitude,
        houseLongitude,
        quickOrderText,
        date,
        const DeepCollectionEquality().hash(_products),
        payCheck,
        paymentMethod,
        shopData,
        subBasement,
        doNotDistirb,
        floor,
        apartment
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {required final int id,
      final int price,
      final String? image,
      @JsonKey(name: 'timestamp_delivery') final String? timeStampDelivery,
      @JsonKey(name: 'status') final OrderStatus status,
      @JsonKey(name: 'phone') final String? phoneNumber,
      @JsonKey(name: 'comment') final String? orderComments,
      @JsonKey(name: 'address') final String? houseAddress,
      @JsonKey(name: 'latitude') final double? houseLatitude,
      @JsonKey(name: 'longitude') final double? houseLongitude,
      @JsonKey(name: 'fast_order') final String? quickOrderText,
      final DateTime? date,
      @JsonKey(name: 'products') final List<ProductModel> products,
      @JsonKey(name: 'pay_check') final String? payCheck,
      @JsonKey(name: 'payment_type') final PaymentMethod paymentMethod,
      @JsonKey(name: 'shopа') final ProfileModel? shopData,
      @JsonKey(name: 'sub_basement') final String? subBasement,
      @JsonKey(name: 'do_not_disturb') final bool? doNotDistirb,
      final String? floor,
      final String? apartment}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  int get id;
  @override
  int get price;
  @override
  String? get image;
  @override
  @JsonKey(name: 'timestamp_delivery')
  String? get timeStampDelivery;
  @override
  @JsonKey(name: 'status')
  OrderStatus get status;
  @override
  @JsonKey(name: 'phone')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'comment')
  String? get orderComments;
  @override
  @JsonKey(name: 'address')
  String? get houseAddress;
  @override
  @JsonKey(name: 'latitude')
  double? get houseLatitude;
  @override
  @JsonKey(name: 'longitude')
  double? get houseLongitude;
  @override // final String? storeAddress,
// final double? storeLatitude,
// final double? storeLongitude,
  @JsonKey(name: 'fast_order')
  String? get quickOrderText;
  @override
  DateTime? get date;
  @override
  @JsonKey(name: 'products')
  List<ProductModel> get products;
  @override
  @JsonKey(name: 'pay_check')
  String? get payCheck;
  @override
  @JsonKey(name: 'payment_type')
  PaymentMethod get paymentMethod;
  @override
  @JsonKey(name: 'shopа')
  ProfileModel? get shopData;
  @override
  @JsonKey(name: 'sub_basement')
  String? get subBasement;
  @override
  @JsonKey(name: 'do_not_disturb')
  bool? get doNotDistirb;
  @override
  String? get floor;
  @override
  String? get apartment;
  @override
  @JsonKey(ignore: true)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderDishModel _$OrderDishModelFromJson(Map<String, dynamic> json) {
  return _OrderDishModel.fromJson(json);
}

/// @nodoc
mixin _$OrderDishModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_items_dish')
  List<DishesModel> get dishes => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  OrderDishStatus get status => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'timestamp_delivery')
  String? get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'pay_check')
  String? get payCheck => throw _privateConstructorUsedError;
  @JsonKey(name: 'house_number')
  String? get houseNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'do_not_distirb')
  bool? get doNotDisturb => throw _privateConstructorUsedError;
  String? get floor => throw _privateConstructorUsedError;
  String? get apartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_basement')
  String? get entrance => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_type')
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDishModelCopyWith<OrderDishModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDishModelCopyWith<$Res> {
  factory $OrderDishModelCopyWith(
          OrderDishModel value, $Res Function(OrderDishModel) then) =
      _$OrderDishModelCopyWithImpl<$Res, OrderDishModel>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'order_items_dish') List<DishesModel> dishes,
      String? address,
      String? comment,
      @JsonKey(name: 'status') OrderDishStatus status,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'timestamp_delivery') String? timestamp,
      @JsonKey(name: 'pay_check') String? payCheck,
      @JsonKey(name: 'house_number') String? houseNumber,
      @JsonKey(name: 'do_not_distirb') bool? doNotDisturb,
      String? floor,
      String? apartment,
      @JsonKey(name: 'sub_basement') String? entrance,
      String? phone,
      @JsonKey(name: 'payment_type') PaymentMethod paymentMethod,
      int? price});
}

/// @nodoc
class _$OrderDishModelCopyWithImpl<$Res, $Val extends OrderDishModel>
    implements $OrderDishModelCopyWith<$Res> {
  _$OrderDishModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dishes = null,
    Object? address = freezed,
    Object? comment = freezed,
    Object? status = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? timestamp = freezed,
    Object? payCheck = freezed,
    Object? houseNumber = freezed,
    Object? doNotDisturb = freezed,
    Object? floor = freezed,
    Object? apartment = freezed,
    Object? entrance = freezed,
    Object? phone = freezed,
    Object? paymentMethod = null,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      dishes: null == dishes
          ? _value.dishes
          : dishes // ignore: cast_nullable_to_non_nullable
              as List<DishesModel>,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderDishStatus,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      payCheck: freezed == payCheck
          ? _value.payCheck
          : payCheck // ignore: cast_nullable_to_non_nullable
              as String?,
      houseNumber: freezed == houseNumber
          ? _value.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      doNotDisturb: freezed == doNotDisturb
          ? _value.doNotDisturb
          : doNotDisturb // ignore: cast_nullable_to_non_nullable
              as bool?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      apartment: freezed == apartment
          ? _value.apartment
          : apartment // ignore: cast_nullable_to_non_nullable
              as String?,
      entrance: freezed == entrance
          ? _value.entrance
          : entrance // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDishModelImplCopyWith<$Res>
    implements $OrderDishModelCopyWith<$Res> {
  factory _$$OrderDishModelImplCopyWith(_$OrderDishModelImpl value,
          $Res Function(_$OrderDishModelImpl) then) =
      __$$OrderDishModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'order_items_dish') List<DishesModel> dishes,
      String? address,
      String? comment,
      @JsonKey(name: 'status') OrderDishStatus status,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'timestamp_delivery') String? timestamp,
      @JsonKey(name: 'pay_check') String? payCheck,
      @JsonKey(name: 'house_number') String? houseNumber,
      @JsonKey(name: 'do_not_distirb') bool? doNotDisturb,
      String? floor,
      String? apartment,
      @JsonKey(name: 'sub_basement') String? entrance,
      String? phone,
      @JsonKey(name: 'payment_type') PaymentMethod paymentMethod,
      int? price});
}

/// @nodoc
class __$$OrderDishModelImplCopyWithImpl<$Res>
    extends _$OrderDishModelCopyWithImpl<$Res, _$OrderDishModelImpl>
    implements _$$OrderDishModelImplCopyWith<$Res> {
  __$$OrderDishModelImplCopyWithImpl(
      _$OrderDishModelImpl _value, $Res Function(_$OrderDishModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? dishes = null,
    Object? address = freezed,
    Object? comment = freezed,
    Object? status = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? timestamp = freezed,
    Object? payCheck = freezed,
    Object? houseNumber = freezed,
    Object? doNotDisturb = freezed,
    Object? floor = freezed,
    Object? apartment = freezed,
    Object? entrance = freezed,
    Object? phone = freezed,
    Object? paymentMethod = null,
    Object? price = freezed,
  }) {
    return _then(_$OrderDishModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      dishes: null == dishes
          ? _value._dishes
          : dishes // ignore: cast_nullable_to_non_nullable
              as List<DishesModel>,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderDishStatus,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      payCheck: freezed == payCheck
          ? _value.payCheck
          : payCheck // ignore: cast_nullable_to_non_nullable
              as String?,
      houseNumber: freezed == houseNumber
          ? _value.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      doNotDisturb: freezed == doNotDisturb
          ? _value.doNotDisturb
          : doNotDisturb // ignore: cast_nullable_to_non_nullable
              as bool?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      apartment: freezed == apartment
          ? _value.apartment
          : apartment // ignore: cast_nullable_to_non_nullable
              as String?,
      entrance: freezed == entrance
          ? _value.entrance
          : entrance // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDishModelImpl implements _OrderDishModel {
  const _$OrderDishModelImpl(
      {this.id,
      @JsonKey(name: 'order_items_dish')
      final List<DishesModel> dishes = const [],
      this.address,
      this.comment,
      @JsonKey(name: 'status') this.status = OrderDishStatus.paymentPending,
      this.latitude,
      this.longitude,
      @JsonKey(name: 'timestamp_delivery') this.timestamp,
      @JsonKey(name: 'pay_check') this.payCheck,
      @JsonKey(name: 'house_number') this.houseNumber,
      @JsonKey(name: 'do_not_distirb') this.doNotDisturb,
      this.floor,
      this.apartment,
      @JsonKey(name: 'sub_basement') this.entrance,
      this.phone,
      @JsonKey(name: 'payment_type') this.paymentMethod = PaymentMethod.cash,
      this.price})
      : _dishes = dishes;

  factory _$OrderDishModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDishModelImplFromJson(json);

  @override
  final int? id;
  final List<DishesModel> _dishes;
  @override
  @JsonKey(name: 'order_items_dish')
  List<DishesModel> get dishes {
    if (_dishes is EqualUnmodifiableListView) return _dishes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dishes);
  }

  @override
  final String? address;
  @override
  final String? comment;
  @override
  @JsonKey(name: 'status')
  final OrderDishStatus status;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey(name: 'timestamp_delivery')
  final String? timestamp;
  @override
  @JsonKey(name: 'pay_check')
  final String? payCheck;
  @override
  @JsonKey(name: 'house_number')
  final String? houseNumber;
  @override
  @JsonKey(name: 'do_not_distirb')
  final bool? doNotDisturb;
  @override
  final String? floor;
  @override
  final String? apartment;
  @override
  @JsonKey(name: 'sub_basement')
  final String? entrance;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'payment_type')
  final PaymentMethod paymentMethod;
  @override
  final int? price;

  @override
  String toString() {
    return 'OrderDishModel(id: $id, dishes: $dishes, address: $address, comment: $comment, status: $status, latitude: $latitude, longitude: $longitude, timestamp: $timestamp, payCheck: $payCheck, houseNumber: $houseNumber, doNotDisturb: $doNotDisturb, floor: $floor, apartment: $apartment, entrance: $entrance, phone: $phone, paymentMethod: $paymentMethod, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDishModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._dishes, _dishes) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.payCheck, payCheck) ||
                other.payCheck == payCheck) &&
            (identical(other.houseNumber, houseNumber) ||
                other.houseNumber == houseNumber) &&
            (identical(other.doNotDisturb, doNotDisturb) ||
                other.doNotDisturb == doNotDisturb) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.apartment, apartment) ||
                other.apartment == apartment) &&
            (identical(other.entrance, entrance) ||
                other.entrance == entrance) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_dishes),
      address,
      comment,
      status,
      latitude,
      longitude,
      timestamp,
      payCheck,
      houseNumber,
      doNotDisturb,
      floor,
      apartment,
      entrance,
      phone,
      paymentMethod,
      price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDishModelImplCopyWith<_$OrderDishModelImpl> get copyWith =>
      __$$OrderDishModelImplCopyWithImpl<_$OrderDishModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDishModelImplToJson(
      this,
    );
  }
}

abstract class _OrderDishModel implements OrderDishModel {
  const factory _OrderDishModel(
      {final int? id,
      @JsonKey(name: 'order_items_dish') final List<DishesModel> dishes,
      final String? address,
      final String? comment,
      @JsonKey(name: 'status') final OrderDishStatus status,
      final double? latitude,
      final double? longitude,
      @JsonKey(name: 'timestamp_delivery') final String? timestamp,
      @JsonKey(name: 'pay_check') final String? payCheck,
      @JsonKey(name: 'house_number') final String? houseNumber,
      @JsonKey(name: 'do_not_distirb') final bool? doNotDisturb,
      final String? floor,
      final String? apartment,
      @JsonKey(name: 'sub_basement') final String? entrance,
      final String? phone,
      @JsonKey(name: 'payment_type') final PaymentMethod paymentMethod,
      final int? price}) = _$OrderDishModelImpl;

  factory _OrderDishModel.fromJson(Map<String, dynamic> json) =
      _$OrderDishModelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'order_items_dish')
  List<DishesModel> get dishes;
  @override
  String? get address;
  @override
  String? get comment;
  @override
  @JsonKey(name: 'status')
  OrderDishStatus get status;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(name: 'timestamp_delivery')
  String? get timestamp;
  @override
  @JsonKey(name: 'pay_check')
  String? get payCheck;
  @override
  @JsonKey(name: 'house_number')
  String? get houseNumber;
  @override
  @JsonKey(name: 'do_not_distirb')
  bool? get doNotDisturb;
  @override
  String? get floor;
  @override
  String? get apartment;
  @override
  @JsonKey(name: 'sub_basement')
  String? get entrance;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'payment_type')
  PaymentMethod get paymentMethod;
  @override
  int? get price;
  @override
  @JsonKey(ignore: true)
  _$$OrderDishModelImplCopyWith<_$OrderDishModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DishesModel _$DishesModelFromJson(Map<String, dynamic> json) {
  return _DishesModel.fromJson(json);
}

/// @nodoc
mixin _$DishesModel {
  @JsonKey(name: "dish")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_dish')
  int? get price => throw _privateConstructorUsedError;
  double? get quantity => throw _privateConstructorUsedError;
  String? get calories => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  List<ImageModel>? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DishesModelCopyWith<DishesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishesModelCopyWith<$Res> {
  factory $DishesModelCopyWith(
          DishesModel value, $Res Function(DishesModel) then) =
      _$DishesModelCopyWithImpl<$Res, DishesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "dish") String? name,
      @JsonKey(name: 'price_dish') int? price,
      double? quantity,
      String? calories,
      @JsonKey(name: 'images') List<ImageModel>? image});
}

/// @nodoc
class _$DishesModelCopyWithImpl<$Res, $Val extends DishesModel>
    implements $DishesModelCopyWith<$Res> {
  _$DishesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? calories = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DishesModelImplCopyWith<$Res>
    implements $DishesModelCopyWith<$Res> {
  factory _$$DishesModelImplCopyWith(
          _$DishesModelImpl value, $Res Function(_$DishesModelImpl) then) =
      __$$DishesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "dish") String? name,
      @JsonKey(name: 'price_dish') int? price,
      double? quantity,
      String? calories,
      @JsonKey(name: 'images') List<ImageModel>? image});
}

/// @nodoc
class __$$DishesModelImplCopyWithImpl<$Res>
    extends _$DishesModelCopyWithImpl<$Res, _$DishesModelImpl>
    implements _$$DishesModelImplCopyWith<$Res> {
  __$$DishesModelImplCopyWithImpl(
      _$DishesModelImpl _value, $Res Function(_$DishesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? calories = freezed,
    Object? image = freezed,
  }) {
    return _then(_$DishesModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DishesModelImpl implements _DishesModel {
  const _$DishesModelImpl(
      {@JsonKey(name: "dish") this.name,
      @JsonKey(name: 'price_dish') this.price,
      this.quantity,
      this.calories,
      @JsonKey(name: 'images') final List<ImageModel>? image})
      : _image = image;

  factory _$DishesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DishesModelImplFromJson(json);

  @override
  @JsonKey(name: "dish")
  final String? name;
  @override
  @JsonKey(name: 'price_dish')
  final int? price;
  @override
  final double? quantity;
  @override
  final String? calories;
  final List<ImageModel>? _image;
  @override
  @JsonKey(name: 'images')
  List<ImageModel>? get image {
    final value = _image;
    if (value == null) return null;
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DishesModel(name: $name, price: $price, quantity: $quantity, calories: $calories, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DishesModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            const DeepCollectionEquality().equals(other._image, _image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, price, quantity, calories,
      const DeepCollectionEquality().hash(_image));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DishesModelImplCopyWith<_$DishesModelImpl> get copyWith =>
      __$$DishesModelImplCopyWithImpl<_$DishesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DishesModelImplToJson(
      this,
    );
  }
}

abstract class _DishesModel implements DishesModel {
  const factory _DishesModel(
          {@JsonKey(name: "dish") final String? name,
          @JsonKey(name: 'price_dish') final int? price,
          final double? quantity,
          final String? calories,
          @JsonKey(name: 'images') final List<ImageModel>? image}) =
      _$DishesModelImpl;

  factory _DishesModel.fromJson(Map<String, dynamic> json) =
      _$DishesModelImpl.fromJson;

  @override
  @JsonKey(name: "dish")
  String? get name;
  @override
  @JsonKey(name: 'price_dish')
  int? get price;
  @override
  double? get quantity;
  @override
  String? get calories;
  @override
  @JsonKey(name: 'images')
  List<ImageModel>? get image;
  @override
  @JsonKey(ignore: true)
  _$$DishesModelImplCopyWith<_$DishesModelImpl> get copyWith =>
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
