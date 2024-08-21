// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'code_verify_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CodeVerifyModel _$CodeVerifyModelFromJson(Map<String, dynamic> json) {
  return _CodeVerifyModel.fromJson(json);
}

/// @nodoc
mixin _$CodeVerifyModel {
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CodeVerifyModelCopyWith<CodeVerifyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodeVerifyModelCopyWith<$Res> {
  factory $CodeVerifyModelCopyWith(
          CodeVerifyModel value, $Res Function(CodeVerifyModel) then) =
      _$CodeVerifyModelCopyWithImpl<$Res, CodeVerifyModel>;
  @useResult
  $Res call({String? phone, String? email, String code});
}

/// @nodoc
class _$CodeVerifyModelCopyWithImpl<$Res, $Val extends CodeVerifyModel>
    implements $CodeVerifyModelCopyWith<$Res> {
  _$CodeVerifyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = freezed,
    Object? email = freezed,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CodeVerifyModelImplCopyWith<$Res>
    implements $CodeVerifyModelCopyWith<$Res> {
  factory _$$CodeVerifyModelImplCopyWith(_$CodeVerifyModelImpl value,
          $Res Function(_$CodeVerifyModelImpl) then) =
      __$$CodeVerifyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? phone, String? email, String code});
}

/// @nodoc
class __$$CodeVerifyModelImplCopyWithImpl<$Res>
    extends _$CodeVerifyModelCopyWithImpl<$Res, _$CodeVerifyModelImpl>
    implements _$$CodeVerifyModelImplCopyWith<$Res> {
  __$$CodeVerifyModelImplCopyWithImpl(
      _$CodeVerifyModelImpl _value, $Res Function(_$CodeVerifyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = freezed,
    Object? email = freezed,
    Object? code = null,
  }) {
    return _then(_$CodeVerifyModelImpl(
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CodeVerifyModelImpl extends _CodeVerifyModel {
  const _$CodeVerifyModelImpl({this.phone, this.email, required this.code})
      : super._();

  factory _$CodeVerifyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CodeVerifyModelImplFromJson(json);

  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String code;

  @override
  String toString() {
    return 'CodeVerifyModel(phone: $phone, email: $email, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CodeVerifyModelImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phone, email, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CodeVerifyModelImplCopyWith<_$CodeVerifyModelImpl> get copyWith =>
      __$$CodeVerifyModelImplCopyWithImpl<_$CodeVerifyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CodeVerifyModelImplToJson(
      this,
    );
  }
}

abstract class _CodeVerifyModel extends CodeVerifyModel {
  const factory _CodeVerifyModel(
      {final String? phone,
      final String? email,
      required final String code}) = _$CodeVerifyModelImpl;
  const _CodeVerifyModel._() : super._();

  factory _CodeVerifyModel.fromJson(Map<String, dynamic> json) =
      _$CodeVerifyModelImpl.fromJson;

  @override
  String? get phone;
  @override
  String? get email;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$CodeVerifyModelImplCopyWith<_$CodeVerifyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
