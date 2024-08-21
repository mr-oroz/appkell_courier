import 'package:appkel_for_courier_flutter/providers/dependencies.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'whatsapp_number_provider.g.dart';

@riverpod
class WhatsappNumber extends _$WhatsappNumber {
  @override
  Future<String?> build() async {
    final response = await ref.read(userRepoProvider).whatsappNumber();

    if (response.result?.isNotEmpty == true) {
      return response.result!;
    }
    return null;
  }
}
