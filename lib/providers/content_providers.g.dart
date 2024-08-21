// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contentProvidersHash() => r'4917d08bab8d35ce8bdd43c6026beac2b22f10f1';

/// See also [ContentProviders].
@ProviderFor(ContentProviders)
final contentProvidersProvider =
    AutoDisposeNotifierProvider<ContentProviders, ContentState>.internal(
  ContentProviders.new,
  name: r'contentProvidersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$contentProvidersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ContentProviders = AutoDisposeNotifier<ContentState>;
String _$createReelsHash() => r'99ce9cd38724e42eac97f2e176ace35b8749f9a7';

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

abstract class _$CreateReels
    extends BuildlessAutoDisposeAsyncNotifier<ApiResponse?> {
  late final List<File> files;
  late final String? dishId;
  late final String? description;

  FutureOr<ApiResponse?> build({
    required List<File> files,
    String? dishId,
    String? description,
  });
}

/// See also [CreateReels].
@ProviderFor(CreateReels)
const createReelsProvider = CreateReelsFamily();

/// See also [CreateReels].
class CreateReelsFamily extends Family<AsyncValue<ApiResponse?>> {
  /// See also [CreateReels].
  const CreateReelsFamily();

  /// See also [CreateReels].
  CreateReelsProvider call({
    required List<File> files,
    String? dishId,
    String? description,
  }) {
    return CreateReelsProvider(
      files: files,
      dishId: dishId,
      description: description,
    );
  }

  @override
  CreateReelsProvider getProviderOverride(
    covariant CreateReelsProvider provider,
  ) {
    return call(
      files: provider.files,
      dishId: provider.dishId,
      description: provider.description,
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
  String? get name => r'createReelsProvider';
}

/// See also [CreateReels].
class CreateReelsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CreateReels, ApiResponse?> {
  /// See also [CreateReels].
  CreateReelsProvider({
    required List<File> files,
    String? dishId,
    String? description,
  }) : this._internal(
          () => CreateReels()
            ..files = files
            ..dishId = dishId
            ..description = description,
          from: createReelsProvider,
          name: r'createReelsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createReelsHash,
          dependencies: CreateReelsFamily._dependencies,
          allTransitiveDependencies:
              CreateReelsFamily._allTransitiveDependencies,
          files: files,
          dishId: dishId,
          description: description,
        );

  CreateReelsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.files,
    required this.dishId,
    required this.description,
  }) : super.internal();

  final List<File> files;
  final String? dishId;
  final String? description;

  @override
  FutureOr<ApiResponse?> runNotifierBuild(
    covariant CreateReels notifier,
  ) {
    return notifier.build(
      files: files,
      dishId: dishId,
      description: description,
    );
  }

  @override
  Override overrideWith(CreateReels Function() create) {
    return ProviderOverride(
      origin: this,
      override: CreateReelsProvider._internal(
        () => create()
          ..files = files
          ..dishId = dishId
          ..description = description,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        files: files,
        dishId: dishId,
        description: description,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CreateReels, ApiResponse?>
      createElement() {
    return _CreateReelsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateReelsProvider &&
        other.files == files &&
        other.dishId == dishId &&
        other.description == description;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, files.hashCode);
    hash = _SystemHash.combine(hash, dishId.hashCode);
    hash = _SystemHash.combine(hash, description.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateReelsRef on AutoDisposeAsyncNotifierProviderRef<ApiResponse?> {
  /// The parameter `files` of this provider.
  List<File> get files;

  /// The parameter `dishId` of this provider.
  String? get dishId;

  /// The parameter `description` of this provider.
  String? get description;
}

class _CreateReelsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CreateReels, ApiResponse?>
    with CreateReelsRef {
  _CreateReelsProviderElement(super.provider);

  @override
  List<File> get files => (origin as CreateReelsProvider).files;
  @override
  String? get dishId => (origin as CreateReelsProvider).dishId;
  @override
  String? get description => (origin as CreateReelsProvider).description;
}

String _$myReelsHash() => r'0e45e01a118a060209505efd393e1763f30104c4';

abstract class _$MyReels
    extends BuildlessAutoDisposeAsyncNotifier<List<ContentModel>> {
  late final int? page;

  FutureOr<List<ContentModel>> build({
    int? page,
  });
}

/// See also [MyReels].
@ProviderFor(MyReels)
const myReelsProvider = MyReelsFamily();

/// See also [MyReels].
class MyReelsFamily extends Family<AsyncValue<List<ContentModel>>> {
  /// See also [MyReels].
  const MyReelsFamily();

  /// See also [MyReels].
  MyReelsProvider call({
    int? page,
  }) {
    return MyReelsProvider(
      page: page,
    );
  }

  @override
  MyReelsProvider getProviderOverride(
    covariant MyReelsProvider provider,
  ) {
    return call(
      page: provider.page,
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
  String? get name => r'myReelsProvider';
}

/// See also [MyReels].
class MyReelsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MyReels, List<ContentModel>> {
  /// See also [MyReels].
  MyReelsProvider({
    int? page,
  }) : this._internal(
          () => MyReels()..page = page,
          from: myReelsProvider,
          name: r'myReelsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myReelsHash,
          dependencies: MyReelsFamily._dependencies,
          allTransitiveDependencies: MyReelsFamily._allTransitiveDependencies,
          page: page,
        );

  MyReelsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int? page;

  @override
  FutureOr<List<ContentModel>> runNotifierBuild(
    covariant MyReels notifier,
  ) {
    return notifier.build(
      page: page,
    );
  }

  @override
  Override overrideWith(MyReels Function() create) {
    return ProviderOverride(
      origin: this,
      override: MyReelsProvider._internal(
        () => create()..page = page,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MyReels, List<ContentModel>>
      createElement() {
    return _MyReelsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyReelsProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyReelsRef on AutoDisposeAsyncNotifierProviderRef<List<ContentModel>> {
  /// The parameter `page` of this provider.
  int? get page;
}

class _MyReelsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MyReels, List<ContentModel>>
    with MyReelsRef {
  _MyReelsProviderElement(super.provider);

  @override
  int? get page => (origin as MyReelsProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
