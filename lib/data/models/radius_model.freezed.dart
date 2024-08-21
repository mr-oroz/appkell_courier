// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radius_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RadiusModel _$RadiusModelFromJson(Map<String, dynamic> json) {
  return _RadiusModel.fromJson(json);
}

/// @nodoc
mixin _$RadiusModel {
  int? get id => throw _privateConstructorUsedError;
  int? get radius => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RadiusModelCopyWith<RadiusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RadiusModelCopyWith<$Res> {
  factory $RadiusModelCopyWith(
          RadiusModel value, $Res Function(RadiusModel) then) =
      _$RadiusModelCopyWithImpl<$Res, RadiusModel>;
  @useResult
  $Res call({int? id, int? radius});
}

/// @nodoc
class _$RadiusModelCopyWithImpl<$Res, $Val extends RadiusModel>
    implements $RadiusModelCopyWith<$Res> {
  _$RadiusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? radius = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RadiusModelImplCopyWith<$Res>
    implements $RadiusModelCopyWith<$Res> {
  factory _$$RadiusModelImplCopyWith(
          _$RadiusModelImpl value, $Res Function(_$RadiusModelImpl) then) =
      __$$RadiusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, int? radius});
}

/// @nodoc
class __$$RadiusModelImplCopyWithImpl<$Res>
    extends _$RadiusModelCopyWithImpl<$Res, _$RadiusModelImpl>
    implements _$$RadiusModelImplCopyWith<$Res> {
  __$$RadiusModelImplCopyWithImpl(
      _$RadiusModelImpl _value, $Res Function(_$RadiusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? radius = freezed,
  }) {
    return _then(_$RadiusModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RadiusModelImpl implements _RadiusModel {
  const _$RadiusModelImpl({this.id, this.radius});

  factory _$RadiusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RadiusModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? radius;

  @override
  String toString() {
    return 'RadiusModel(id: $id, radius: $radius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadiusModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, radius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RadiusModelImplCopyWith<_$RadiusModelImpl> get copyWith =>
      __$$RadiusModelImplCopyWithImpl<_$RadiusModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RadiusModelImplToJson(
      this,
    );
  }
}

abstract class _RadiusModel implements RadiusModel {
  const factory _RadiusModel({final int? id, final int? radius}) =
      _$RadiusModelImpl;

  factory _RadiusModel.fromJson(Map<String, dynamic> json) =
      _$RadiusModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get radius;
  @override
  @JsonKey(ignore: true)
  _$$RadiusModelImplCopyWith<_$RadiusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
