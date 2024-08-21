import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_location_model.freezed.dart';
part 'search_location_model.g.dart';



@freezed
class SearchLocationModel with _$SearchLocationModel {

  const factory SearchLocationModel({
    @JsonKey(name: 'place_id') int? placeId,
    final String? licence,
    @JsonKey(name: 'osm_type') String? osmType,
    int? osmId,
    final List<String>? boundingbox,
    @JsonKey(name: 'lat') String? lat,
    @JsonKey(name: 'lon') String? lon,
    @JsonKey(name: 'display_name') String? displayName,
    final int? placeRank,
    final String? category,
    final String? type,
    final double? importance,
  }) = _SearchLocationModel;
  
  factory SearchLocationModel.fromJson(Map<String, dynamic> json) =>
      _$SearchLocationModelFromJson(json);
  
}