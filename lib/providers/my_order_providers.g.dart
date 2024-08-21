// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_order_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateProductsHash() => r'd081ba9c795c60537020776bbd83f0b2080f9530';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [updateProducts].
@ProviderFor(updateProducts)
const updateProductsProvider = UpdateProductsFamily();

/// See also [updateProducts].
class UpdateProductsFamily extends Family<AsyncValue<ApiResponse>> {
  /// See also [updateProducts].
  const UpdateProductsFamily();

  /// See also [updateProducts].
  UpdateProductsProvider call(
    List<OrderItemUpdateModel> models,
  ) {
    return UpdateProductsProvider(
      models,
    );
  }

  @override
  UpdateProductsProvider getProviderOverride(
    covariant UpdateProductsProvider provider,
  ) {
    return call(
      provider.models,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateProductsProvider';
}

/// See also [updateProducts].
class UpdateProductsProvider extends AutoDisposeFutureProvider<ApiResponse> {
  /// See also [updateProducts].
  UpdateProductsProvider(
    List<OrderItemUpdateModel> models,
  ) : this._internal(
          (ref) => updateProducts(
            ref as UpdateProductsRef,
            models,
          ),
          from: updateProductsProvider,
          name: r'updateProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateProductsHash,
          dependencies: UpdateProductsFamily._dependencies,
          allTransitiveDependencies:
              UpdateProductsFamily._allTransitiveDependencies,
          models: models,
        );

  UpdateProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.models,
  }) : super.internal();

  final List<OrderItemUpdateModel> models;

  @override
  Override overrideWith(
    FutureOr<ApiResponse> Function(UpdateProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateProductsProvider._internal(
        (ref) => create(ref as UpdateProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        models: models,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ApiResponse> createElement() {
    return _UpdateProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateProductsProvider && other.models == models;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, models.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateProductsRef on AutoDisposeFutureProviderRef<ApiResponse> {
  /// The parameter `models` of this provider.
  List<OrderItemUpdateModel> get models;
}

class _UpdateProductsProviderElement
    extends AutoDisposeFutureProviderElement<ApiResponse>
    with UpdateProductsRef {
  _UpdateProductsProviderElement(super.provider);

  @override
  List<OrderItemUpdateModel> get models =>
      (origin as UpdateProductsProvider).models;
}

String _$myOrderListHash() => r'6081384c54b5cb64e4ec3ca685077c0f6508bfdb';

/// See also [MyOrderList].
@ProviderFor(MyOrderList)
final myOrderListProvider =
    AutoDisposeAsyncNotifierProvider<MyOrderList, List<OrderModel>>.internal(
  MyOrderList.new,
  name: r'myOrderListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$myOrderListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MyOrderList = AutoDisposeAsyncNotifier<List<OrderModel>>;
String _$myDishOrderListHash() => r'1b7d7798c9f7f59987ec91b669899c98f5047888';

/// See also [MyDishOrderList].
@ProviderFor(MyDishOrderList)
final myDishOrderListProvider = AutoDisposeAsyncNotifierProvider<
    MyDishOrderList, List<OrderDishModel>>.internal(
  MyDishOrderList.new,
  name: r'myDishOrderListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myDishOrderListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MyDishOrderList = AutoDisposeAsyncNotifier<List<OrderDishModel>>;
String _$deliveredOrdersHash() => r'c9be7724d03073e547993d8cf1d5df5d429fabdd';

/// See also [DeliveredOrders].
@ProviderFor(DeliveredOrders)
final deliveredOrdersProvider = AutoDisposeAsyncNotifierProvider<
    DeliveredOrders, List<OrderModel>>.internal(
  DeliveredOrders.new,
  name: r'deliveredOrdersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deliveredOrdersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DeliveredOrders = AutoDisposeAsyncNotifier<List<OrderModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
