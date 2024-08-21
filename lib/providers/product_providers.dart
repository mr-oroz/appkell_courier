import 'dart:io';

import 'package:appkel_for_courier_flutter/data/models/api_reponse.dart';
import 'package:appkel_for_courier_flutter/data/models/radius_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/category_model.dart';
import '../data/models/product_model.dart';
import 'dependencies.dart';

part 'product_providers.g.dart';

@riverpod
class CategoryList extends _$CategoryList {
  int offset = 0;
  @override
  Future<List<CategoryModel>> build({String? search}) async {
    final response = await ref.read(orderRepoProvider).categoryList(
          limit: 15,
          search: search,
        );
    if (response.result?.isEmpty ?? true) {
      return [];
    }
    offset = response.result!.length;
    return response.result!;
  }

  void loadMore({
    String? searchText,
  }) async {
    if (state.isLoading || state.isRefreshing || state.isReloading) return;
    state =
        const AsyncValue<List<CategoryModel>>.loading().copyWithPrevious(state);
    final response = await ref.read(orderRepoProvider).categoryList(
          search: searchText,
          offset: offset,
          limit: 15,
        );

    List<CategoryModel> list = response.result ?? [];
    state = AsyncValue.data([...?state.value, ...list]);
    if (state.value?.isNotEmpty == true) {
      offset = state.value!.length;
    }
  }
}

@riverpod
class CategoryDishList extends _$CategoryDishList {
  int offset = 0;
  @override
  Future<List<CategoryModel>> build({String? search}) async {
    final response = await ref.read(orderRepoProvider).categoryDishList(
          limit: 15,
          search: search,
        );
    if (response.result?.isEmpty ?? true) {
      return [];
    }
    offset = response.result!.length;
    return response.result!;
  }

  void loadMore({
    String? searchText,
  }) async {
    if (state.isLoading || state.isRefreshing || state.isReloading) return;
    state =
        const AsyncValue<List<CategoryModel>>.loading().copyWithPrevious(state);
    final response = await ref.read(orderRepoProvider).categoryDishList(
          search: searchText,
          offset: offset,
          limit: 15,
        );

    List<CategoryModel> list = response.result ?? [];
    state = AsyncValue.data([...?state.value, ...list]);
    if (state.value?.isNotEmpty == true) {
      offset = state.value!.length;
    }
  }
}

@riverpod
class ProductsList extends _$ProductsList {
  int currentPage = 2;

  @override
  Future<List<ProductModel>> build({
    int? categoryId,
    String? search,
    bool? isMyProducts,
  }) async {
    final response = await ref.read(orderRepoProvider).productList(
          categoryId: categoryId,
          search: search,
          isMyProducts: isMyProducts,
        );

    return response.result ?? [];
  }

  void loadMore({
    String? searchText,
  }) async {
    if (state.isLoading || state.isRefreshing || state.isReloading) return;
    state =
        const AsyncValue<List<ProductModel>>.loading().copyWithPrevious(state);
    final response = await ref.read(orderRepoProvider).productList(
          categoryId: categoryId,
          search: search,
          isMyProducts: isMyProducts,
          page: currentPage,
        );

    List<ProductModel> list = response.result ?? [];
    currentPage++;

    state = AsyncValue.data([...?state.value, ...list]);
  }
}

@riverpod
class DishProductsList extends _$DishProductsList {
  int currentPage = 2;

  @override
  Future<List<DishProductModel>> build({int? page, int? categoryId}) async {
    final response = await ref
        .read(orderRepoProvider)
        .dishDetail(page: page, categoryId: categoryId);
    return response.result ?? [];
  }

  void loadMore({
    String? searchText,
  }) async {
    if (state.isLoading || state.isRefreshing || state.isReloading) return;
    state = const AsyncValue<List<DishProductModel>>.loading()
        .copyWithPrevious(state);
    final response = await ref.read(orderRepoProvider).dishDetail(
          page: currentPage,
        );

    List<DishProductModel> list = response.result ?? [];
    currentPage++;

    state = AsyncValue.data([...?state.value, ...list]);
  }
}

@riverpod
class UpdateDish extends _$UpdateDish {
  @override
  Future<ApiResponse?> build({
    String? productId,
    DishProductModel? product,
    List<File>? images,
  }) async {
    final response = await ref.read(orderRepoProvider).updateDish(
          id: productId,
          dish: product!,
          images: images!,
        );
    return response;
  }
}

@riverpod
class RadiusList extends _$RadiusList {
  @override
  Future<List<RadiusModel>> build() async {
    final response = await ref.read(orderRepoProvider).radiusList();
    return response.result!;
  }
}

@riverpod
class KitchensList extends _$KitchensList {
  @override
  Future<List<KitchenList>> build() async {
    final response = await ref.read(orderRepoProvider).kitchenList();
    return response.result!;
  }
}

@riverpod
class KitchensPost extends _$KitchensPost {
  @override
  Future<ApiResponse?> build(
    List<int> ids
  ) async {
    final response = await ref.read(userRepoProvider).kitchenRestaurants(ids);
    return response;
  }
}

@riverpod
class RadiusPost extends _$RadiusPost {
  @override
  Future<ApiResponse?> build({required int radius}) async {
    final response = await ref.read(orderRepoProvider).radiusPost(radius: radius);
    return response;
  }
}

@riverpod
class ProductDish extends _$ProductDish {
  @override
  Future<ApiResponse?> build({
    String? productId,
  }) async {
    final response = await ref.read(orderRepoProvider).dishProduct(
          id: productId,
        );
    return response;
  }
}

@riverpod
class DeleteDishImage extends _$DeleteDishImage {
  @override
  Future<ApiResponse?> build({
    required String imageId,
  }) async {
    final response =
        await ref.read(orderRepoProvider).deleteDishImage(imageId: imageId);
    return response;
  }
}

@riverpod
class AddImagesDish extends _$AddImagesDish {
  @override
  Future<ApiResponse?> build({
    required String productId,
    List<File>? images,
  }) async {
    final response = await ref
        .read(orderRepoProvider)
        .addImageDishProduct(productId: productId, images: images);
    return response;
  }
}

@riverpod
class AddPrice extends _$AddPrice {
  @override
  Future<ApiResponse?> build({
    int? productId,
    int? price,
    bool? isNotAvailable,
  }) async {
    final response = await ref.read(orderRepoProvider).addPrice(
          productId,
          price,
          isNotAvailable,
        );

    return response;
  }
}

@riverpod
class AddDiscount extends _$AddDiscount {
  @override
  Future<ApiResponse?> build({
    required int id,
    required int discount,
    required int intervalTime,
  }) async {
    final response = await ref
        .read(orderRepoProvider)
        .addDiscount(id, discount, intervalTime);

    return response;
  }
}

@riverpod
class AddCategoryDish extends _$AddCategoryDish {
  @override
  Future<ApiResponse?> build({
    required String nameCategory,
    required File image,
  }) async {
    final response = await ref
        .read(orderRepoProvider)
        .addCategoryDish(name: nameCategory, image: image);
    return response;
  }
}

@riverpod
class AddDish extends _$AddDish {
  @override
  Future<ApiResponse?> build({
    required DishProductModel product,
    required List<File> images,
  }) async {
    final response = await ref
        .read(orderRepoProvider)
        .dishCreate(dish: product, images: images);
    return response;
  }
}
