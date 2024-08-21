// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_credentials_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCredentialsModel _$UserCredentialsModelFromJson(Map<String, dynamic> json) {
  return _AdsModel.fromJson(json);
}

/// @nodoc
mixin _$UserCredentialsModel {
  @JsonKey(name: 'full_name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'token')
  String? get idToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'role')
  String? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCredentialsModelCopyWith<UserCredentialsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCredentialsModelCopyWith<$Res> {
  factory $UserCredentialsModelCopyWith(UserCredentialsModel value,
          $Res Function(UserCredentialsModel) then) =
      _$UserCredentialsModelCopyWithImpl<$Res, UserCredentialsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'full_name') String? name,
      @JsonKey(name: 'token') String? idToken,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'role') String? role});
}

/// @nodoc
class _$UserCredentialsModelCopyWithImpl<$Res,
        $Val extends UserCredentialsModel>
    implements $UserCredentialsModelCopyWith<$Res> {
  _$UserCredentialsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? idToken = freezed,
    Object? email = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdsModelImplCopyWith<$Res>
    implements $UserCredentialsModelCopyWith<$Res> {
  factory _$$AdsModelImplCopyWith(
          _$AdsModelImpl value, $Res Function(_$AdsModelImpl) then) =
      __$$AdsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'full_name') String? name,
      @JsonKey(name: 'token') String? idToken,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'role') String? role});
}

/// @nodoc
class __$$AdsModelImplCopyWithImpl<$Res>
    extends _$UserCredentialsModelCopyWithImpl<$Res, _$AdsModelImpl>
    implements _$$AdsModelImplCopyWith<$Res> {
  __$$AdsModelImplCopyWithImpl(
      _$AdsModelImpl _value, $Res Function(_$AdsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? idToken = freezed,
    Object? email = freezed,
    Object? role = freezed,
  }) {
    return _then(_$AdsModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdsModelImpl implements _AdsModel {
  const _$AdsModelImpl(
      {@JsonKey(name: 'full_name') this.name,
      @JsonKey(name: 'token') this.idToken,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'role') this.role});

  factory _$AdsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdsModelImplFromJson(json);

  @override
  @JsonKey(name: 'full_name')
  final String? name;
  @override
  @JsonKey(name: 'token')
  final String? idToken;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'role')
  final String? role;

  @override
  String toString() {
    return 'UserCredentialsModel(name: $name, idToken: $idToken, email: $email, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdsModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, idToken, email, role);

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

abstract class _AdsModel implements UserCredentialsModel {
  const factory _AdsModel(
      {@JsonKey(name: 'full_name') final String? name,
      @JsonKey(name: 'token') final String? idToken,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'role') final String? role}) = _$AdsModelImpl;

  factory _AdsModel.fromJson(Map<String, dynamic> json) =
      _$AdsModelImpl.fromJson;

  @override
  @JsonKey(name: 'full_name')
  String? get name;
  @override
  @JsonKey(name: 'token')
  String? get idToken;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'role')
  String? get role;
  @override
  @JsonKey(ignore: true)
  _$$AdsModelImplCopyWith<_$AdsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
