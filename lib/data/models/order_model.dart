import 'package:appkel_for_courier_flutter/data/models/profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

enum OrderDishStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('preparing')
  preparing,
  @JsonValue('payment_pending')
  paymentPending,

  @JsonValue('payment_check')
  paymentCheck,

  @JsonValue('planned')
  planned,
  @JsonValue('search_courier')
  searchCourier,
  @JsonValue('sending')
  sending,
  @JsonValue('delivered')
  delivered,
  @JsonValue('canceled')
  canceled,
  @JsonValue('canceled_by_client')
  canceledByClient,
  @JsonValue('canceled_by_restaurant')
  canceledByShop;

  bool get isPending => this == pending;
  bool get isPreparing => this == preparing;
  bool get isSearchCourier => this == searchCourier;
  bool get ispaymentPending => this == paymentPending;
  bool get isPaymentCheck => this == paymentCheck;
  bool get isPlanned => this == planned;
  bool get isDelivered => this == delivered;
  bool get isSending => this == sending;
  bool get isCanceled => this == canceled;
  bool get isCanceledByClient => this == canceledByClient;
  bool get isCanceledByShop => this == canceledByShop;
}


enum OrderStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('preparing')
  preparing,
  @JsonValue('payment_pending')
  paymentPending,
  @JsonValue('payment_check')
  paymentCheck,
  @JsonValue('planned')
  planned,
  @JsonValue('search_courier')
  searchCourier,

  @JsonValue('sending')
  sending,
  @JsonValue('delivered')
  delivered,
  @JsonValue('canceled')
  canceled,
  @JsonValue('canceled_by_client')
  canceledByClient,
  @JsonValue('canceled_by_shop')
  canceledByShop;

  bool get isPending => this == pending;
  bool get isPreparing => this == preparing;
  bool get isSearchCourier => this == searchCourier;
  bool get ispaymentPending => this == paymentPending;
  bool get isPaymentCheck => this == paymentCheck;
  bool get isPlanned => this == planned;
  bool get isDelivered => this == delivered;
  bool get isSending => this == sending;
  bool get isCanceled => this == canceled;
  bool get isCanceledByClient => this == canceledByClient;
  bool get isCanceledByShop => this == canceledByShop;
}

enum PaymentMethod {
  @JsonValue('cash')
  cash,
  @JsonValue('wallet')
  wallet;

  bool get isCash => this == cash;
  bool get isWallet => this == wallet;
}

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    required int id,
    @Default(0) final int price,
    final String? image,
    @JsonKey(name: 'timestamp_delivery') final String? timeStampDelivery,
    @JsonKey(name: 'status')
    @Default(OrderStatus.pending)
    final OrderStatus status,
    @JsonKey(name: 'phone') final String? phoneNumber,
    @JsonKey(name: 'comment') final String? orderComments,
    @JsonKey(name: 'address') final String? houseAddress,
    @JsonKey(name: 'latitude') final double? houseLatitude,
    @JsonKey(name: 'longitude') final double? houseLongitude,
    // final String? storeAddress,
    // final double? storeLatitude,
    // final double? storeLongitude,
    @JsonKey(name: 'fast_order') final String? quickOrderText,
    final DateTime? date,
    @JsonKey(name: 'products') @Default([]) final List<ProductModel> products,
    @JsonKey(name: 'pay_check') final String? payCheck,
    @Default(PaymentMethod.cash)
    @JsonKey(name: 'payment_type')
    final PaymentMethod paymentMethod,
    @JsonKey(name: 'shopа') final ProfileModel? shopData,
    @JsonKey(name: 'sub_basement') final String? subBasement,
    @JsonKey(name: 'do_not_disturb') final bool? doNotDistirb,
    final String? floor,
    final String? apartment,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}



@freezed
class OrderDishModel with _$OrderDishModel {
  const factory OrderDishModel({
    final int? id,
    @JsonKey(name: 'order_items_dish') @Default([]) final List<DishesModel> dishes,
    final String? address,
    final String? comment,
    @JsonKey(name: 'status')
    @Default(OrderDishStatus.paymentPending)
    final OrderDishStatus status,
    final double? latitude,
    final double? longitude,
    @JsonKey(name: 'timestamp_delivery') final String? timestamp,
    @JsonKey(name: 'pay_check') final String? payCheck,
    @JsonKey(name: 'house_number') final String? houseNumber,
    @JsonKey(name: 'do_not_distirb') final bool? doNotDisturb,
    final String? floor,
    final String? apartment,
    @JsonKey(name: 'sub_basement') final String? entrance,
    final String? phone,
    @Default(PaymentMethod.cash)
    @JsonKey(name: 'payment_type')
    final PaymentMethod paymentMethod,
    final int? price,
  }) = _OrderDishModel;

  factory OrderDishModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDishModelFromJson(json);
}

@freezed
class DishesModel with _$DishesModel {
  const factory DishesModel({
    @JsonKey(name: "dish") final String? name,
    @JsonKey(name: 'price_dish') final int? price,
    final double? quantity,
    final String? calories,
    @JsonKey(name: 'images') final List<ImageModel>? image,
  }) = _DishesModel;
  factory DishesModel.fromJson(Map<String, dynamic> json) =>
      _$DishesModelFromJson(json);
}

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    final int? id,
    final String? image,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);
}



