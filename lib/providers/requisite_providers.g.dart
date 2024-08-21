// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requisite_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addRequisiteHash() => r'6044ba10e732ef16895c561dec2332e42d2f34a0';

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

abstract class _$AddRequisite extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String nums;
  late final String title;

  FutureOr<void> build(
    String nums,
    String title,
  );
}

/// See also [AddRequisite].
@ProviderFor(AddRequisite)
const addRequisiteProvider = AddRequisiteFamily();

/// See also [AddRequisite].
class AddRequisiteFamily extends Family<AsyncValue<void>> {
  /// See also [AddRequisite].
  const AddRequisiteFamily();

  /// See also [AddRequisite].
  AddRequisiteProvider call(
    String nums,
    String title,
  ) {
    return AddRequisiteProvider(
      nums,
      title,
    );
  }

  @override
  AddRequisiteProvider getProviderOverride(
    covariant AddRequisiteProvider provider,
  ) {
    return call(
      provider.nums,
      provider.title,
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
  String? get name => r'addRequisiteProvider';
}

/// See also [AddRequisite].
class AddRequisiteProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AddRequisite, void> {
  /// See also [AddRequisite].
  AddRequisiteProvider(
    String nums,
    String title,
  ) : this._internal(
          () => AddRequisite()
            ..nums = nums
            ..title = title,
          from: addRequisiteProvider,
          name: r'addRequisiteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addRequisiteHash,
          dependencies: AddRequisiteFamily._dependencies,
          allTransitiveDependencies:
              AddRequisiteFamily._allTransitiveDependencies,
          nums: nums,
          title: title,
        );

  AddRequisiteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.nums,
    required this.title,
  }) : super.internal();

  final String nums;
  final String title;

  @override
  FutureOr<void> runNotifierBuild(
    covariant AddRequisite notifier,
  ) {
    return notifier.build(
      nums,
      title,
    );
  }

  @override
  Override overrideWith(AddRequisite Function() create) {
    return ProviderOverride(
      origin: this,
      override: AddRequisiteProvider._internal(
        () => create()
          ..nums = nums
          ..title = title,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        nums: nums,
        title: title,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AddRequisite, void> createElement() {
    return _AddRequisiteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddRequisiteProvider &&
        other.nums == nums &&
        other.title == title;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nums.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddRequisiteRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `nums` of this provider.
  String get nums;

  /// The parameter `title` of this provider.
  String get title;
}

class _AddRequisiteProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AddRequisite, void>
    with AddRequisiteRef {
  _AddRequisiteProviderElement(super.provider);

  @override
  String get nums => (origin as AddRequisiteProvider).nums;
  @override
  String get title => (origin as AddRequisiteProvider).title;
}

String _$updateRequisiteHash() => r'dce97304a92286872c1ad226f61c392a5714fd09';

abstract class _$UpdateRequisite
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String id;
  late final String nums;
  late final String title;

  FutureOr<void> build(
    String id,
    String nums,
    String title,
  );
}

/// See also [UpdateRequisite].
@ProviderFor(UpdateRequisite)
const updateRequisiteProvider = UpdateRequisiteFamily();

/// See also [UpdateRequisite].
class UpdateRequisiteFamily extends Family<AsyncValue<void>> {
  /// See also [UpdateRequisite].
  const UpdateRequisiteFamily();

  /// See also [UpdateRequisite].
  UpdateRequisiteProvider call(
    String id,
    String nums,
    String title,
  ) {
    return UpdateRequisiteProvider(
      id,
      nums,
      title,
    );
  }

  @override
  UpdateRequisiteProvider getProviderOverride(
    covariant UpdateRequisiteProvider provider,
  ) {
    return call(
      provider.id,
      provider.nums,
      provider.title,
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
  String? get name => r'updateRequisiteProvider';
}

/// See also [UpdateRequisite].
class UpdateRequisiteProvider
    extends AutoDisposeAsyncNotifierProviderImpl<UpdateRequisite, void> {
  /// See also [UpdateRequisite].
  UpdateRequisiteProvider(
    String id,
    String nums,
    String title,
  ) : this._internal(
          () => UpdateRequisite()
            ..id = id
            ..nums = nums
            ..title = title,
          from: updateRequisiteProvider,
          name: r'updateRequisiteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateRequisiteHash,
          dependencies: UpdateRequisiteFamily._dependencies,
          allTransitiveDependencies:
              UpdateRequisiteFamily._allTransitiveDependencies,
          id: id,
          nums: nums,
          title: title,
        );

  UpdateRequisiteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.nums,
    required this.title,
  }) : super.internal();

  final String id;
  final String nums;
  final String title;

  @override
  FutureOr<void> runNotifierBuild(
    covariant UpdateRequisite notifier,
  ) {
    return notifier.build(
      id,
      nums,
      title,
    );
  }

  @override
  Override overrideWith(UpdateRequisite Function() create) {
    return ProviderOverride(
      origin: this,
      override: UpdateRequisiteProvider._internal(
        () => create()
          ..id = id
          ..nums = nums
          ..title = title,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        nums: nums,
        title: title,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UpdateRequisite, void>
      createElement() {
    return _UpdateRequisiteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateRequisiteProvider &&
        other.id == id &&
        other.nums == nums &&
        other.title == title;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, nums.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateRequisiteRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `nums` of this provider.
  String get nums;

  /// The parameter `title` of this provider.
  String get title;
}

class _UpdateRequisiteProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UpdateRequisite, void>
    with UpdateRequisiteRef {
  _UpdateRequisiteProviderElement(super.provider);

  @override
  String get id => (origin as UpdateRequisiteProvider).id;
  @override
  String get nums => (origin as UpdateRequisiteProvider).nums;
  @override
  String get title => (origin as UpdateRequisiteProvider).title;
}

String _$deleteRequisiteHash() => r'2c1dc9c414399d87ad93b5750edd0d71bf2c4ab6';

abstract class _$DeleteRequisite
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String id;

  FutureOr<void> build(
    String id,
  );
}

/// See also [DeleteRequisite].
@ProviderFor(DeleteRequisite)
const deleteRequisiteProvider = DeleteRequisiteFamily();

/// See also [DeleteRequisite].
class DeleteRequisiteFamily extends Family<AsyncValue<void>> {
  /// See also [DeleteRequisite].
  const DeleteRequisiteFamily();

  /// See also [DeleteRequisite].
  DeleteRequisiteProvider call(
    String id,
  ) {
    return DeleteRequisiteProvider(
      id,
    );
  }

  @override
  DeleteRequisiteProvider getProviderOverride(
    covariant DeleteRequisiteProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'deleteRequisiteProvider';
}

/// See also [DeleteRequisite].
class DeleteRequisiteProvider
    extends AutoDisposeAsyncNotifierProviderImpl<DeleteRequisite, void> {
  /// See also [DeleteRequisite].
  DeleteRequisiteProvider(
    String id,
  ) : this._internal(
          () => DeleteRequisite()..id = id,
          from: deleteRequisiteProvider,
          name: r'deleteRequisiteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteRequisiteHash,
          dependencies: DeleteRequisiteFamily._dependencies,
          allTransitiveDependencies:
              DeleteRequisiteFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteRequisiteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<void> runNotifierBuild(
    covariant DeleteRequisite notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(DeleteRequisite Function() create) {
    return ProviderOverride(
      origin: this,
      override: DeleteRequisiteProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DeleteRequisite, void>
      createElement() {
    return _DeleteRequisiteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteRequisiteProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteRequisiteRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `id` of this provider.
  String get id;
}

class _DeleteRequisiteProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DeleteRequisite, void>
    with DeleteRequisiteRef {
  _DeleteRequisiteProviderElement(super.provider);

  @override
  String get id => (origin as DeleteRequisiteProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
