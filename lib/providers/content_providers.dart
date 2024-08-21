import 'dart:io';

import 'package:appkel_for_courier_flutter/data/models/api_reponse.dart';
import 'package:appkel_for_courier_flutter/data/models/conent_file_model.dart';
import 'package:appkel_for_courier_flutter/providers/dependencies.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'content_providers.freezed.dart';
part 'content_providers.g.dart';

@freezed
class ContentState with _$ContentState {
  const factory ContentState({
    @Default([]) List<ContentFileModel> files,
  }) = _ContentState;

  factory ContentState.initial() => const ContentState(
        files: [],
      );
}

@riverpod
class ContentProviders extends _$ContentProviders {
  @override
  ContentState build() {
    return const ContentState();
  }

  void addFiles(ContentFileModel file) {
    final updateFile = file.copyWith(id: const Uuid().v1());
    state = state.copyWith(files: [updateFile, ...state.files]);
  }

  void toggleActive(ContentFileModel file) {
    final updateFiles = state.files.map((item) {
      if (item.id == file.id) {
        return item.copyWith(isActive: !item.isActive);
      }
      return item;
    }).toList();
    state = state.copyWith(files: updateFiles);
  }

  void clearImages() {
    state = state.copyWith(files: []);
  }
}

@riverpod
class CreateReels extends _$CreateReels {
  @override
  Future<ApiResponse?> build({
    required List<File> files,
    String? dishId,
    String? description,
  }) async {
    final response = await ref.read(orderRepoProvider).createReels(
          files: files,
          dishId: dishId,
          description: description,
        );
    return response;
  }
}

@riverpod
class MyReels extends _$MyReels {
  int currentPage = 2;

  @override
  Future<List<ContentModel>> build({
    int? page,
  }) async {
    final response = await ref.read(orderRepoProvider).myReels(
          page: page,
        );
    return response.result ?? [];
  }

  void loadMore({
    String? searchText,
  }) async {
    if (state.isLoading || state.isRefreshing || state.isReloading) return;
    state =
        const AsyncValue<List<ContentModel>>.loading().copyWithPrevious(state);
    final response = await ref.read(orderRepoProvider).myReels(
          page: currentPage,
        );

    List<ContentModel> list = response.result ?? [];
    currentPage++;

    state = AsyncValue.data([...?state.value, ...list]);
  }
}
