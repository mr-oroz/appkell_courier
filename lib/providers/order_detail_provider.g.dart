// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$orderDetailHash() => r'4d4b4089f20d677476f1494c25e1dc8f72b761b1';

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

abstract class _$OrderDetail
    extends BuildlessAutoDisposeNotifier<OrderDetailState> {
  late final int orderId;

  OrderDetailState build(
    int orderId,
  );
}

/// See also [OrderDetail].
@ProviderFor(OrderDetail)
const orderDetailProvider = OrderDetailFamily();

/// See also [OrderDetail].
class OrderDetailFamily extends Family<OrderDetailState> {
  /// See also [OrderDetail].
  const OrderDetailFamily();

  /// See also [OrderDetail].
  OrderDetailProvider call(
    int orderId,
  ) {
    return OrderDetailProvider(
      orderId,
    );
  }

  @override
  OrderDetailProvider getProviderOverride(
    covariant OrderDetailProvider provider,
  ) {
    return call(
      provider.orderId,
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
  String? get name => r'orderDetailProvider';
}

/// See also [OrderDetail].
class OrderDetailProvider
    extends AutoDisposeNotifierProviderImpl<OrderDetail, OrderDetailState> {
  /// See also [OrderDetail].
  OrderDetailProvider(
    int orderId,
  ) : this._internal(
          () => OrderDetail()..orderId = orderId,
          from: orderDetailProvider,
          name: r'orderDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$orderDetailHash,
          dependencies: OrderDetailFamily._dependencies,
          allTransitiveDependencies:
              OrderDetailFamily._allTransitiveDependencies,
          orderId: orderId,
        );

  OrderDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
  }) : super.internal();

  final int orderId;

  @override
  OrderDetailState runNotifierBuild(
    covariant OrderDetail notifier,
  ) {
    return notifier.build(
      orderId,
    );
  }

  @override
  Override overrideWith(OrderDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: OrderDetailProvider._internal(
        () => create()..orderId = orderId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orderId: orderId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<OrderDetail, OrderDetailState>
      createElement() {
    return _OrderDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderDetailProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OrderDetailRef on AutoDisposeNotifierProviderRef<OrderDetailState> {
  /// The parameter `orderId` of this provider.
  int get orderId;
}

class _OrderDetailProviderElement
    extends AutoDisposeNotifierProviderElement<OrderDetail, OrderDetailState>
    with OrderDetailRef {
  _OrderDetailProviderElement(super.provider);

  @override
  int get orderId => (origin as OrderDetailProvider).orderId;
}

String _$orderDishDetailHash() => r'c6614fefcbdb6a983016e91cc5003795752ae245';

abstract class _$OrderDishDetail
    extends BuildlessAutoDisposeNotifier<OrderDishDetailState> {
  late final int orderId;

  OrderDishDetailState build(
    int orderId,
  );
}

/// See also [OrderDishDetail].
@ProviderFor(OrderDishDetail)
const orderDishDetailProvider = OrderDishDetailFamily();

/// See also [OrderDishDetail].
class OrderDishDetailFamily extends Family<OrderDishDetailState> {
  /// See also [OrderDishDetail].
  const OrderDishDetailFamily();

  /// See also [OrderDishDetail].
  OrderDishDetailProvider call(
    int orderId,
  ) {
    return OrderDishDetailProvider(
      orderId,
    );
  }

  @override
  OrderDishDetailProvider getProviderOverride(
    covariant OrderDishDetailProvider provider,
  ) {
    return call(
      provider.orderId,
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
  String? get name => r'orderDishDetailProvider';
}

/// See also [OrderDishDetail].
class OrderDishDetailProvider extends AutoDisposeNotifierProviderImpl<
    OrderDishDetail, OrderDishDetailState> {
  /// See also [OrderDishDetail].
  OrderDishDetailProvider(
    int orderId,
  ) : this._internal(
          () => OrderDishDetail()..orderId = orderId,
          from: orderDishDetailProvider,
          name: r'orderDishDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$orderDishDetailHash,
          dependencies: OrderDishDetailFamily._dependencies,
          allTransitiveDependencies:
              OrderDishDetailFamily._allTransitiveDependencies,
          orderId: orderId,
        );

  OrderDishDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
  }) : super.internal();

  final int orderId;

  @override
  OrderDishDetailState runNotifierBuild(
    covariant OrderDishDetail notifier,
  ) {
    return notifier.build(
      orderId,
    );
  }

  @override
  Override overrideWith(OrderDishDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: OrderDishDetailProvider._internal(
        () => create()..orderId = orderId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        orderId: orderId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<OrderDishDetail, OrderDishDetailState>
      createElement() {
    return _OrderDishDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderDishDetailProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OrderDishDetailRef
    on AutoDisposeNotifierProviderRef<OrderDishDetailState> {
  /// The parameter `orderId` of this provider.
  int get orderId;
}

class _OrderDishDetailProviderElement
    extends AutoDisposeNotifierProviderElement<OrderDishDetail,
        OrderDishDetailState> with OrderDishDetailRef {
  _OrderDishDetailProviderElement(super.provider);

  @override
  int get orderId => (origin as OrderDishDetailProvider).orderId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
