import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_create_model.freezed.dart';
part 'fcm_create_model.g.dart';

@freezed
class FcmCreateModel with _$FcmCreateModel {
  const factory FcmCreateModel({
    final String? name,
    @JsonKey(name: 'registration_id') required String registrationId,
    @JsonKey(name: 'device_id') String? deviceId,
    @Default(true) final bool? active,
    required String type,
    // @JsonKey(
    //     name: 'date_created', fromJson: dateTimeFromJson, includeToJson: false)
    // DateTime? dateCreated,
    // @JsonKey(includeToJson: false) final int? user,
  }) = _FcmCreateModel;

  factory FcmCreateModel.fromJson(Map<String, Object?> json) =>
      _$FcmCreateModelFromJson(json);
}
