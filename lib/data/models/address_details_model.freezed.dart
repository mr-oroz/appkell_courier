// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressDetailsModel _$AddressDetailsModelFromJson(Map<String, dynamic> json) {
  return _AddressDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$AddressDetailsModel {
  String? get streetName => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;
  String? get floor => throw _privateConstructorUsedError;
  String? get apartment => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressDetailsModelCopyWith<AddressDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDetailsModelCopyWith<$Res> {
  factory $AddressDetailsModelCopyWith(
          AddressDetailsModel value, $Res Function(AddressDetailsModel) then) =
      _$AddressDetailsModelCopyWithImpl<$Res, AddressDetailsModel>;
  @useResult
  $Res call(
      {String? streetName,
      String? number,
      String? floor,
      String? apartment,
      double? latitude,
      double? longitude});
}

/// @nodoc
class _$AddressDetailsModelCopyWithImpl<$Res, $Val extends AddressDetailsModel>
    implements $AddressDetailsModelCopyWith<$Res> {
  _$AddressDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streetName = freezed,
    Object? number = freezed,
    Object? floor = freezed,
    Object? apartment = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      streetName: freezed == streetName
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      apartment: freezed == apartment
          ? _value.apartment
          : apartment // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressDetailsModelImplCopyWith<$Res>
    implements $AddressDetailsModelCopyWith<$Res> {
  factory _$$AddressDetailsModelImplCopyWith(_$AddressDetailsModelImpl value,
          $Res Function(_$AddressDetailsModelImpl) then) =
      __$$AddressDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? streetName,
      String? number,
      String? floor,
      String? apartment,
      double? latitude,
      double? longitude});
}

/// @nodoc
class __$$AddressDetailsModelImplCopyWithImpl<$Res>
    extends _$AddressDetailsModelCopyWithImpl<$Res, _$AddressDetailsModelImpl>
    implements _$$AddressDetailsModelImplCopyWith<$Res> {
  __$$AddressDetailsModelImplCopyWithImpl(_$AddressDetailsModelImpl _value,
      $Res Function(_$AddressDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streetName = freezed,
    Object? number = freezed,
    Object? floor = freezed,
    Object? apartment = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$AddressDetailsModelImpl(
      streetName: freezed == streetName
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      floor: freezed == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String?,
      apartment: freezed == apartment
          ? _value.apartment
          : apartment // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressDetailsModelImpl implements _AddressDetailsModel {
  const _$AddressDetailsModelImpl(
      {this.streetName,
      this.number,
      this.floor,
      this.apartment,
      this.latitude,
      this.longitude});

  factory _$AddressDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressDetailsModelImplFromJson(json);

  @override
  final String? streetName;
  @override
  final String? number;
  @override
  final String? floor;
  @override
  final String? apartment;
  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'AddressDetailsModel(streetName: $streetName, number: $number, floor: $floor, apartment: $apartment, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressDetailsModelImpl &&
            (identical(other.streetName, streetName) ||
                other.streetName == streetName) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.apartment, apartment) ||
                other.apartment == apartment) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, streetName, number, floor, apartment, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressDetailsModelImplCopyWith<_$AddressDetailsModelImpl> get copyWith =>
      __$$AddressDetailsModelImplCopyWithImpl<_$AddressDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _AddressDetailsModel implements AddressDetailsModel {
  const factory _AddressDetailsModel(
      {final String? streetName,
      final String? number,
      final String? floor,
      final String? apartment,
      final double? latitude,
      final double? longitude}) = _$AddressDetailsModelImpl;

  factory _AddressDetailsModel.fromJson(Map<String, dynamic> json) =
      _$AddressDetailsModelImpl.fromJson;

  @override
  String? get streetName;
  @override
  String? get number;
  @override
  String? get floor;
  @override
  String? get apartment;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(ignore: true)
  _$$AddressDetailsModelImplCopyWith<_$AddressDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
