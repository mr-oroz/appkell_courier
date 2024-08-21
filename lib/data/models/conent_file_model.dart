import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'conent_file_model.freezed.dart';
part 'conent_file_model.g.dart';

@freezed
class ContentFileModel with _$ContentFileModel {
  const factory ContentFileModel({
    final String? id,
    final String? thumbnailPath,
    @JsonKey(includeToJson: false, includeFromJson: false) final File? media,
    @Default(false) bool isActive,
  }) = _ContentFileModel;

  factory ContentFileModel.fromJson(Map<String, dynamic> json) =>
      _$ContentFileModelFromJson(json);
}

@freezed
class ContentModel with _$ContentModel {
  const factory ContentModel({
    final int? user,
    final String? file,
    final String? dish,
    final int? product,
    final String? description,
    @Default(null) @JsonKey(name: 'created_at') final String? createdAt,
  }) = _ContentModel;

  factory ContentModel.fromJson(Map<String, dynamic> json) =>
      _$ContentModelFromJson(json);
}
