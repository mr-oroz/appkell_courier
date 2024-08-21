// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as int,
      price: json['price'] as int? ?? 0,
      image: json['image'] as String?,
      timeStampDelivery: json['timestamp_delivery'] as String?,
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']) ??
          OrderStatus.pending,
      phoneNumber: json['phone'] as String?,
      orderComments: json['comment'] as String?,
      houseAddress: json['address'] as String?,
      houseLatitude: (json['latitude'] as num?)?.toDouble(),
      houseLongitude: (json['longitude'] as num?)?.toDouble(),
      quickOrderText: json['fast_order'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      payCheck: json['pay_check'] as String?,
      paymentMethod:
          $enumDecodeNullable(_$PaymentMethodEnumMap, json['payment_type']) ??
              PaymentMethod.cash,
      shopData: json['shopа'] == null
          ? null
          : ProfileModel.fromJson(json['shopа'] as Map<String, dynamic>),
      subBasement: json['sub_basement'] as String?,
      doNotDistirb: json['do_not_disturb'] as bool?,
      floor: json['floor'] as String?,
      apartment: json['apartment'] as String?,
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'image': instance.image,
      'timestamp_delivery': instance.timeStampDelivery,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'phone': instance.phoneNumber,
      'comment': instance.orderComments,
      'address': instance.houseAddress,
      'latitude': instance.houseLatitude,
      'longitude': instance.houseLongitude,
      'fast_order': instance.quickOrderText,
      'date': instance.date?.toIso8601String(),
      'products': instance.products,
      'pay_check': instance.payCheck,
      'payment_type': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'shopа': instance.shopData,
      'sub_basement': instance.subBasement,
      'do_not_disturb': instance.doNotDistirb,
      'floor': instance.floor,
      'apartment': instance.apartment,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.preparing: 'preparing',
  OrderStatus.paymentPending: 'payment_pending',
  OrderStatus.paymentCheck: 'payment_check',
  OrderStatus.planned: 'planned',
  OrderStatus.searchCourier: 'search_courier',
  OrderStatus.sending: 'sending',
  OrderStatus.delivered: 'delivered',
  OrderStatus.canceled: 'canceled',
  OrderStatus.canceledByClient: 'canceled_by_client',
  OrderStatus.canceledByShop: 'canceled_by_shop',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.wallet: 'wallet',
};

_$OrderDishModelImpl _$$OrderDishModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderDishModelImpl(
      id: json['id'] as int?,
      dishes: (json['order_items_dish'] as List<dynamic>?)
              ?.map((e) => DishesModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      address: json['address'] as String?,
      comment: json['comment'] as String?,
      status: $enumDecodeNullable(_$OrderDishStatusEnumMap, json['status']) ??
          OrderDishStatus.paymentPending,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      timestamp: json['timestamp_delivery'] as String?,
      payCheck: json['pay_check'] as String?,
      houseNumber: json['house_number'] as String?,
      doNotDisturb: json['do_not_distirb'] as bool?,
      floor: json['floor'] as String?,
      apartment: json['apartment'] as String?,
      entrance: json['sub_basement'] as String?,
      phone: json['phone'] as String?,
      paymentMethod:
          $enumDecodeNullable(_$PaymentMethodEnumMap, json['payment_type']) ??
              PaymentMethod.cash,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$$OrderDishModelImplToJson(
        _$OrderDishModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_items_dish': instance.dishes,
      'address': instance.address,
      'comment': instance.comment,
      'status': _$OrderDishStatusEnumMap[instance.status]!,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timestamp_delivery': instance.timestamp,
      'pay_check': instance.payCheck,
      'house_number': instance.houseNumber,
      'do_not_distirb': instance.doNotDisturb,
      'floor': instance.floor,
      'apartment': instance.apartment,
      'sub_basement': instance.entrance,
      'phone': instance.phone,
      'payment_type': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'price': instance.price,
    };

const _$OrderDishStatusEnumMap = {
  OrderDishStatus.pending: 'pending',
  OrderDishStatus.preparing: 'preparing',
  OrderDishStatus.paymentPending: 'payment_pending',
  OrderDishStatus.paymentCheck: 'payment_check',
  OrderDishStatus.planned: 'planned',
  OrderDishStatus.searchCourier: 'search_courier',
  OrderDishStatus.sending: 'sending',
  OrderDishStatus.delivered: 'delivered',
  OrderDishStatus.canceled: 'canceled',
  OrderDishStatus.canceledByClient: 'canceled_by_client',
  OrderDishStatus.canceledByShop: 'canceled_by_restaurant',
};

_$DishesModelImpl _$$DishesModelImplFromJson(Map<String, dynamic> json) =>
    _$DishesModelImpl(
      name: json['dish'] as String?,
      price: json['price_dish'] as int?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      calories: json['calories'] as String?,
      image: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DishesModelImplToJson(_$DishesModelImpl instance) =>
    <String, dynamic>{
      'dish': instance.name,
      'price_dish': instance.price,
      'quantity': instance.quantity,
      'calories': instance.calories,
      'images': instance.image,
    };

_$ImageModelImpl _$$ImageModelImplFromJson(Map<String, dynamic> json) =>
    _$ImageModelImpl(
      id: json['id'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$ImageModelImplToJson(_$ImageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
