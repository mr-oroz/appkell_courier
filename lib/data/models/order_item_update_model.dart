import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_item_update_model.freezed.dart';
part 'order_item_update_model.g.dart';

@freezed
class OrderItemUpdateModel with _$OrderItemUpdateModel {
  const factory OrderItemUpdateModel({
    required int id,
    @JsonKey(name: 'quantity') required double weight,
  }) = _OrderItemUpdateModel;

  factory OrderItemUpdateModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemUpdateModelFromJson(json);
}
