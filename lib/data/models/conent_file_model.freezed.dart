// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conent_file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentFileModel _$ContentFileModelFromJson(Map<String, dynamic> json) {
  return _ContentFileModel.fromJson(json);
}

/// @nodoc
mixin _$ContentFileModel {
  String? get id => throw _privateConstructorUsedError;
  String? get thumbnailPath => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  File? get media => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentFileModelCopyWith<ContentFileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentFileModelCopyWith<$Res> {
  factory $ContentFileModelCopyWith(
          ContentFileModel value, $Res Function(ContentFileModel) then) =
      _$ContentFileModelCopyWithImpl<$Res, ContentFileModel>;
  @useResult
  $Res call(
      {String? id,
      String? thumbnailPath,
      @JsonKey(includeToJson: false, includeFromJson: false) File? media,
      bool isActive});
}

/// @nodoc
class _$ContentFileModelCopyWithImpl<$Res, $Val extends ContentFileModel>
    implements $ContentFileModelCopyWith<$Res> {
  _$ContentFileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? thumbnailPath = freezed,
    Object? media = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailPath: freezed == thumbnailPath
          ? _value.thumbnailPath
          : thumbnailPath // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as File?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentFileModelImplCopyWith<$Res>
    implements $ContentFileModelCopyWith<$Res> {
  factory _$$ContentFileModelImplCopyWith(_$ContentFileModelImpl value,
          $Res Function(_$ContentFileModelImpl) then) =
      __$$ContentFileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? thumbnailPath,
      @JsonKey(includeToJson: false, includeFromJson: false) File? media,
      bool isActive});
}

/// @nodoc
class __$$ContentFileModelImplCopyWithImpl<$Res>
    extends _$ContentFileModelCopyWithImpl<$Res, _$ContentFileModelImpl>
    implements _$$ContentFileModelImplCopyWith<$Res> {
  __$$ContentFileModelImplCopyWithImpl(_$ContentFileModelImpl _value,
      $Res Function(_$ContentFileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? thumbnailPath = freezed,
    Object? media = freezed,
    Object? isActive = null,
  }) {
    return _then(_$ContentFileModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailPath: freezed == thumbnailPath
          ? _value.thumbnailPath
          : thumbnailPath // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as File?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentFileModelImpl implements _ContentFileModel {
  const _$ContentFileModelImpl(
      {this.id,
      this.thumbnailPath,
      @JsonKey(includeToJson: false, includeFromJson: false) this.media,
      this.isActive = false});

  factory _$ContentFileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentFileModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? thumbnailPath;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final File? media;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'ContentFileModel(id: $id, thumbnailPath: $thumbnailPath, media: $media, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentFileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.thumbnailPath, thumbnailPath) ||
                other.thumbnailPath == thumbnailPath) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, thumbnailPath, media, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentFileModelImplCopyWith<_$ContentFileModelImpl> get copyWith =>
      __$$ContentFileModelImplCopyWithImpl<_$ContentFileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentFileModelImplToJson(
      this,
    );
  }
}

abstract class _ContentFileModel implements ContentFileModel {
  const factory _ContentFileModel(
      {final String? id,
      final String? thumbnailPath,
      @JsonKey(includeToJson: false, includeFromJson: false) final File? media,
      final bool isActive}) = _$ContentFileModelImpl;

  factory _ContentFileModel.fromJson(Map<String, dynamic> json) =
      _$ContentFileModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get thumbnailPath;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  File? get media;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$ContentFileModelImplCopyWith<_$ContentFileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentModel _$ContentModelFromJson(Map<String, dynamic> json) {
  return _ContentModel.fromJson(json);
}

/// @nodoc
mixin _$ContentModel {
  int? get user => throw _privateConstructorUsedError;
  String? get file => throw _privateConstructorUsedError;
  String? get dish => throw _privateConstructorUsedError;
  int? get product => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentModelCopyWith<ContentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentModelCopyWith<$Res> {
  factory $ContentModelCopyWith(
          ContentModel value, $Res Function(ContentModel) then) =
      _$ContentModelCopyWithImpl<$Res, ContentModel>;
  @useResult
  $Res call(
      {int? user,
      String? file,
      String? dish,
      int? product,
      String? description,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class _$ContentModelCopyWithImpl<$Res, $Val extends ContentModel>
    implements $ContentModelCopyWith<$Res> {
  _$ContentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? file = freezed,
    Object? dish = freezed,
    Object? product = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      dish: freezed == dish
          ? _value.dish
          : dish // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentModelImplCopyWith<$Res>
    implements $ContentModelCopyWith<$Res> {
  factory _$$ContentModelImplCopyWith(
          _$ContentModelImpl value, $Res Function(_$ContentModelImpl) then) =
      __$$ContentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? user,
      String? file,
      String? dish,
      int? product,
      String? description,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class __$$ContentModelImplCopyWithImpl<$Res>
    extends _$ContentModelCopyWithImpl<$Res, _$ContentModelImpl>
    implements _$$ContentModelImplCopyWith<$Res> {
  __$$ContentModelImplCopyWithImpl(
      _$ContentModelImpl _value, $Res Function(_$ContentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? file = freezed,
    Object? dish = freezed,
    Object? product = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ContentModelImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      dish: freezed == dish
          ? _value.dish
          : dish // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentModelImpl implements _ContentModel {
  const _$ContentModelImpl(
      {this.user,
      this.file,
      this.dish,
      this.product,
      this.description,
      @JsonKey(name: 'created_at') this.createdAt = null});

  factory _$ContentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentModelImplFromJson(json);

  @override
  final int? user;
  @override
  final String? file;
  @override
  final String? dish;
  @override
  final int? product;
  @override
  final String? description;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'ContentModel(user: $user, file: $file, dish: $dish, product: $product, description: $description, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.dish, dish) || other.dish == dish) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, user, file, dish, product, description, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentModelImplCopyWith<_$ContentModelImpl> get copyWith =>
      __$$ContentModelImplCopyWithImpl<_$ContentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentModelImplToJson(
      this,
    );
  }
}

abstract class _ContentModel implements ContentModel {
  const factory _ContentModel(
          {final int? user,
          final String? file,
          final String? dish,
          final int? product,
          final String? description,
          @JsonKey(name: 'created_at') final String? createdAt}) =
      _$ContentModelImpl;

  factory _ContentModel.fromJson(Map<String, dynamic> json) =
      _$ContentModelImpl.fromJson;

  @override
  int? get user;
  @override
  String? get file;
  @override
  String? get dish;
  @override
  int? get product;
  @override
  String? get description;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ContentModelImplCopyWith<_$ContentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
