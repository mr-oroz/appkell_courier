import 'package:freezed_annotation/freezed_annotation.dart';

import 'order_model.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

enum Role {
  @JsonValue('courier')
  courier,
  @JsonValue('shop')
  salesman,
  @JsonValue('restaurant')
  restaurant,
  @JsonValue('user')
  user;

  bool get isCourier => this == courier;
  bool get isSalesman => this == salesman;
  bool get isRestaurant => this == restaurant;
  bool get isUser => this == user;
}

enum ModerationConfirmationStatus {
  @JsonValue(null)
  none,
  @JsonValue('pending')
  pending,
  @JsonValue('approved')
  approved,
  @JsonValue('rejected')
  rejected;

  bool get isPending => this == pending;
  bool get isApproved => this == approved;
  bool get isRejected => this == rejected;
}

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    final String? email,
    @JsonKey(name: 'full_name') final String? fio,
    final String? phone,
    @JsonKey(name: 'shop_name') final String? shopName,
    @Default(Role.courier) final Role role,
    final String? address,
    @JsonKey(name: 'photo') final String? avatar,
    @JsonKey(name: 'total_sales_amount') final int? totalSales,
    @Default(false) @JsonKey(name: 'is_worked') final bool isWorked,
    @Default([]) final List<OrderModel> orders,
    final double? latitude,
    final double? longitude,
    @JsonKey(name: 'deposit_details')
    @Default([])
    final List<RequisiteModel> requisites,
    @JsonKey(name: 'moderation_confirmation_status')
    @Default(ModerationConfirmationStatus.pending)
    final ModerationConfirmationStatus moderationConfirmationStatus,
    @JsonKey(name: 'is_has_shop_info') @Default(false) final bool isHasShopInfo,
    @JsonKey(name: 'entity_file') final String? entityFile,
    @JsonKey(name: 'work_time_from') final String? workTimeFrom,
    @JsonKey(name: 'work_time_to') final String? workTimeTo,

  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@freezed
class RequisiteModel with _$RequisiteModel {
  const factory RequisiteModel({
    required String id,
    final String? title,
    final String? nums,
  }) = _RequisiteModel;

  factory RequisiteModel.fromJson(Map<String, dynamic> json) =>
      _$RequisiteModelFromJson(json);
}
