// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$orderListHash() => r'17316abc5261aa48c7e720b1476d9ca82701d538';

/// See also [OrderList].
@ProviderFor(OrderList)
final orderListProvider =
    AutoDisposeAsyncNotifierProvider<OrderList, List<OrderModel>>.internal(
  OrderList.new,
  name: r'orderListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$orderListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OrderList = AutoDisposeAsyncNotifier<List<OrderModel>>;
String _$orderDishListHash() => r'b226b872a2bcdb050d70b30e1f40d12ca0f2ba3c';

/// See also [OrderDishList].
@ProviderFor(OrderDishList)
final orderDishListProvider = AutoDisposeAsyncNotifierProvider<OrderDishList,
    List<OrderDishModel>>.internal(
  OrderDishList.new,
  name: r'orderDishListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$orderDishListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OrderDishList = AutoDisposeAsyncNotifier<List<OrderDishModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
