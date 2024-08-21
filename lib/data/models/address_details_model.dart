import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_details_model.freezed.dart';
part 'address_details_model.g.dart';

@freezed
class AddressDetailsModel with _$AddressDetailsModel {
  const factory AddressDetailsModel({
    final String? streetName,
    final String? number,
    final String? floor,
    final String? apartment,
    final double? latitude,
    final double? longitude,
  }) = _AddressDetailsModel;

  factory AddressDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsModelFromJson(json);
}
