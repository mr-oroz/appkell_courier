// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      email: json['email'] as String?,
      fio: json['full_name'] as String?,
      phone: json['phone'] as String?,
      shopName: json['shop_name'] as String?,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']) ?? Role.courier,
      address: json['address'] as String?,
      avatar: json['photo'] as String?,
      totalSales: json['total_sales_amount'] as int?,
      isWorked: json['is_worked'] as bool? ?? false,
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      requisites: (json['deposit_details'] as List<dynamic>?)
              ?.map((e) => RequisiteModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      moderationConfirmationStatus: $enumDecodeNullable(
              _$ModerationConfirmationStatusEnumMap,
              json['moderation_confirmation_status']) ??
          ModerationConfirmationStatus.pending,
      isHasShopInfo: json['is_has_shop_info'] as bool? ?? false,
      entityFile: json['entity_file'] as String?,
      workTimeFrom: json['work_time_from'] as String?,
      workTimeTo: json['work_time_to'] as String?,
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'full_name': instance.fio,
      'phone': instance.phone,
      'shop_name': instance.shopName,
      'role': _$RoleEnumMap[instance.role]!,
      'address': instance.address,
      'photo': instance.avatar,
      'total_sales_amount': instance.totalSales,
      'is_worked': instance.isWorked,
      'orders': instance.orders,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'deposit_details': instance.requisites,
      'moderation_confirmation_status': _$ModerationConfirmationStatusEnumMap[
          instance.moderationConfirmationStatus],
      'is_has_shop_info': instance.isHasShopInfo,
      'entity_file': instance.entityFile,
      'work_time_from': instance.workTimeFrom,
      'work_time_to': instance.workTimeTo,
    };

const _$RoleEnumMap = {
  Role.courier: 'courier',
  Role.salesman: 'shop',
  Role.restaurant: 'restaurant',
  Role.user: 'user',
};

const _$ModerationConfirmationStatusEnumMap = {
  ModerationConfirmationStatus.none: null,
  ModerationConfirmationStatus.pending: 'pending',
  ModerationConfirmationStatus.approved: 'approved',
  ModerationConfirmationStatus.rejected: 'rejected',
};

_$RequisiteModelImpl _$$RequisiteModelImplFromJson(Map<String, dynamic> json) =>
    _$RequisiteModelImpl(
      id: json['id'] as String,
      title: json['title'] as String?,
      nums: json['nums'] as String?,
    );

Map<String, dynamic> _$$RequisiteModelImplToJson(
        _$RequisiteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'nums': instance.nums,
    };
