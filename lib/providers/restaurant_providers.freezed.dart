// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RestaurantState {
  int? get selectedIndex => throw _privateConstructorUsedError;
  int? get selectedIndexCategory => throw _privateConstructorUsedError;
  int? get selectedRadius => throw _privateConstructorUsedError;
  int? get selectedCategory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestaurantStateCopyWith<RestaurantState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantStateCopyWith<$Res> {
  factory $RestaurantStateCopyWith(
          RestaurantState value, $Res Function(RestaurantState) then) =
      _$RestaurantStateCopyWithImpl<$Res, RestaurantState>;
  @useResult
  $Res call(
      {int? selectedIndex,
      int? selectedIndexCategory,
      int? selectedRadius,
      int? selectedCategory});
}

/// @nodoc
class _$RestaurantStateCopyWithImpl<$Res, $Val extends RestaurantState>
    implements $RestaurantStateCopyWith<$Res> {
  _$RestaurantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = freezed,
    Object? selectedIndexCategory = freezed,
    Object? selectedRadius = freezed,
    Object? selectedCategory = freezed,
  }) {
    return _then(_value.copyWith(
      selectedIndex: freezed == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedIndexCategory: freezed == selectedIndexCategory
          ? _value.selectedIndexCategory
          : selectedIndexCategory // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedRadius: freezed == selectedRadius
          ? _value.selectedRadius
          : selectedRadius // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantStateImplCopyWith<$Res>
    implements $RestaurantStateCopyWith<$Res> {
  factory _$$RestaurantStateImplCopyWith(_$RestaurantStateImpl value,
          $Res Function(_$RestaurantStateImpl) then) =
      __$$RestaurantStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? selectedIndex,
      int? selectedIndexCategory,
      int? selectedRadius,
      int? selectedCategory});
}

/// @nodoc
class __$$RestaurantStateImplCopyWithImpl<$Res>
    extends _$RestaurantStateCopyWithImpl<$Res, _$RestaurantStateImpl>
    implements _$$RestaurantStateImplCopyWith<$Res> {
  __$$RestaurantStateImplCopyWithImpl(
      _$RestaurantStateImpl _value, $Res Function(_$RestaurantStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = freezed,
    Object? selectedIndexCategory = freezed,
    Object? selectedRadius = freezed,
    Object? selectedCategory = freezed,
  }) {
    return _then(_$RestaurantStateImpl(
      selectedIndex: freezed == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedIndexCategory: freezed == selectedIndexCategory
          ? _value.selectedIndexCategory
          : selectedIndexCategory // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedRadius: freezed == selectedRadius
          ? _value.selectedRadius
          : selectedRadius // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$RestaurantStateImpl implements _RestaurantState {
  const _$RestaurantStateImpl(
      {this.selectedIndex = null,
      this.selectedIndexCategory = null,
      this.selectedRadius = null,
      this.selectedCategory = null});

  @override
  @JsonKey()
  final int? selectedIndex;
  @override
  @JsonKey()
  final int? selectedIndexCategory;
  @override
  @JsonKey()
  final int? selectedRadius;
  @override
  @JsonKey()
  final int? selectedCategory;

  @override
  String toString() {
    return 'RestaurantState(selectedIndex: $selectedIndex, selectedIndexCategory: $selectedIndexCategory, selectedRadius: $selectedRadius, selectedCategory: $selectedCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantStateImpl &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.selectedIndexCategory, selectedIndexCategory) ||
                other.selectedIndexCategory == selectedIndexCategory) &&
            (identical(other.selectedRadius, selectedRadius) ||
                other.selectedRadius == selectedRadius) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedIndex,
      selectedIndexCategory, selectedRadius, selectedCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantStateImplCopyWith<_$RestaurantStateImpl> get copyWith =>
      __$$RestaurantStateImplCopyWithImpl<_$RestaurantStateImpl>(
          this, _$identity);
}

abstract class _RestaurantState implements RestaurantState {
  const factory _RestaurantState(
      {final int? selectedIndex,
      final int? selectedIndexCategory,
      final int? selectedRadius,
      final int? selectedCategory}) = _$RestaurantStateImpl;

  @override
  int? get selectedIndex;
  @override
  int? get selectedIndexCategory;
  @override
  int? get selectedRadius;
  @override
  int? get selectedCategory;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantStateImplCopyWith<_$RestaurantStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
