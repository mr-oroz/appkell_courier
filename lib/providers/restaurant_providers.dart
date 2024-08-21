import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'restaurant_providers.freezed.dart';
part 'restaurant_providers.g.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const factory RestaurantState({
    @Default(null) int? selectedIndex,
    @Default(null) int? selectedIndexCategory,
    @Default(null) int? selectedRadius,
    @Default(null) int? selectedCategory,
  }) = _RestaurantState;

  factory RestaurantState.initial() {
    return const RestaurantState();
  }
}

@riverpod
class RestaurantProviders extends _$RestaurantProviders {
  @override
  RestaurantState build() {
    return const RestaurantState();
  }

  void onSelected(index, int value) {
    state = state.copyWith(selectedIndex: index, selectedRadius: value);
  }

  void onSelectedCategory(index, value) {
    state = state.copyWith(selectedIndexCategory: index, selectedCategory: value);
  }
}


