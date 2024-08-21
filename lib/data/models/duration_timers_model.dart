// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duration_timers_model.freezed.dart';
part 'duration_timers_model.g.dart';

@freezed
class DurationTimersModel with _$DurationTimersModel {
  const factory DurationTimersModel({
    @JsonKey(name: 'preparing_timer') final Duration? preparing,
    @JsonKey(name: 'payment_pending_timer') final Duration? paymentPending,
    @JsonKey(name: 'examination_payment_timer') final Duration? paymentCheck,
    @JsonKey(name: 'delivery_timer') final Duration? sending,
    @JsonKey(name: 'sending_settings') final Duration? sendingSettings,
  }) = _AdsModel;

  factory DurationTimersModel.fromJson(Map<String, dynamic> json) =>
      _$DurationTimersModelFromJson(json);
}

@freezed
class DurationDishTimersModel with _$DurationDishTimersModel {
  const factory DurationDishTimersModel({
    @JsonKey(name: 'preparing_timer') final Duration? preparing,
    @JsonKey(name: 'courier_sending_timer') final Duration? courierSendingTimer,
    @JsonKey(name: 'sending_settings') final Duration? sendingSettings,
  }) = _AdsDishModel;

  factory DurationDishTimersModel.fromJson(Map<String, dynamic> json) =>
      _$DurationDishTimersModelFromJson(json);
}
