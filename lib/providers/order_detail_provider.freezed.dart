// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderDetailState {
  OrderModel? get order => throw _privateConstructorUsedError;
  DurationTimersModel? get timers => throw _privateConstructorUsedError;
  bool? get isClosed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDetailStateCopyWith<OrderDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailStateCopyWith<$Res> {
  factory $OrderDetailStateCopyWith(
          OrderDetailState value, $Res Function(OrderDetailState) then) =
      _$OrderDetailStateCopyWithImpl<$Res, OrderDetailState>;
  @useResult
  $Res call({OrderModel? order, DurationTimersModel? timers, bool? isClosed});

  $OrderModelCopyWith<$Res>? get order;
  $DurationTimersModelCopyWith<$Res>? get timers;
}

/// @nodoc
class _$OrderDetailStateCopyWithImpl<$Res, $Val extends OrderDetailState>
    implements $OrderDetailStateCopyWith<$Res> {
  _$OrderDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = freezed,
    Object? timers = freezed,
    Object? isClosed = freezed,
  }) {
    return _then(_value.copyWith(
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
      timers: freezed == timers
          ? _value.timers
          : timers // ignore: cast_nullable_to_non_nullable
              as DurationTimersModel?,
      isClosed: freezed == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<$Res>? get order {
    if (_value.order == null) {
      return null;
    }

    return $OrderModelCopyWith<$Res>(_value.order!, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DurationTimersModelCopyWith<$Res>? get timers {
    if (_value.timers == null) {
      return null;
    }

    return $DurationTimersModelCopyWith<$Res>(_value.timers!, (value) {
      return _then(_value.copyWith(timers: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderStateImplCopyWith<$Res>
    implements $OrderDetailStateCopyWith<$Res> {
  factory _$$OrderStateImplCopyWith(
          _$OrderStateImpl value, $Res Function(_$OrderStateImpl) then) =
      __$$OrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderModel? order, DurationTimersModel? timers, bool? isClosed});

  @override
  $OrderModelCopyWith<$Res>? get order;
  @override
  $DurationTimersModelCopyWith<$Res>? get timers;
}

/// @nodoc
class __$$OrderStateImplCopyWithImpl<$Res>
    extends _$OrderDetailStateCopyWithImpl<$Res, _$OrderStateImpl>
    implements _$$OrderStateImplCopyWith<$Res> {
  __$$OrderStateImplCopyWithImpl(
      _$OrderStateImpl _value, $Res Function(_$OrderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = freezed,
    Object? timers = freezed,
    Object? isClosed = freezed,
  }) {
    return _then(_$OrderStateImpl(
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
      timers: freezed == timers
          ? _value.timers
          : timers // ignore: cast_nullable_to_non_nullable
              as DurationTimersModel?,
      isClosed: freezed == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$OrderStateImpl with DiagnosticableTreeMixin implements _OrderState {
  const _$OrderStateImpl({this.order, this.timers, this.isClosed});

  @override
  final OrderModel? order;
  @override
  final DurationTimersModel? timers;
  @override
  final bool? isClosed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OrderDetailState(order: $order, timers: $timers, isClosed: $isClosed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OrderDetailState'))
      ..add(DiagnosticsProperty('order', order))
      ..add(DiagnosticsProperty('timers', timers))
      ..add(DiagnosticsProperty('isClosed', isClosed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.timers, timers) || other.timers == timers) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order, timers, isClosed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      __$$OrderStateImplCopyWithImpl<_$OrderStateImpl>(this, _$identity);
}

abstract class _OrderState implements OrderDetailState {
  const factory _OrderState(
      {final OrderModel? order,
      final DurationTimersModel? timers,
      final bool? isClosed}) = _$OrderStateImpl;

  @override
  OrderModel? get order;
  @override
  DurationTimersModel? get timers;
  @override
  bool? get isClosed;
  @override
  @JsonKey(ignore: true)
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderDishDetailState {
  OrderDishModel? get order => throw _privateConstructorUsedError;
  DurationDishTimersModel? get timers => throw _privateConstructorUsedError;
  bool? get isClosed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDishDetailStateCopyWith<OrderDishDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDishDetailStateCopyWith<$Res> {
  factory $OrderDishDetailStateCopyWith(OrderDishDetailState value,
          $Res Function(OrderDishDetailState) then) =
      _$OrderDishDetailStateCopyWithImpl<$Res, OrderDishDetailState>;
  @useResult
  $Res call(
      {OrderDishModel? order, DurationDishTimersModel? timers, bool? isClosed});

  $OrderDishModelCopyWith<$Res>? get order;
  $DurationDishTimersModelCopyWith<$Res>? get timers;
}

/// @nodoc
class _$OrderDishDetailStateCopyWithImpl<$Res,
        $Val extends OrderDishDetailState>
    implements $OrderDishDetailStateCopyWith<$Res> {
  _$OrderDishDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = freezed,
    Object? timers = freezed,
    Object? isClosed = freezed,
  }) {
    return _then(_value.copyWith(
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderDishModel?,
      timers: freezed == timers
          ? _value.timers
          : timers // ignore: cast_nullable_to_non_nullable
              as DurationDishTimersModel?,
      isClosed: freezed == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderDishModelCopyWith<$Res>? get order {
    if (_value.order == null) {
      return null;
    }

    return $OrderDishModelCopyWith<$Res>(_value.order!, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DurationDishTimersModelCopyWith<$Res>? get timers {
    if (_value.timers == null) {
      return null;
    }

    return $DurationDishTimersModelCopyWith<$Res>(_value.timers!, (value) {
      return _then(_value.copyWith(timers: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderDishDetailStateImplCopyWith<$Res>
    implements $OrderDishDetailStateCopyWith<$Res> {
  factory _$$OrderDishDetailStateImplCopyWith(_$OrderDishDetailStateImpl value,
          $Res Function(_$OrderDishDetailStateImpl) then) =
      __$$OrderDishDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OrderDishModel? order, DurationDishTimersModel? timers, bool? isClosed});

  @override
  $OrderDishModelCopyWith<$Res>? get order;
  @override
  $DurationDishTimersModelCopyWith<$Res>? get timers;
}

/// @nodoc
class __$$OrderDishDetailStateImplCopyWithImpl<$Res>
    extends _$OrderDishDetailStateCopyWithImpl<$Res, _$OrderDishDetailStateImpl>
    implements _$$OrderDishDetailStateImplCopyWith<$Res> {
  __$$OrderDishDetailStateImplCopyWithImpl(_$OrderDishDetailStateImpl _value,
      $Res Function(_$OrderDishDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = freezed,
    Object? timers = freezed,
    Object? isClosed = freezed,
  }) {
    return _then(_$OrderDishDetailStateImpl(
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderDishModel?,
      timers: freezed == timers
          ? _value.timers
          : timers // ignore: cast_nullable_to_non_nullable
              as DurationDishTimersModel?,
      isClosed: freezed == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$OrderDishDetailStateImpl
    with DiagnosticableTreeMixin
    implements _OrderDishDetailState {
  const _$OrderDishDetailStateImpl({this.order, this.timers, this.isClosed});

  @override
  final OrderDishModel? order;
  @override
  final DurationDishTimersModel? timers;
  @override
  final bool? isClosed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OrderDishDetailState(order: $order, timers: $timers, isClosed: $isClosed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OrderDishDetailState'))
      ..add(DiagnosticsProperty('order', order))
      ..add(DiagnosticsProperty('timers', timers))
      ..add(DiagnosticsProperty('isClosed', isClosed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDishDetailStateImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.timers, timers) || other.timers == timers) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order, timers, isClosed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDishDetailStateImplCopyWith<_$OrderDishDetailStateImpl>
      get copyWith =>
          __$$OrderDishDetailStateImplCopyWithImpl<_$OrderDishDetailStateImpl>(
              this, _$identity);
}

abstract class _OrderDishDetailState implements OrderDishDetailState {
  const factory _OrderDishDetailState(
      {final OrderDishModel? order,
      final DurationDishTimersModel? timers,
      final bool? isClosed}) = _$OrderDishDetailStateImpl;

  @override
  OrderDishModel? get order;
  @override
  DurationDishTimersModel? get timers;
  @override
  bool? get isClosed;
  @override
  @JsonKey(ignore: true)
  _$$OrderDishDetailStateImplCopyWith<_$OrderDishDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
