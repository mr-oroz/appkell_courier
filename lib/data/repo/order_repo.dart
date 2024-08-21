import 'dart:io';

import 'package:appkel_for_courier_flutter/data/models/conent_file_model.dart';
import 'package:appkel_for_courier_flutter/data/models/order_item_update_model.dart';
import 'package:appkel_for_courier_flutter/data/models/radius_model.dart';
import 'package:dio/dio.dart';

import '../client/client.dart';
import '../models/api_reponse.dart';
import '../models/category_model.dart';
import '../models/order_model.dart';

import '../models/product_model.dart';

Duration? durationFromJson(dynamic data) {
  if (data == null) {
    return null;
  }
  final parts = data.split(':');
  if (parts.length == 1) {
    return Duration(minutes: int.parse(parts[0]));
  }

  if (parts.length == 2) {
    return Duration(
      minutes: int.parse(parts[0]),
      seconds: int.parse(parts[1]),
    );
  }

  return Duration(
    hours: int.parse(parts[0]),
    minutes: int.parse(parts[1]),
    seconds: int.parse(parts[2]),
  );
}

abstract final class OrderRepo {
  Future<ApiResponse<List<OrderModel>>> orderList(
      (double lat, double lon)? value);
  Future<ApiResponse<List<CategoryModel>>> categoryList(
      {String? search, int? limit, int? offset});
  Future<ApiResponse<List<CategoryModel>>> categoryDishList(
      {String? search, int? limit, int? offset});
  Future<ApiResponse<CategoryModel>> addCategoryDish(
      {required String name, required File image});
  Future<ApiResponse<List<DishProductModel>>> dishDetail(
      {int? page, int? categoryId});
  Future<ApiResponse<DishProductModel>> dishCreate(
      {required DishProductModel dish, List<File>? images});
  Future<ApiResponse<DishProductModel>> updateDish({
    required DishProductModel dish,
    String? id,
    List<File>? images,
  });

  Future<ApiResponse> addImageDishProduct({
    required String productId,
    List<File>? images,
  });

  Future<ApiResponse> deleteDishImage({required String imageId});

  Future<ApiResponse<DishProductModel>> dishProduct({String? id});
  Future<ApiResponse<List<KitchenList>>> kitchenList({int? page});
  Future<ApiResponse<ReellSuccessModel>> createReels({
    required List<File> files,
    String? dishId,
    String? description,
  });
  Future<ApiResponse<List<ContentModel>>> myReels({int? page});

  Future<ApiResponse<List<ProductModel>>> productList(
      {int? categoryId, String? search, bool? isMyProducts, int? page});
  Future<ApiResponse<List<RadiusModel>>> radiusList();
  Future<ApiResponse> radiusPost({required int radius});
  Future<ApiResponse> addPrice(
    int? productId,
    int? price,
    bool? isNotAvailable,
  );
  Future<ApiResponse> acceptRejectOrder(int orderId, bool isAccept);
  Future<ApiResponse<List<Duration>?>> checkPreparingTime(int? orderId);
  Future<ApiResponse<List<OrderModel>>> myOrderList(bool? isCompletedOrders,
      {int? page});
  Future<ApiResponse> updateStatus(int orderId, Map<String, dynamic> data);
  Future<ApiResponse> updateProducts(List<OrderItemUpdateModel> models);
  Future<ApiResponse> addDiscount(int id, int discount, int intervalTime);
}

base class OrderAPIRepo implements OrderRepo {
  const OrderAPIRepo({required ApiClient client}) : _client = client;
  final ApiClient _client;

  @override
  Future<ApiResponse<List<OrderModel>>> orderList(
      (double lat, double lon)? value) {
    return _client.get(
      'orders/list/',
      params: {
        if (value != null) 'latitude': value.$1,
        if (value != null) 'longitude': value.$2,
      },
      decoder: (data) {
        return List.from(
          data.map(
            (e) => OrderModel.fromJson(e),
          ),
        );
      },
    );
  }

  @override
  Future<ApiResponse<List<CategoryModel>>> categoryList(
      {String? search, int? limit, int? offset}) {
    return _client.get(
      'orders/categories/',
      params: {
        if (search != null) 'search': search,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      },
      decoder: (data) {
        return List<CategoryModel>.from(
          data['results'].map(
            (e) => CategoryModel.fromJson(e),
          ),
        );
      },
    );
  }
  @override
  Future<ApiResponse<List<KitchenList>>> kitchenList(
      {int? page}) {
    return _client.get(
      'kitchens/',
      decoder: (data) {
        return List<KitchenList>.from(
          data['results'].map(
            (e) => KitchenList.fromJson(e),
          ),
        );
      },
    );
  }

  @override
  Future<ApiResponse<List<RadiusModel>>> radiusPost({required int radius}) {
    return _client.post(
      'radius-selections/',
      data: {
        'radius': radius,
      },
    );
  }

  @override
  Future<ApiResponse<List<RadiusModel>>> radiusList() {
    return _client.get(
      'radius-selections/',
      decoder: (data) {
        return List<RadiusModel>.from(
          data['results'].map(
            (e) => RadiusModel.fromJson(e),
          ),
        );
      },
    );
  }

  @override
  Future<ApiResponse> deleteDishImage({required String imageId}) async {
    return _client.delete('orders/dishes/dish-images/$imageId/');
  }

  @override
  Future<ApiResponse> addImageDishProduct(
      {required String productId, List<File>? images}) async {
    List<MultipartFile> multipartImages = [];
    if (images != null) {
      for (var image in images) {
        var multipartFile = await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        );
        multipartImages.add(multipartFile);
      }
    }
    var formData =
        FormData.fromMap({'dish': productId, 'images': multipartImages});
    return _client.post('orders/dishes/dish-images/', data: formData);
  }

  @override
  Future<ApiResponse<DishProductModel>> dishCreate(
      {required DishProductModel dish, List<File>? images}) async {
    List<MultipartFile> multipartImages = [];
    if (images != null) {
      for (var image in images) {
        var multipartFile = await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        );
        multipartImages.add(multipartFile);
      }
    }
    var formData = FormData.fromMap({
      'title': dish.title,
      'composition': dish.composition,
      'calories': dish.calories,
      'price': dish.price,
      "category": dish.category,
      'position': dish.position,
      'images': multipartImages
    });
    return _client.post('orders/dishes/', data: formData, decoder: (data) {
      return DishProductModel.fromJson(data);
    });
  }

  @override
  Future<ApiResponse<ReellSuccessModel>> createReels({
    required List<File> files,
    String? dishId,
    String? description,
  }) async {
    List<MultipartFile> multipartImages = [];
    for (var image in files) {
      var multipartFile = await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      );
      multipartImages.add(multipartFile);
    }
    var formData = FormData.fromMap(
        {'description': description, 'dish': dishId, 'files': multipartImages});
    return _client.post('reels/create/', data: formData, decoder: (data) {
      return ReellSuccessModel.fromJson(data);
    });
  }

  @override
  Future<ApiResponse<CategoryModel>> addCategoryDish(
      {required String name, required File image}) async {
    var formData = FormData.fromMap({
      'name': name,
      'image': await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      ),
    });
    return _client.post(
      'orders/dishes/categories/',
      data: formData,
      decoder: (data) {
        return CategoryModel.fromJson(data);
      },
    );
  }

  @override
  Future<ApiResponse<List<CategoryModel>>> categoryDishList(
      {String? search, int? limit, int? offset}) {
    return _client.get(
      'orders/dishes/categories/my_categories/',
      params: {
        if (search != null) 'search': search,
        if (limit != null) 'limit': limit,
        if (offset != null) 'offset': offset,
      },
      decoder: (data) {
        return List<CategoryModel>.from(
          data['results'].map(
            (e) => CategoryModel.fromJson(e),
          ),
        );
      },
    );
  }

  @override
  Future<ApiResponse<List<ProductModel>>> productList(
      {int? categoryId, String? search, bool? isMyProducts, int? page}) {
    return _client.get(
      'orders/products/',
      params: {
        if (categoryId != null) 'category__id': categoryId,
        if (search != null) 'search': search,
        if (isMyProducts != null) 'is_my_products': isMyProducts,
        if (page != null) 'page': page,
        'ordering': '-id',
      },
      decoder: (data) {
        return List.from(
          data['results'].map(
            (e) => ProductModel.fromJson(e),
          ),
        );
      },
    );
  }

  @override
  Future<ApiResponse<List<ContentModel>>> myReels({int? page}) {
    return _client.get(
      'reels/my',
      params: {
        if (page != null) 'page': page,
      },
      decoder: (data) {
        return List.from(data['results'].map((e) => ContentModel.fromJson(e)));
      },
    );
  }

  @override
  Future<ApiResponse<DishProductModel>> updateDish({
    required DishProductModel dish,
    String? id,
    List<File>? images,
  }) async {
    var formData = FormData.fromMap({
      'title': dish.title,
      'composition': dish.composition,
      'calories': dish.calories,
      'price': dish.price,
      'category': dish.category,
      'id': dish.id,
    });

    return _client.put(
      'orders/dishes/$id/',
      data: formData,
    );
  }

  @override
  Future<ApiResponse<DishProductModel>> dishProduct({String? id}) {
    return _client.get(
      'orders/dishes/$id',
      decoder: (data) => DishProductModel.fromJson(data),
    );
  }

  @override
  Future<ApiResponse<List<DishProductModel>>> dishDetail(
      {int? page, int? categoryId}) {
    return _client.get(
      'orders/dishes/my_dishes/',
      params: {
        if (page != null) 'page': page,
        if (categoryId != null) 'category': categoryId,
      },
      decoder: (data) {
        final results = (data['results'] as List<dynamic>)
            .map((e) => DishProductModel.fromJson(e as Map<String, dynamic>))
            .toList();

        return results;
      },
    );
  }

  @override
  Future<ApiResponse> addPrice(
    int? productId,
    int? price,
    bool? isNotAvailable,
  ) {
    return _client.post(
      'accounts/add_product_to_shop/',
      data: {
        'product_id': productId,
        'price': price,
        // 'is_not_available': isNotAvailable,
      },
    );
  }

  @override
  Future<ApiResponse> acceptRejectOrder(int orderId, bool isAccept) {
    return _client.post(
      'orders/accept/',
      data: {
        'order_id': orderId,
        // 'is_accept': isAccept,
      },
    );
  }

  @override
  Future<ApiResponse<List<Duration>?>> checkPreparingTime(int? orderId) {
    return _client.post(
      'orders/check_preparing_time/',
      data: {
        if (orderId != null) 'order_id': orderId,
      },
      decoder: (data) {
        final list = List<Duration>.from([]);
        list.add(durationFromJson(data['preparing_timer']) ??
            const Duration(minutes: 5));
        list.add(durationFromJson(data['payment_pending_timer']) ??
            const Duration(minutes: 2));
        list.add(durationFromJson(data['courier_sending_timer']) ??
            const Duration(minutes: 25));

        return list;
      },
    );
  }

  @override
  Future<ApiResponse<List<OrderModel>>> myOrderList(bool? isCompletedOrders,
      {int? page}) {
    return _client.get(
      'accounts/order_history/',
      params: {
        if (isCompletedOrders != null) 'finished_orders': isCompletedOrders,
        if (page != null) 'page': page,
      },
      decoder: (data) {
        return List.from(
          data['results'].map(
            (e) => OrderModel.fromJson(e),
          ),
        );
      },
    );
  }

  @override
  Future<ApiResponse> updateStatus(int orderId, Map<String, dynamic> data) {
    return _client.patch(
      'orders/update/$orderId/',
      data: data,
    );
  }

  @override
  Future<ApiResponse> updateProducts(List<OrderItemUpdateModel> models) {
    return _client.post(
      'orders/item/update/',
      data: {
        "order_items": models
            .map(
              (e) => e.toJson(),
            )
            .toList(),
      },
    );
  }

  @override
  Future<ApiResponse> addDiscount(int id, int discount, int intervalTime) {
    return _client.post(
      'accounts/add_discount_to_product/',
      data: {
        'product_id': id,
        'discount': discount,
        'hours': intervalTime,
      },
    );
  }

  String getStatus(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'pending';
      case OrderStatus.preparing:
        return 'preparing';
      case OrderStatus.paymentPending:
        return 'payment_pending';
      case OrderStatus.paymentCheck:
        return 'payment_check';
      case OrderStatus.planned:
        return 'planned';
      case OrderStatus.searchCourier:
        return 'search_courier';

      case OrderStatus.sending:
        return 'sending';
      case OrderStatus.delivered:
        return 'delivered';

      case OrderStatus.canceled:
        return 'canceled';
      case OrderStatus.canceledByClient:
        return 'canceled_by_client';
      case OrderStatus.canceledByShop:
        return 'canceled_by_shop';
    }
  }
}
