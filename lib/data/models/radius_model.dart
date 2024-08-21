import 'package:freezed_annotation/freezed_annotation.dart';

part 'radius_model.freezed.dart';
part 'radius_model.g.dart';

@freezed
class RadiusModel with _$RadiusModel {
  const factory RadiusModel({
    final int? id,
    final int? radius,
  }) = _RadiusModel;

  factory RadiusModel.fromJson(Map<String, dynamic> json) => _$RadiusModelFromJson(json);
}