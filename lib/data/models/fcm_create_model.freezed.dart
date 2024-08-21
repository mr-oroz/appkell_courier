// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fcm_create_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FcmCreateModel _$FcmCreateModelFromJson(Map<String, dynamic> json) {
  return _FcmCreateModel.fromJson(json);
}

/// @nodoc
mixin _$FcmCreateModel {
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'registration_id')
  String get registrationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_id')
  String? get deviceId => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FcmCreateModelCopyWith<FcmCreateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FcmCreateModelCopyWith<$Res> {
  factory $FcmCreateModelCopyWith(
          FcmCreateModel value, $Res Function(FcmCreateModel) then) =
      _$FcmCreateModelCopyWithImpl<$Res, FcmCreateModel>;
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: 'registration_id') String registrationId,
      @JsonKey(name: 'device_id') String? deviceId,
      bool? active,
      String type});
}

/// @nodoc
class _$FcmCreateModelCopyWithImpl<$Res, $Val extends FcmCreateModel>
    implements $FcmCreateModelCopyWith<$Res> {
  _$FcmCreateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? registrationId = null,
    Object? deviceId = freezed,
    Object? active = freezed,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationId: null == registrationId
          ? _value.registrationId
          : registrationId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FcmCreateModelImplCopyWith<$Res>
    implements $FcmCreateModelCopyWith<$Res> {
  factory _$$FcmCreateModelImplCopyWith(_$FcmCreateModelImpl value,
          $Res Function(_$FcmCreateModelImpl) then) =
      __$$FcmCreateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: 'registration_id') String registrationId,
      @JsonKey(name: 'device_id') String? deviceId,
      bool? active,
      String type});
}

/// @nodoc
class __$$FcmCreateModelImplCopyWithImpl<$Res>
    extends _$FcmCreateModelCopyWithImpl<$Res, _$FcmCreateModelImpl>
    implements _$$FcmCreateModelImplCopyWith<$Res> {
  __$$FcmCreateModelImplCopyWithImpl(
      _$FcmCreateModelImpl _value, $Res Function(_$FcmCreateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? registrationId = null,
    Object? deviceId = freezed,
    Object? active = freezed,
    Object? type = null,
  }) {
    return _then(_$FcmCreateModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationId: null == registrationId
          ? _value.registrationId
          : registrationId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FcmCreateModelImpl implements _FcmCreateModel {
  const _$FcmCreateModelImpl(
      {this.name,
      @JsonKey(name: 'registration_id') required this.registrationId,
      @JsonKey(name: 'device_id') this.deviceId,
      this.active = true,
      required this.type});

  factory _$FcmCreateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FcmCreateModelImplFromJson(json);

  @override
  final String? name;
  @override
  @JsonKey(name: 'registration_id')
  final String registrationId;
  @override
  @JsonKey(name: 'device_id')
  final String? deviceId;
  @override
  @JsonKey()
  final bool? active;
  @override
  final String type;

  @override
  String toString() {
    return 'FcmCreateModel(name: $name, registrationId: $registrationId, deviceId: $deviceId, active: $active, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FcmCreateModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.registrationId, registrationId) ||
                other.registrationId == registrationId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, registrationId, deviceId, active, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FcmCreateModelImplCopyWith<_$FcmCreateModelImpl> get copyWith =>
      __$$FcmCreateModelImplCopyWithImpl<_$FcmCreateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FcmCreateModelImplToJson(
      this,
    );
  }
}

abstract class _FcmCreateModel implements FcmCreateModel {
  const factory _FcmCreateModel(
      {final String? name,
      @JsonKey(name: 'registration_id') required final String registrationId,
      @JsonKey(name: 'device_id') final String? deviceId,
      final bool? active,
      required final String type}) = _$FcmCreateModelImpl;

  factory _FcmCreateModel.fromJson(Map<String, dynamic> json) =
      _$FcmCreateModelImpl.fromJson;

  @override
  String? get name;
  @override
  @JsonKey(name: 'registration_id')
  String get registrationId;
  @override
  @JsonKey(name: 'device_id')
  String? get deviceId;
  @override
  bool? get active;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$FcmCreateModelImplCopyWith<_$FcmCreateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
