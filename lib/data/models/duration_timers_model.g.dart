// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duration_timers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdsModelImpl _$$AdsModelImplFromJson(Map<String, dynamic> json) =>
    _$AdsModelImpl(
      preparing: json['preparing_timer'] == null
          ? null
          : Duration(microseconds: json['preparing_timer'] as int),
      paymentPending: json['payment_pending_timer'] == null
          ? null
          : Duration(microseconds: json['payment_pending_timer'] as int),
      paymentCheck: json['examination_payment_timer'] == null
          ? null
          : Duration(microseconds: json['examination_payment_timer'] as int),
      sending: json['delivery_timer'] == null
          ? null
          : Duration(microseconds: json['delivery_timer'] as int),
      sendingSettings: json['sending_settings'] == null
          ? null
          : Duration(microseconds: json['sending_settings'] as int),
    );

Map<String, dynamic> _$$AdsModelImplToJson(_$AdsModelImpl instance) =>
    <String, dynamic>{
      'preparing_timer': instance.preparing?.inMicroseconds,
      'payment_pending_timer': instance.paymentPending?.inMicroseconds,
      'examination_payment_timer': instance.paymentCheck?.inMicroseconds,
      'delivery_timer': instance.sending?.inMicroseconds,
      'sending_settings': instance.sendingSettings?.inMicroseconds,
    };

_$AdsDishModelImpl _$$AdsDishModelImplFromJson(Map<String, dynamic> json) =>
    _$AdsDishModelImpl(
      preparing: json['preparing_timer'] == null
          ? null
          : Duration(microseconds: json['preparing_timer'] as int),
      courierSendingTimer: json['courier_sending_timer'] == null
          ? null
          : Duration(microseconds: json['courier_sending_timer'] as int),
      sendingSettings: json['sending_settings'] == null
          ? null
          : Duration(microseconds: json['sending_settings'] as int),
    );

Map<String, dynamic> _$$AdsDishModelImplToJson(_$AdsDishModelImpl instance) =>
    <String, dynamic>{
      'preparing_timer': instance.preparing?.inMicroseconds,
      'courier_sending_timer': instance.courierSendingTimer?.inMicroseconds,
      'sending_settings': instance.sendingSettings?.inMicroseconds,
    };
