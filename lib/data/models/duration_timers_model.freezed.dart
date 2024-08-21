// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duration_timers_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DurationTimersModel _$DurationTimersModelFromJson(Map<String, dynamic> json) {
  return _AdsModel.fromJson(json);
}

/// @nodoc
mixin _$DurationTimersModel {
  @JsonKey(name: 'preparing_timer')
  Duration? get preparing => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_pending_timer')
  Duration? get paymentPending => throw _privateConstructorUsedError;
  @JsonKey(name: 'examination_payment_timer')
  Duration? get paymentCheck => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_timer')
  Duration? get sending => throw _privateConstructorUsedError;
  @JsonKey(name: 'sending_settings')
  Duration? get sendingSettings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DurationTimersModelCopyWith<DurationTimersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationTimersModelCopyWith<$Res> {
  factory $DurationTimersModelCopyWith(
          DurationTimersModel value, $Res Function(DurationTimersModel) then) =
      _$DurationTimersModelCopyWithImpl<$Res, DurationTimersModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'preparing_timer') Duration? preparing,
      @JsonKey(name: 'payment_pending_timer') Duration? paymentPending,
      @JsonKey(name: 'examination_payment_timer') Duration? paymentCheck,
      @JsonKey(name: 'delivery_timer') Duration? sending,
      @JsonKey(name: 'sending_settings') Duration? sendingSettings});
}

/// @nodoc
class _$DurationTimersModelCopyWithImpl<$Res, $Val extends DurationTimersModel>
    implements $DurationTimersModelCopyWith<$Res> {
  _$DurationTimersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preparing = freezed,
    Object? paymentPending = freezed,
    Object? paymentCheck = freezed,
    Object? sending = freezed,
    Object? sendingSettings = freezed,
  }) {
    return _then(_value.copyWith(
      preparing: freezed == preparing
          ? _value.preparing
          : preparing // ignore: cast_nullable_to_non_nullable
              as Duration?,
      paymentPending: freezed == paymentPending
          ? _value.paymentPending
          : paymentPending // ignore: cast_nullable_to_non_nullable
              as Duration?,
      paymentCheck: freezed == paymentCheck
          ? _value.paymentCheck
          : paymentCheck // ignore: cast_nullable_to_non_nullable
              as Duration?,
      sending: freezed == sending
          ? _value.sending
          : sending // ignore: cast_nullable_to_non_nullable
              as Duration?,
      sendingSettings: freezed == sendingSettings
          ? _value.sendingSettings
          : sendingSettings // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdsModelImplCopyWith<$Res>
    implements $DurationTimersModelCopyWith<$Res> {
  factory _$$AdsModelImplCopyWith(
          _$AdsModelImpl value, $Res Function(_$AdsModelImpl) then) =
      __$$AdsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'preparing_timer') Duration? preparing,
      @JsonKey(name: 'payment_pending_timer') Duration? paymentPending,
      @JsonKey(name: 'examination_payment_timer') Duration? paymentCheck,
      @JsonKey(name: 'delivery_timer') Duration? sending,
      @JsonKey(name: 'sending_settings') Duration? sendingSettings});
}

/// @nodoc
class __$$AdsModelImplCopyWithImpl<$Res>
    extends _$DurationTimersModelCopyWithImpl<$Res, _$AdsModelImpl>
    implements _$$AdsModelImplCopyWith<$Res> {
  __$$AdsModelImplCopyWithImpl(
      _$AdsModelImpl _value, $Res Function(_$AdsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preparing = freezed,
    Object? paymentPending = freezed,
    Object? paymentCheck = freezed,
    Object? sending = freezed,
    Object? sendingSettings = freezed,
  }) {
    return _then(_$AdsModelImpl(
      preparing: freezed == preparing
          ? _value.preparing
          : preparing // ignore: cast_nullable_to_non_nullable
              as Duration?,
      paymentPending: freezed == paymentPending
          ? _value.paymentPending
          : paymentPending // ignore: cast_nullable_to_non_nullable
              as Duration?,
      paymentCheck: freezed == paymentCheck
          ? _value.paymentCheck
          : paymentCheck // ignore: cast_nullable_to_non_nullable
              as Duration?,
      sending: freezed == sending
          ? _value.sending
          : sending // ignore: cast_nullable_to_non_nullable
              as Duration?,
      sendingSettings: freezed == sendingSettings
          ? _value.sendingSettings
          : sendingSettings // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdsModelImpl implements _AdsModel {
  const _$AdsModelImpl(
      {@JsonKey(name: 'preparing_timer') this.preparing,
      @JsonKey(name: 'payment_pending_timer') this.paymentPending,
      @JsonKey(name: 'examination_payment_timer') this.paymentCheck,
      @JsonKey(name: 'delivery_timer') this.sending,
      @JsonKey(name: 'sending_settings') this.sendingSettings});

  factory _$AdsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdsModelImplFromJson(json);

  @override
  @JsonKey(name: 'preparing_timer')
  final Duration? preparing;
  @override
  @JsonKey(name: 'payment_pending_timer')
  final Duration? paymentPending;
  @override
  @JsonKey(name: 'examination_payment_timer')
  final Duration? paymentCheck;
  @override
  @JsonKey(name: 'delivery_timer')
  final Duration? sending;
  @override
  @JsonKey(name: 'sending_settings')
  final Duration? sendingSettings;

  @override
  String toString() {
    return 'DurationTimersModel(preparing: $preparing, paymentPending: $paymentPending, paymentCheck: $paymentCheck, sending: $sending, sendingSettings: $sendingSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdsModelImpl &&
            (identical(other.preparing, preparing) ||
                other.preparing == preparing) &&
            (identical(other.paymentPending, paymentPending) ||
                other.paymentPending == paymentPending) &&
            (identical(other.paymentCheck, paymentCheck) ||
                other.paymentCheck == paymentCheck) &&
            (identical(other.sending, sending) || other.sending == sending) &&
            (identical(other.sendingSettings, sendingSettings) ||
                other.sendingSettings == sendingSettings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, preparing, paymentPending,
      paymentCheck, sending, sendingSettings);

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

abstract class _AdsModel implements DurationTimersModel {
  const factory _AdsModel(
      {@JsonKey(name: 'preparing_timer') final Duration? preparing,
      @JsonKey(name: 'payment_pending_timer') final Duration? paymentPending,
      @JsonKey(name: 'examination_payment_timer') final Duration? paymentCheck,
      @JsonKey(name: 'delivery_timer') final Duration? sending,
      @JsonKey(name: 'sending_settings')
      final Duration? sendingSettings}) = _$AdsModelImpl;

  factory _AdsModel.fromJson(Map<String, dynamic> json) =
      _$AdsModelImpl.fromJson;

  @override
  @JsonKey(name: 'preparing_timer')
  Duration? get preparing;
  @override
  @JsonKey(name: 'payment_pending_timer')
  Duration? get paymentPending;
  @override
  @JsonKey(name: 'examination_payment_timer')
  Duration? get paymentCheck;
  @override
  @JsonKey(name: 'delivery_timer')
  Duration? get sending;
  @override
  @JsonKey(name: 'sending_settings')
  Duration? get sendingSettings;
  @override
  @JsonKey(ignore: true)
  _$$AdsModelImplCopyWith<_$AdsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DurationDishTimersModel _$DurationDishTimersModelFromJson(
    Map<String, dynamic> json) {
  return _AdsDishModel.fromJson(json);
}

/// @nodoc
mixin _$DurationDishTimersModel {
  @JsonKey(name: 'preparing_timer')
  Duration? get preparing => throw _privateConstructorUsedError;
  @JsonKey(name: 'courier_sending_timer')
  Duration? get courierSendingTimer => throw _privateConstructorUsedError;
  @JsonKey(name: 'sending_settings')
  Duration? get sendingSettings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DurationDishTimersModelCopyWith<DurationDishTimersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationDishTimersModelCopyWith<$Res> {
  factory $DurationDishTimersModelCopyWith(DurationDishTimersModel value,
          $Res Function(DurationDishTimersModel) then) =
      _$DurationDishTimersModelCopyWithImpl<$Res, DurationDishTimersModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'preparing_timer') Duration? preparing,
      @JsonKey(name: 'courier_sending_timer') Duration? courierSendingTimer,
      @JsonKey(name: 'sending_settings') Duration? sendingSettings});
}

/// @nodoc
class _$DurationDishTimersModelCopyWithImpl<$Res,
        $Val extends DurationDishTimersModel>
    implements $DurationDishTimersModelCopyWith<$Res> {
  _$DurationDishTimersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preparing = freezed,
    Object? courierSendingTimer = freezed,
    Object? sendingSettings = freezed,
  }) {
    return _then(_value.copyWith(
      preparing: freezed == preparing
          ? _value.preparing
          : preparing // ignore: cast_nullable_to_non_nullable
              as Duration?,
      courierSendingTimer: freezed == courierSendingTimer
          ? _value.courierSendingTimer
          : courierSendingTimer // ignore: cast_nullable_to_non_nullable
              as Duration?,
      sendingSettings: freezed == sendingSettings
          ? _value.sendingSettings
          : sendingSettings // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdsDishModelImplCopyWith<$Res>
    implements $DurationDishTimersModelCopyWith<$Res> {
  factory _$$AdsDishModelImplCopyWith(
          _$AdsDishModelImpl value, $Res Function(_$AdsDishModelImpl) then) =
      __$$AdsDishModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'preparing_timer') Duration? preparing,
      @JsonKey(name: 'courier_sending_timer') Duration? courierSendingTimer,
      @JsonKey(name: 'sending_settings') Duration? sendingSettings});
}

/// @nodoc
class __$$AdsDishModelImplCopyWithImpl<$Res>
    extends _$DurationDishTimersModelCopyWithImpl<$Res, _$AdsDishModelImpl>
    implements _$$AdsDishModelImplCopyWith<$Res> {
  __$$AdsDishModelImplCopyWithImpl(
      _$AdsDishModelImpl _value, $Res Function(_$AdsDishModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preparing = freezed,
    Object? courierSendingTimer = freezed,
    Object? sendingSettings = freezed,
  }) {
    return _then(_$AdsDishModelImpl(
      preparing: freezed == preparing
          ? _value.preparing
          : preparing // ignore: cast_nullable_to_non_nullable
              as Duration?,
      courierSendingTimer: freezed == courierSendingTimer
          ? _value.courierSendingTimer
          : courierSendingTimer // ignore: cast_nullable_to_non_nullable
              as Duration?,
      sendingSettings: freezed == sendingSettings
          ? _value.sendingSettings
          : sendingSettings // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdsDishModelImpl implements _AdsDishModel {
  const _$AdsDishModelImpl(
      {@JsonKey(name: 'preparing_timer') this.preparing,
      @JsonKey(name: 'courier_sending_timer') this.courierSendingTimer,
      @JsonKey(name: 'sending_settings') this.sendingSettings});

  factory _$AdsDishModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdsDishModelImplFromJson(json);

  @override
  @JsonKey(name: 'preparing_timer')
  final Duration? preparing;
  @override
  @JsonKey(name: 'courier_sending_timer')
  final Duration? courierSendingTimer;
  @override
  @JsonKey(name: 'sending_settings')
  final Duration? sendingSettings;

  @override
  String toString() {
    return 'DurationDishTimersModel(preparing: $preparing, courierSendingTimer: $courierSendingTimer, sendingSettings: $sendingSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdsDishModelImpl &&
            (identical(other.preparing, preparing) ||
                other.preparing == preparing) &&
            (identical(other.courierSendingTimer, courierSendingTimer) ||
                other.courierSendingTimer == courierSendingTimer) &&
            (identical(other.sendingSettings, sendingSettings) ||
                other.sendingSettings == sendingSettings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, preparing, courierSendingTimer, sendingSettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdsDishModelImplCopyWith<_$AdsDishModelImpl> get copyWith =>
      __$$AdsDishModelImplCopyWithImpl<_$AdsDishModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdsDishModelImplToJson(
      this,
    );
  }
}

abstract class _AdsDishModel implements DurationDishTimersModel {
  const factory _AdsDishModel(
          {@JsonKey(name: 'preparing_timer') final Duration? preparing,
          @JsonKey(name: 'courier_sending_timer')
          final Duration? courierSendingTimer,
          @JsonKey(name: 'sending_settings') final Duration? sendingSettings}) =
      _$AdsDishModelImpl;

  factory _AdsDishModel.fromJson(Map<String, dynamic> json) =
      _$AdsDishModelImpl.fromJson;

  @override
  @JsonKey(name: 'preparing_timer')
  Duration? get preparing;
  @override
  @JsonKey(name: 'courier_sending_timer')
  Duration? get courierSendingTimer;
  @override
  @JsonKey(name: 'sending_settings')
  Duration? get sendingSettings;
  @override
  @JsonKey(ignore: true)
  _$$AdsDishModelImplCopyWith<_$AdsDishModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
