// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChangePasswordModel _$ChangePasswordModelFromJson(Map<String, dynamic> json) {
  return _AdsModel.fromJson(json);
}

/// @nodoc
mixin _$ChangePasswordModel {
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'password2')
  String? get password2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangePasswordModelCopyWith<ChangePasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordModelCopyWith<$Res> {
  factory $ChangePasswordModelCopyWith(
          ChangePasswordModel value, $Res Function(ChangePasswordModel) then) =
      _$ChangePasswordModelCopyWithImpl<$Res, ChangePasswordModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'email') String? email,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'password') String? password,
      @JsonKey(name: 'password2') String? password2,
      @JsonKey(name: 'code') String? code});
}

/// @nodoc
class _$ChangePasswordModelCopyWithImpl<$Res, $Val extends ChangePasswordModel>
    implements $ChangePasswordModelCopyWith<$Res> {
  _$ChangePasswordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? password2 = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      password2: freezed == password2
          ? _value.password2
          : password2 // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdsModelImplCopyWith<$Res>
    implements $ChangePasswordModelCopyWith<$Res> {
  factory _$$AdsModelImplCopyWith(
          _$AdsModelImpl value, $Res Function(_$AdsModelImpl) then) =
      __$$AdsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'email') String? email,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'password') String? password,
      @JsonKey(name: 'password2') String? password2,
      @JsonKey(name: 'code') String? code});
}

/// @nodoc
class __$$AdsModelImplCopyWithImpl<$Res>
    extends _$ChangePasswordModelCopyWithImpl<$Res, _$AdsModelImpl>
    implements _$$AdsModelImplCopyWith<$Res> {
  __$$AdsModelImplCopyWithImpl(
      _$AdsModelImpl _value, $Res Function(_$AdsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? phone = freezed,
    Object? password = freezed,
    Object? password2 = freezed,
    Object? code = freezed,
  }) {
    return _then(_$AdsModelImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      password2: freezed == password2
          ? _value.password2
          : password2 // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdsModelImpl extends _AdsModel {
  const _$AdsModelImpl(
      {@JsonKey(name: 'email') this.email,
      @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'password') this.password,
      @JsonKey(name: 'password2') this.password2,
      @JsonKey(name: 'code') this.code})
      : super._();

  factory _$AdsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdsModelImplFromJson(json);

  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'password')
  final String? password;
  @override
  @JsonKey(name: 'password2')
  final String? password2;
  @override
  @JsonKey(name: 'code')
  final String? code;

  @override
  String toString() {
    return 'ChangePasswordModel(email: $email, phone: $phone, password: $password, password2: $password2, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdsModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.password2, password2) ||
                other.password2 == password2) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, phone, password, password2, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdsModelImplCopyWith<_$AdsModelImpl> get copyWith =>
      __$$AdsModelImplCopyWithImpl<_$AdsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdsModelImplToJson(
      this,
    );
  }
}

abstract class _AdsModel extends ChangePasswordModel {
  const factory _AdsModel(
      {@JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'phone') final String? phone,
      @JsonKey(name: 'password') final String? password,
      @JsonKey(name: 'password2') final String? password2,
      @JsonKey(name: 'code') final String? code}) = _$AdsModelImpl;
  const _AdsModel._() : super._();

  factory _AdsModel.fromJson(Map<String, dynamic> json) =
      _$AdsModelImpl.fromJson;

  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'password')
  String? get password;
  @override
  @JsonKey(name: 'password2')
  String? get password2;
  @override
  @JsonKey(name: 'code')
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$AdsModelImplCopyWith<_$AdsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
