// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_order_status_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listenerOrderStatusHash() =>
    r'e0a854888494b6b027c3d6ab2c223623af7dfeed';

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

abstract class _$ListenerOrderStatus
    extends BuildlessAutoDisposeAsyncNotifier<OrderModel?> {
  late final int orderId;

  FutureOr<OrderModel?> build(
    int orderId,
  );
}

/// See also [ListenerOrderStatus].
@ProviderFor(ListenerOrderStatus)
const listenerOrderStatusProvider = ListenerOrderStatusFamily();

/// See also [ListenerOrderStatus].
class ListenerOrderStatusFamily extends Family<AsyncValue<OrderModel?>> {
  /// See also [ListenerOrderStatus].
  const ListenerOrderStatusFamily();

  /// See also [ListenerOrderStatus].
  ListenerOrderStatusProvider call(
    int orderId,
  ) {
    return ListenerOrderStatusProvider(
      orderId,
    );
  }

  @override
  ListenerOrderStatusProvider getProviderOverride(
    covariant ListenerOrderStatusProvider provider,
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
  String? get name => r'listenerOrderStatusProvider';
}

/// See also [ListenerOrderStatus].
class ListenerOrderStatusProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ListenerOrderStatus, OrderModel?> {
  /// See also [ListenerOrderStatus].
  ListenerOrderStatusProvider(
    int orderId,
  ) : this._internal(
          () => ListenerOrderStatus()..orderId = orderId,
          from: listenerOrderStatusProvider,
          name: r'listenerOrderStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listenerOrderStatusHash,
          dependencies: ListenerOrderStatusFamily._dependencies,
          allTransitiveDependencies:
              ListenerOrderStatusFamily._allTransitiveDependencies,
          orderId: orderId,
        );

  ListenerOrderStatusProvider._internal(
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
  FutureOr<OrderModel?> runNotifierBuild(
    covariant ListenerOrderStatus notifier,
  ) {
    return notifier.build(
      orderId,
    );
  }

  @override
  Override overrideWith(ListenerOrderStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override: ListenerOrderStatusProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ListenerOrderStatus, OrderModel?>
      createElement() {
    return _ListenerOrderStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListenerOrderStatusProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListenerOrderStatusRef
    on AutoDisposeAsyncNotifierProviderRef<OrderModel?> {
  /// The parameter `orderId` of this provider.
  int get orderId;
}

class _ListenerOrderStatusProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ListenerOrderStatus,
        OrderModel?> with ListenerOrderStatusRef {
  _ListenerOrderStatusProviderElement(super.provider);

  @override
  int get orderId => (origin as ListenerOrderStatusProvider).orderId;
}

String _$checkPreparingTimeHash() =>
    r'd5417c518a1497f156fd73382490bbcbb56ac29c';

abstract class _$CheckPreparingTime
    extends BuildlessAutoDisposeAsyncNotifier<List<Duration>?> {
  late final int? orderId;

  FutureOr<List<Duration>?> build({
    int? orderId,
  });
}

/// See also [CheckPreparingTime].
@ProviderFor(CheckPreparingTime)
const checkPreparingTimeProvider = CheckPreparingTimeFamily();

/// See also [CheckPreparingTime].
class CheckPreparingTimeFamily extends Family<AsyncValue<List<Duration>?>> {
  /// See also [CheckPreparingTime].
  const CheckPreparingTimeFamily();

  /// See also [CheckPreparingTime].
  CheckPreparingTimeProvider call({
    int? orderId,
  }) {
    return CheckPreparingTimeProvider(
      orderId: orderId,
    );
  }

  @override
  CheckPreparingTimeProvider getProviderOverride(
    covariant CheckPreparingTimeProvider provider,
  ) {
    return call(
      orderId: provider.orderId,
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
  String? get name => r'checkPreparingTimeProvider';
}

/// See also [CheckPreparingTime].
class CheckPreparingTimeProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CheckPreparingTime, List<Duration>?> {
  /// See also [CheckPreparingTime].
  CheckPreparingTimeProvider({
    int? orderId,
  }) : this._internal(
          () => CheckPreparingTime()..orderId = orderId,
          from: checkPreparingTimeProvider,
          name: r'checkPreparingTimeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkPreparingTimeHash,
          dependencies: CheckPreparingTimeFamily._dependencies,
          allTransitiveDependencies:
              CheckPreparingTimeFamily._allTransitiveDependencies,
          orderId: orderId,
        );

  CheckPreparingTimeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.orderId,
  }) : super.internal();

  final int? orderId;

  @override
  FutureOr<List<Duration>?> runNotifierBuild(
    covariant CheckPreparingTime notifier,
  ) {
    return notifier.build(
      orderId: orderId,
    );
  }

  @override
  Override overrideWith(CheckPreparingTime Function() create) {
    return ProviderOverride(
      origin: this,
      override: CheckPreparingTimeProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<CheckPreparingTime, List<Duration>?>
      createElement() {
    return _CheckPreparingTimeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckPreparingTimeProvider && other.orderId == orderId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, orderId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CheckPreparingTimeRef
    on AutoDisposeAsyncNotifierProviderRef<List<Duration>?> {
  /// The parameter `orderId` of this provider.
  int? get orderId;
}

class _CheckPreparingTimeProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CheckPreparingTime,
        List<Duration>?> with CheckPreparingTimeRef {
  _CheckPreparingTimeProviderElement(super.provider);

  @override
  int? get orderId => (origin as CheckPreparingTimeProvider).orderId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
