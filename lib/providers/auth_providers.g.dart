// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authStatusHash() => r'1b2416cca094b77e0b0cc6f921b99468525ab68f';

/// See also [authStatus].
@ProviderFor(authStatus)
final authStatusProvider = AutoDisposeProvider<bool>.internal(
  authStatus,
  name: r'authStatusProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStatusRef = AutoDisposeProviderRef<bool>;
String _$authHash() => r'49198438ccccbd34db248e38e484fc7ef4327a7a';

/// See also [Auth].
@ProviderFor(Auth)
final authProvider = AutoDisposeNotifierProvider<Auth, AuthState>.internal(
  Auth.new,
  name: r'authProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Auth = AutoDisposeNotifier<AuthState>;
String _$loginHash() => r'841ba6df5a399995262804d1ba1ab97714951dc8';

/// See also [Login].
@ProviderFor(Login)
final loginProvider = AutoDisposeNotifierProvider<Login, LoginState>.internal(
  Login.new,
  name: r'loginProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Login = AutoDisposeNotifier<LoginState>;
String _$searchLocationHash() => r'a6b1b2b3569b1836659e4d19ef8cdd8c57cf04c7';

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

abstract class _$SearchLocation
    extends BuildlessAutoDisposeAsyncNotifier<List<SearchLocationModel>> {
  late final String query;

  FutureOr<List<SearchLocationModel>> build(
    String query,
  );
}

/// See also [SearchLocation].
@ProviderFor(SearchLocation)
const searchLocationProvider = SearchLocationFamily();

/// See also [SearchLocation].
class SearchLocationFamily
    extends Family<AsyncValue<List<SearchLocationModel>>> {
  /// See also [SearchLocation].
  const SearchLocationFamily();

  /// See also [SearchLocation].
  SearchLocationProvider call(
    String query,
  ) {
    return SearchLocationProvider(
      query,
    );
  }

  @override
  SearchLocationProvider getProviderOverride(
    covariant SearchLocationProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'searchLocationProvider';
}

/// See also [SearchLocation].
class SearchLocationProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SearchLocation, List<SearchLocationModel>> {
  /// See also [SearchLocation].
  SearchLocationProvider(
    String query,
  ) : this._internal(
          () => SearchLocation()..query = query,
          from: searchLocationProvider,
          name: r'searchLocationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchLocationHash,
          dependencies: SearchLocationFamily._dependencies,
          allTransitiveDependencies:
              SearchLocationFamily._allTransitiveDependencies,
          query: query,
        );

  SearchLocationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  FutureOr<List<SearchLocationModel>> runNotifierBuild(
    covariant SearchLocation notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(SearchLocation Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchLocationProvider._internal(
        () => create()..query = query,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SearchLocation,
      List<SearchLocationModel>> createElement() {
    return _SearchLocationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchLocationProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchLocationRef
    on AutoDisposeAsyncNotifierProviderRef<List<SearchLocationModel>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchLocationProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchLocation,
        List<SearchLocationModel>> with SearchLocationRef {
  _SearchLocationProviderElement(super.provider);

  @override
  String get query => (origin as SearchLocationProvider).query;
}

String _$registrationHash() => r'6029d07d3396e8cecaf8c9c8baadca700f37a2bd';

/// See also [Registration].
@ProviderFor(Registration)
final registrationProvider =
    AutoDisposeNotifierProvider<Registration, RegistrationState>.internal(
  Registration.new,
  name: r'registrationProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$registrationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Registration = AutoDisposeNotifier<RegistrationState>;
String _$changePasswordHash() => r'56d96477221a0895ce2d643890324cbe7e62a240';

/// See also [ChangePassword].
@ProviderFor(ChangePassword)
final changePasswordProvider =
    AutoDisposeNotifierProvider<ChangePassword, ChangePasswordState>.internal(
  ChangePassword.new,
  name: r'changePasswordProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$changePasswordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChangePassword = AutoDisposeNotifier<ChangePasswordState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
