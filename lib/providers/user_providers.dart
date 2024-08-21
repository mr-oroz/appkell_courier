import 'package:appkel_for_courier_flutter/data/models/address_details_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/profile_model.dart';
import '../data/storage/local_storage.dart';
import 'dependencies.dart';

part 'user_providers.g.dart';
part 'user_providers.freezed.dart';

enum UserStatus {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == initial;
  bool get isLoading => this == loading;
  bool get isSuccess => this == success;
  bool get isError => this == error;
}

@freezed
class UserState with _$UserState {
  const factory UserState({
    Role? role,
    required UserStatus status,
    ProfileModel? profile,
    required bool isHasCourier,
  }) = _AuthState;

  factory UserState.initial() => const UserState(
        status: UserStatus.initial,
        isHasCourier: true,
      );
}

@riverpod
class User extends _$User {
  LocalStorage get localStorage => ref.read(localStorageProvider);

  @override
  UserState build() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profile();
    });
    return UserState(
      status: UserStatus.initial,
      role: localStorage.role,
      isHasCourier: true, //localStorage.isHasCourier,
    );
  }

  Future<void> profile() async {
    state = state.copyWith(status: UserStatus.loading);
    final response = await ref.read(userRepoProvider).profile();

    if (!response.isSuccessful || response.result == null) {
      state = state.copyWith(
        status: UserStatus.error,
      );
      // throw response.errorData ?? 'Что-то пошло не так. Попробуйте позже.';
    }
    if (response.result?.role != null &&
        response.result!.role != localStorage.role) {
      state = state.copyWith(
        status: UserStatus.success,
        role: response.result!.role,
      );
      
      localStorage.role = response.result!.role;
    }
    state = state.copyWith(
      status: UserStatus.success,
      profile: response.result,
    );
  }

  Future<void> updateProfile(Map<String, dynamic> map) async {
    state = state.copyWith(status: UserStatus.loading);
    final response = await ref.read(userRepoProvider).updateProfile(map);
    if (!response.isSuccessful || response.result == null) {
      state = state.copyWith(
        status: UserStatus.error,
      );
      throw response.errorData ?? 'Что-то пошло не так. Попробуйте позже.';
    }

    state = state.copyWith(
      status: UserStatus.success,
      profile: response.result,
    );
  }

  Future<void> setAddressDetails(AddressDetailsModel model) async {
    final isCourier = state.profile?.role == Role.courier;
    state = state.copyWith(status: UserStatus.loading);
    final response =
        await ref.read(userRepoProvider).setAddressDetails(AddressDetailsModel(
              streetName: model.streetName,
              number: model.number,
              floor: isCourier ? model.floor : null,
            ));
    if (!response.isSuccessful || response.result == null) {
      state = state.copyWith(
        status: UserStatus.error,
      );
      throw response.errorData ?? 'Что-то пошло не так. Попробуйте позже.';
    }
    state = state.copyWith(
      status: UserStatus.success,
      profile: response.result,
    );
  }

  void setHasCourier(bool isCourier) async {
    state = state.copyWith(isHasCourier: isCourier);
    localStorage.isHasCourier = isCourier;
  }
}
