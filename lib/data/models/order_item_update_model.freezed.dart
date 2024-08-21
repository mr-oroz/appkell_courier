// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_update_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderItemUpdateModel _$OrderItemUpdateModelFromJson(Map<String, dynamic> json) {
  return _OrderItemUpdateModel.fromJson(json);
}

/// @nodoc
mixin _$OrderItemUpdateModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  double get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemUpdateModelCopyWith<OrderItemUpdateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemUpdateModelCopyWith<$Res> {
  factory $OrderItemUpdateModelCopyWith(OrderItemUpdateModel value,
          $Res Function(OrderItemUpdateModel) then) =
      _$OrderItemUpdateModelCopyWithImpl<$Res, OrderItemUpdateModel>;
  @useResult
  $Res call({int id, @JsonKey(name: 'quantity') double weight});
}

/// @nodoc
class _$OrderItemUpdateModelCopyWithImpl<$Res,
        $Val extends OrderItemUpdateModel>
    implements $OrderItemUpdateModelCopyWith<$Res> {
  _$OrderItemUpdateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weight = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemUpdateModelImplCopyWith<$Res>
    implements $OrderItemUpdateModelCopyWith<$Res> {
  factory _$$OrderItemUpdateModelImplCopyWith(_$OrderItemUpdateModelImpl value,
          $Res Function(_$OrderItemUpdateModelImpl) then) =
      __$$OrderItemUpdateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, @JsonKey(name: 'quantity') double weight});
}

/// @nodoc
class __$$OrderItemUpdateModelImplCopyWithImpl<$Res>
    extends _$OrderItemUpdateModelCopyWithImpl<$Res, _$OrderItemUpdateModelImpl>
    implements _$$OrderItemUpdateModelImplCopyWith<$Res> {
  __$$OrderItemUpdateModelImplCopyWithImpl(_$OrderItemUpdateModelImpl _value,
      $Res Function(_$OrderItemUpdateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weight = null,
  }) {
    return _then(_$OrderItemUpdateModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemUpdateModelImpl implements _OrderItemUpdateModel {
  const _$OrderItemUpdateModelImpl(
      {required this.id, @JsonKey(name: 'quantity') required this.weight});

  factory _$OrderItemUpdateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemUpdateModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'quantity')
  final double weight;

  @override
  String toString() {
    return 'OrderItemUpdateModel(id: $id, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemUpdateModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, weight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemUpdateModelImplCopyWith<_$OrderItemUpdateModelImpl>
      get copyWith =>
          __$$OrderItemUpdateModelImplCopyWithImpl<_$OrderItemUpdateModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemUpdateModelImplToJson(
      this,
    );
  }
}

abstract class _OrderItemUpdateModel implements OrderItemUpdateModel {
  const factory _OrderItemUpdateModel(
          {required final int id,
          @JsonKey(name: 'quantity') required final double weight}) =
      _$OrderItemUpdateModelImpl;

  factory _OrderItemUpdateModel.fromJson(Map<String, dynamic> json) =
      _$OrderItemUpdateModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'quantity')
  double get weight;
  @override
  @JsonKey(ignore: true)
  _$$OrderItemUpdateModelImplCopyWith<_$OrderItemUpdateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
