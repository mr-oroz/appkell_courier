import 'package:freezed_annotation/freezed_annotation.dart';

part 'code_verify_model.freezed.dart';
part 'code_verify_model.g.dart';

@freezed
class CodeVerifyModel with _$CodeVerifyModel {
  const CodeVerifyModel._();
  const factory CodeVerifyModel({
    final String? phone,
    final String? email,
    required String code,
  }) = _CodeVerifyModel;

  factory CodeVerifyModel.fromJson(Map<String, dynamic> json) =>
      _$CodeVerifyModelFromJson(json);

  Map<String, dynamic> toMap() {
    return {
      if (phone != null)
        'phone': phone!
            .replaceAll('+', '')
            .replaceAll(' ', '')
            .replaceAll('(', '')
            .replaceAll(')', '')
            .replaceAll('-', ''),
      if (email != null) 'email': email,
      'code': code,
    };
  }
}
