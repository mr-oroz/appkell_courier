import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_model.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    @JsonKey(name: 'file') final String? image,
    final int? product,
    final String? title,
    final String? description,
    @JsonKey(name: 'created_at') final DateTime? date,
    @JsonKey(name: 'is_read') @Default(false) final bool isRead,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
