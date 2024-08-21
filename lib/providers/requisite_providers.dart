import 'package:appkel_for_courier_flutter/providers/dependencies.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'requisite_providers.g.dart';

@riverpod
class AddRequisite extends _$AddRequisite {
  @override
  Future<void> build(String nums, String title) async {
    final response = await ref.read(userRepoProvider).addRequisite(nums, title);

    if (!response.isSuccessful) {
      throw response.errorData;
    }
  }
}

@riverpod
class UpdateRequisite extends _$UpdateRequisite {
  @override
  Future<void> build(String id, String nums, String title) async {
    final response =
        await ref.read(userRepoProvider).updateRequisite(id, nums, title);

    if (!response.isSuccessful) {
      throw response.errorData;
    }
  }
}

@riverpod
class DeleteRequisite extends _$DeleteRequisite {
  @override
  Future<void> build(String id) async {
    final response = await ref.read(userRepoProvider).deleteRequisite(id);

    if (!response.isSuccessful) {
      throw response.errorData;
    }
  }
}
