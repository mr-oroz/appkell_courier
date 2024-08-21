// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fio => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'shop_name')
  String? get shopName => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_sales_amount')
  int? get totalSales => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_worked')
  bool get isWorked => throw _privateConstructorUsedError;
  List<OrderModel> get orders => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'deposit_details')
  List<RequisiteModel> get requisites => throw _privateConstructorUsedError;
  @JsonKey(name: 'moderation_confirmation_status')
  ModerationConfirmationStatus get moderationConfirmationStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'is_has_shop_info')
  bool get isHasShopInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_file')
  String? get entityFile => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_time_from')
  String? get workTimeFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'work_time_to')
  String? get workTimeTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call(
      {String? email,
      @JsonKey(name: 'full_name') String? fio,
      String? phone,
      @JsonKey(name: 'shop_name') String? shopName,
      Role role,
      String? address,
      @JsonKey(name: 'photo') String? avatar,
      @JsonKey(name: 'total_sales_amount') int? totalSales,
      @JsonKey(name: 'is_worked') bool isWorked,
      List<OrderModel> orders,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'deposit_details') List<RequisiteModel> requisites,
      @JsonKey(name: 'moderation_confirmation_status')
      ModerationConfirmationStatus moderationConfirmationStatus,
      @JsonKey(name: 'is_has_shop_info') bool isHasShopInfo,
      @JsonKey(name: 'entity_file') String? entityFile,
      @JsonKey(name: 'work_time_from') String? workTimeFrom,
      @JsonKey(name: 'work_time_to') String? workTimeTo});
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? fio = freezed,
    Object? phone = freezed,
    Object? shopName = freezed,
    Object? role = null,
    Object? address = freezed,
    Object? avatar = freezed,
    Object? totalSales = freezed,
    Object? isWorked = null,
    Object? orders = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? requisites = null,
    Object? moderationConfirmationStatus = null,
    Object? isHasShopInfo = null,
    Object? entityFile = freezed,
    Object? workTimeFrom = freezed,
    Object? workTimeTo = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      fio: freezed == fio
          ? _value.fio
          : fio // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      shopName: freezed == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSales: freezed == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int?,
      isWorked: null == isWorked
          ? _value.isWorked
          : isWorked // ignore: cast_nullable_to_non_nullable
              as bool,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      requisites: null == requisites
          ? _value.requisites
          : requisites // ignore: cast_nullable_to_non_nullable
              as List<RequisiteModel>,
      moderationConfirmationStatus: null == moderationConfirmationStatus
          ? _value.moderationConfirmationStatus
          : moderationConfirmationStatus // ignore: cast_nullable_to_non_nullable
              as ModerationConfirmationStatus,
      isHasShopInfo: null == isHasShopInfo
          ? _value.isHasShopInfo
          : isHasShopInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      entityFile: freezed == entityFile
          ? _value.entityFile
          : entityFile // ignore: cast_nullable_to_non_nullable
              as String?,
      workTimeFrom: freezed == workTimeFrom
          ? _value.workTimeFrom
          : workTimeFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      workTimeTo: freezed == workTimeTo
          ? _value.workTimeTo
          : workTimeTo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileModelImplCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$ProfileModelImplCopyWith(
          _$ProfileModelImpl value, $Res Function(_$ProfileModelImpl) then) =
      __$$ProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      @JsonKey(name: 'full_name') String? fio,
      String? phone,
      @JsonKey(name: 'shop_name') String? shopName,
      Role role,
      String? address,
      @JsonKey(name: 'photo') String? avatar,
      @JsonKey(name: 'total_sales_amount') int? totalSales,
      @JsonKey(name: 'is_worked') bool isWorked,
      List<OrderModel> orders,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'deposit_details') List<RequisiteModel> requisites,
      @JsonKey(name: 'moderation_confirmation_status')
      ModerationConfirmationStatus moderationConfirmationStatus,
      @JsonKey(name: 'is_has_shop_info') bool isHasShopInfo,
      @JsonKey(name: 'entity_file') String? entityFile,
      @JsonKey(name: 'work_time_from') String? workTimeFrom,
      @JsonKey(name: 'work_time_to') String? workTimeTo});
}

/// @nodoc
class __$$ProfileModelImplCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$ProfileModelImpl>
    implements _$$ProfileModelImplCopyWith<$Res> {
  __$$ProfileModelImplCopyWithImpl(
      _$ProfileModelImpl _value, $Res Function(_$ProfileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? fio = freezed,
    Object? phone = freezed,
    Object? shopName = freezed,
    Object? role = null,
    Object? address = freezed,
    Object? avatar = freezed,
    Object? totalSales = freezed,
    Object? isWorked = null,
    Object? orders = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? requisites = null,
    Object? moderationConfirmationStatus = null,
    Object? isHasShopInfo = null,
    Object? entityFile = freezed,
    Object? workTimeFrom = freezed,
    Object? workTimeTo = freezed,
  }) {
    return _then(_$ProfileModelImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      fio: freezed == fio
          ? _value.fio
          : fio // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      shopName: freezed == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSales: freezed == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int?,
      isWorked: null == isWorked
          ? _value.isWorked
          : isWorked // ignore: cast_nullable_to_non_nullable
              as bool,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      requisites: null == requisites
          ? _value._requisites
          : requisites // ignore: cast_nullable_to_non_nullable
              as List<RequisiteModel>,
      moderationConfirmationStatus: null == moderationConfirmationStatus
          ? _value.moderationConfirmationStatus
          : moderationConfirmationStatus // ignore: cast_nullable_to_non_nullable
              as ModerationConfirmationStatus,
      isHasShopInfo: null == isHasShopInfo
          ? _value.isHasShopInfo
          : isHasShopInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      entityFile: freezed == entityFile
          ? _value.entityFile
          : entityFile // ignore: cast_nullable_to_non_nullable
              as String?,
      workTimeFrom: freezed == workTimeFrom
          ? _value.workTimeFrom
          : workTimeFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      workTimeTo: freezed == workTimeTo
          ? _value.workTimeTo
          : workTimeTo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileModelImpl implements _ProfileModel {
  const _$ProfileModelImpl(
      {this.email,
      @JsonKey(name: 'full_name') this.fio,
      this.phone,
      @JsonKey(name: 'shop_name') this.shopName,
      this.role = Role.courier,
      this.address,
      @JsonKey(name: 'photo') this.avatar,
      @JsonKey(name: 'total_sales_amount') this.totalSales,
      @JsonKey(name: 'is_worked') this.isWorked = false,
      final List<OrderModel> orders = const [],
      this.latitude,
      this.longitude,
      @JsonKey(name: 'deposit_details')
      final List<RequisiteModel> requisites = const [],
      @JsonKey(name: 'moderation_confirmation_status')
      this.moderationConfirmationStatus = ModerationConfirmationStatus.pending,
      @JsonKey(name: 'is_has_shop_info') this.isHasShopInfo = false,
      @JsonKey(name: 'entity_file') this.entityFile,
      @JsonKey(name: 'work_time_from') this.workTimeFrom,
      @JsonKey(name: 'work_time_to') this.workTimeTo})
      : _orders = orders,
        _requisites = requisites;

  factory _$ProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileModelImplFromJson(json);

  @override
  final String? email;
  @override
  @JsonKey(name: 'full_name')
  final String? fio;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'shop_name')
  final String? shopName;
  @override
  @JsonKey()
  final Role role;
  @override
  final String? address;
  @override
  @JsonKey(name: 'photo')
  final String? avatar;
  @override
  @JsonKey(name: 'total_sales_amount')
  final int? totalSales;
  @override
  @JsonKey(name: 'is_worked')
  final bool isWorked;
  final List<OrderModel> _orders;
  @override
  @JsonKey()
  List<OrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  final double? latitude;
  @override
  final double? longitude;
  final List<RequisiteModel> _requisites;
  @override
  @JsonKey(name: 'deposit_details')
  List<RequisiteModel> get requisites {
    if (_requisites is EqualUnmodifiableListView) return _requisites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_requisites);
  }

  @override
  @JsonKey(name: 'moderation_confirmation_status')
  final ModerationConfirmationStatus moderationConfirmationStatus;
  @override
  @JsonKey(name: 'is_has_shop_info')
  final bool isHasShopInfo;
  @override
  @JsonKey(name: 'entity_file')
  final String? entityFile;
  @override
  @JsonKey(name: 'work_time_from')
  final String? workTimeFrom;
  @override
  @JsonKey(name: 'work_time_to')
  final String? workTimeTo;

  @override
  String toString() {
    return 'ProfileModel(email: $email, fio: $fio, phone: $phone, shopName: $shopName, role: $role, address: $address, avatar: $avatar, totalSales: $totalSales, isWorked: $isWorked, orders: $orders, latitude: $latitude, longitude: $longitude, requisites: $requisites, moderationConfirmationStatus: $moderationConfirmationStatus, isHasShopInfo: $isHasShopInfo, entityFile: $entityFile, workTimeFrom: $workTimeFrom, workTimeTo: $workTimeTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fio, fio) || other.fio == fio) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.isWorked, isWorked) ||
                other.isWorked == isWorked) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality()
                .equals(other._requisites, _requisites) &&
            (identical(other.moderationConfirmationStatus,
                    moderationConfirmationStatus) ||
                other.moderationConfirmationStatus ==
                    moderationConfirmationStatus) &&
            (identical(other.isHasShopInfo, isHasShopInfo) ||
                other.isHasShopInfo == isHasShopInfo) &&
            (identical(other.entityFile, entityFile) ||
                other.entityFile == entityFile) &&
            (identical(other.workTimeFrom, workTimeFrom) ||
                other.workTimeFrom == workTimeFrom) &&
            (identical(other.workTimeTo, workTimeTo) ||
                other.workTimeTo == workTimeTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      fio,
      phone,
      shopName,
      role,
      address,
      avatar,
      totalSales,
      isWorked,
      const DeepCollectionEquality().hash(_orders),
      latitude,
      longitude,
      const DeepCollectionEquality().hash(_requisites),
      moderationConfirmationStatus,
      isHasShopInfo,
      entityFile,
      workTimeFrom,
      workTimeTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      __$$ProfileModelImplCopyWithImpl<_$ProfileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileModel implements ProfileModel {
  const factory _ProfileModel(
      {final String? email,
      @JsonKey(name: 'full_name') final String? fio,
      final String? phone,
      @JsonKey(name: 'shop_name') final String? shopName,
      final Role role,
      final String? address,
      @JsonKey(name: 'photo') final String? avatar,
      @JsonKey(name: 'total_sales_amount') final int? totalSales,
      @JsonKey(name: 'is_worked') final bool isWorked,
      final List<OrderModel> orders,
      final double? latitude,
      final double? longitude,
      @JsonKey(name: 'deposit_details') final List<RequisiteModel> requisites,
      @JsonKey(name: 'moderation_confirmation_status')
      final ModerationConfirmationStatus moderationConfirmationStatus,
      @JsonKey(name: 'is_has_shop_info') final bool isHasShopInfo,
      @JsonKey(name: 'entity_file') final String? entityFile,
      @JsonKey(name: 'work_time_from') final String? workTimeFrom,
      @JsonKey(name: 'work_time_to')
      final String? workTimeTo}) = _$ProfileModelImpl;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$ProfileModelImpl.fromJson;

  @override
  String? get email;
  @override
  @JsonKey(name: 'full_name')
  String? get fio;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'shop_name')
  String? get shopName;
  @override
  Role get role;
  @override
  String? get address;
  @override
  @JsonKey(name: 'photo')
  String? get avatar;
  @override
  @JsonKey(name: 'total_sales_amount')
  int? get totalSales;
  @override
  @JsonKey(name: 'is_worked')
  bool get isWorked;
  @override
  List<OrderModel> get orders;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(name: 'deposit_details')
  List<RequisiteModel> get requisites;
  @override
  @JsonKey(name: 'moderation_confirmation_status')
  ModerationConfirmationStatus get moderationConfirmationStatus;
  @override
  @JsonKey(name: 'is_has_shop_info')
  bool get isHasShopInfo;
  @override
  @JsonKey(name: 'entity_file')
  String? get entityFile;
  @override
  @JsonKey(name: 'work_time_from')
  String? get workTimeFrom;
  @override
  @JsonKey(name: 'work_time_to')
  String? get workTimeTo;
  @override
  @JsonKey(ignore: true)
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RequisiteModel _$RequisiteModelFromJson(Map<String, dynamic> json) {
  return _RequisiteModel.fromJson(json);
}

/// @nodoc
mixin _$RequisiteModel {
  String get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get nums => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequisiteModelCopyWith<RequisiteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequisiteModelCopyWith<$Res> {
  factory $RequisiteModelCopyWith(
          RequisiteModel value, $Res Function(RequisiteModel) then) =
      _$RequisiteModelCopyWithImpl<$Res, RequisiteModel>;
  @useResult
  $Res call({String id, String? title, String? nums});
}

/// @nodoc
class _$RequisiteModelCopyWithImpl<$Res, $Val extends RequisiteModel>
    implements $RequisiteModelCopyWith<$Res> {
  _$RequisiteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? nums = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      nums: freezed == nums
          ? _value.nums
          : nums // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequisiteModelImplCopyWith<$Res>
    implements $RequisiteModelCopyWith<$Res> {
  factory _$$RequisiteModelImplCopyWith(_$RequisiteModelImpl value,
          $Res Function(_$RequisiteModelImpl) then) =
      __$$RequisiteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? title, String? nums});
}

/// @nodoc
class __$$RequisiteModelImplCopyWithImpl<$Res>
    extends _$RequisiteModelCopyWithImpl<$Res, _$RequisiteModelImpl>
    implements _$$RequisiteModelImplCopyWith<$Res> {
  __$$RequisiteModelImplCopyWithImpl(
      _$RequisiteModelImpl _value, $Res Function(_$RequisiteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? nums = freezed,
  }) {
    return _then(_$RequisiteModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      nums: freezed == nums
          ? _value.nums
          : nums // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequisiteModelImpl implements _RequisiteModel {
  const _$RequisiteModelImpl({required this.id, this.title, this.nums});

  factory _$RequisiteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequisiteModelImplFromJson(json);

  @override
  final String id;
  @override
  final String? title;
  @override
  final String? nums;

  @override
  String toString() {
    return 'RequisiteModel(id: $id, title: $title, nums: $nums)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequisiteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.nums, nums) || other.nums == nums));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, nums);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequisiteModelImplCopyWith<_$RequisiteModelImpl> get copyWith =>
      __$$RequisiteModelImplCopyWithImpl<_$RequisiteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequisiteModelImplToJson(
      this,
    );
  }
}

abstract class _RequisiteModel implements RequisiteModel {
  const factory _RequisiteModel(
      {required final String id,
      final String? title,
      final String? nums}) = _$RequisiteModelImpl;

  factory _RequisiteModel.fromJson(Map<String, dynamic> json) =
      _$RequisiteModelImpl.fromJson;

  @override
  String get id;
  @override
  String? get title;
  @override
  String? get nums;
  @override
  @JsonKey(ignore: true)
  _$$RequisiteModelImplCopyWith<_$RequisiteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
