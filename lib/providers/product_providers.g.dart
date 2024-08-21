// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryListHash() => r'f07aff927d20e6c4e3eccfca87fcfab7fa0f4a7a';

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

abstract class _$CategoryList
    extends BuildlessAutoDisposeAsyncNotifier<List<CategoryModel>> {
  late final String? search;

  FutureOr<List<CategoryModel>> build({
    String? search,
  });
}

/// See also [CategoryList].
@ProviderFor(CategoryList)
const categoryListProvider = CategoryListFamily();

/// See also [CategoryList].
class CategoryListFamily extends Family<AsyncValue<List<CategoryModel>>> {
  /// See also [CategoryList].
  const CategoryListFamily();

  /// See also [CategoryList].
  CategoryListProvider call({
    String? search,
  }) {
    return CategoryListProvider(
      search: search,
    );
  }

  @override
  CategoryListProvider getProviderOverride(
    covariant CategoryListProvider provider,
  ) {
    return call(
      search: provider.search,
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
  String? get name => r'categoryListProvider';
}

/// See also [CategoryList].
class CategoryListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CategoryList, List<CategoryModel>> {
  /// See also [CategoryList].
  CategoryListProvider({
    String? search,
  }) : this._internal(
          () => CategoryList()..search = search,
          from: categoryListProvider,
          name: r'categoryListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryListHash,
          dependencies: CategoryListFamily._dependencies,
          allTransitiveDependencies:
              CategoryListFamily._allTransitiveDependencies,
          search: search,
        );

  CategoryListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.search,
  }) : super.internal();

  final String? search;

  @override
  FutureOr<List<CategoryModel>> runNotifierBuild(
    covariant CategoryList notifier,
  ) {
    return notifier.build(
      search: search,
    );
  }

  @override
  Override overrideWith(CategoryList Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryListProvider._internal(
        () => create()..search = search,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        search: search,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CategoryList, List<CategoryModel>>
      createElement() {
    return _CategoryListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryListProvider && other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryListRef
    on AutoDisposeAsyncNotifierProviderRef<List<CategoryModel>> {
  /// The parameter `search` of this provider.
  String? get search;
}

class _CategoryListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CategoryList,
        List<CategoryModel>> with CategoryListRef {
  _CategoryListProviderElement(super.provider);

  @override
  String? get search => (origin as CategoryListProvider).search;
}

String _$categoryDishListHash() => r'cfdb78fbbe7fd61f115b6c2342dcd64dd717ec49';

abstract class _$CategoryDishList
    extends BuildlessAutoDisposeAsyncNotifier<List<CategoryModel>> {
  late final String? search;

  FutureOr<List<CategoryModel>> build({
    String? search,
  });
}

/// See also [CategoryDishList].
@ProviderFor(CategoryDishList)
const categoryDishListProvider = CategoryDishListFamily();

/// See also [CategoryDishList].
class CategoryDishListFamily extends Family<AsyncValue<List<CategoryModel>>> {
  /// See also [CategoryDishList].
  const CategoryDishListFamily();

  /// See also [CategoryDishList].
  CategoryDishListProvider call({
    String? search,
  }) {
    return CategoryDishListProvider(
      search: search,
    );
  }

  @override
  CategoryDishListProvider getProviderOverride(
    covariant CategoryDishListProvider provider,
  ) {
    return call(
      search: provider.search,
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
  String? get name => r'categoryDishListProvider';
}

/// See also [CategoryDishList].
class CategoryDishListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    CategoryDishList, List<CategoryModel>> {
  /// See also [CategoryDishList].
  CategoryDishListProvider({
    String? search,
  }) : this._internal(
          () => CategoryDishList()..search = search,
          from: categoryDishListProvider,
          name: r'categoryDishListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryDishListHash,
          dependencies: CategoryDishListFamily._dependencies,
          allTransitiveDependencies:
              CategoryDishListFamily._allTransitiveDependencies,
          search: search,
        );

  CategoryDishListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.search,
  }) : super.internal();

  final String? search;

  @override
  FutureOr<List<CategoryModel>> runNotifierBuild(
    covariant CategoryDishList notifier,
  ) {
    return notifier.build(
      search: search,
    );
  }

  @override
  Override overrideWith(CategoryDishList Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryDishListProvider._internal(
        () => create()..search = search,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        search: search,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CategoryDishList, List<CategoryModel>>
      createElement() {
    return _CategoryDishListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryDishListProvider && other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryDishListRef
    on AutoDisposeAsyncNotifierProviderRef<List<CategoryModel>> {
  /// The parameter `search` of this provider.
  String? get search;
}

class _CategoryDishListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CategoryDishList,
        List<CategoryModel>> with CategoryDishListRef {
  _CategoryDishListProviderElement(super.provider);

  @override
  String? get search => (origin as CategoryDishListProvider).search;
}

String _$productsListHash() => r'ea98f6528493939891c1f21c44750f649d6f741a';

abstract class _$ProductsList
    extends BuildlessAutoDisposeAsyncNotifier<List<ProductModel>> {
  late final int? categoryId;
  late final String? search;
  late final bool? isMyProducts;

  FutureOr<List<ProductModel>> build({
    int? categoryId,
    String? search,
    bool? isMyProducts,
  });
}

/// See also [ProductsList].
@ProviderFor(ProductsList)
const productsListProvider = ProductsListFamily();

/// See also [ProductsList].
class ProductsListFamily extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [ProductsList].
  const ProductsListFamily();

  /// See also [ProductsList].
  ProductsListProvider call({
    int? categoryId,
    String? search,
    bool? isMyProducts,
  }) {
    return ProductsListProvider(
      categoryId: categoryId,
      search: search,
      isMyProducts: isMyProducts,
    );
  }

  @override
  ProductsListProvider getProviderOverride(
    covariant ProductsListProvider provider,
  ) {
    return call(
      categoryId: provider.categoryId,
      search: provider.search,
      isMyProducts: provider.isMyProducts,
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
  String? get name => r'productsListProvider';
}

/// See also [ProductsList].
class ProductsListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ProductsList, List<ProductModel>> {
  /// See also [ProductsList].
  ProductsListProvider({
    int? categoryId,
    String? search,
    bool? isMyProducts,
  }) : this._internal(
          () => ProductsList()
            ..categoryId = categoryId
            ..search = search
            ..isMyProducts = isMyProducts,
          from: productsListProvider,
          name: r'productsListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productsListHash,
          dependencies: ProductsListFamily._dependencies,
          allTransitiveDependencies:
              ProductsListFamily._allTransitiveDependencies,
          categoryId: categoryId,
          search: search,
          isMyProducts: isMyProducts,
        );

  ProductsListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.search,
    required this.isMyProducts,
  }) : super.internal();

  final int? categoryId;
  final String? search;
  final bool? isMyProducts;

  @override
  FutureOr<List<ProductModel>> runNotifierBuild(
    covariant ProductsList notifier,
  ) {
    return notifier.build(
      categoryId: categoryId,
      search: search,
      isMyProducts: isMyProducts,
    );
  }

  @override
  Override overrideWith(ProductsList Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductsListProvider._internal(
        () => create()
          ..categoryId = categoryId
          ..search = search
          ..isMyProducts = isMyProducts,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        search: search,
        isMyProducts: isMyProducts,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProductsList, List<ProductModel>>
      createElement() {
    return _ProductsListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductsListProvider &&
        other.categoryId == categoryId &&
        other.search == search &&
        other.isMyProducts == isMyProducts;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);
    hash = _SystemHash.combine(hash, isMyProducts.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductsListRef
    on AutoDisposeAsyncNotifierProviderRef<List<ProductModel>> {
  /// The parameter `categoryId` of this provider.
  int? get categoryId;

  /// The parameter `search` of this provider.
  String? get search;

  /// The parameter `isMyProducts` of this provider.
  bool? get isMyProducts;
}

class _ProductsListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductsList,
        List<ProductModel>> with ProductsListRef {
  _ProductsListProviderElement(super.provider);

  @override
  int? get categoryId => (origin as ProductsListProvider).categoryId;
  @override
  String? get search => (origin as ProductsListProvider).search;
  @override
  bool? get isMyProducts => (origin as ProductsListProvider).isMyProducts;
}

String _$dishProductsListHash() => r'd8dabbe42f0c20cec7c4f4413760d636f48995c3';

abstract class _$DishProductsList
    extends BuildlessAutoDisposeAsyncNotifier<List<DishProductModel>> {
  late final int? page;
  late final int? categoryId;

  FutureOr<List<DishProductModel>> build({
    int? page,
    int? categoryId,
  });
}

/// See also [DishProductsList].
@ProviderFor(DishProductsList)
const dishProductsListProvider = DishProductsListFamily();

/// See also [DishProductsList].
class DishProductsListFamily
    extends Family<AsyncValue<List<DishProductModel>>> {
  /// See also [DishProductsList].
  const DishProductsListFamily();

  /// See also [DishProductsList].
  DishProductsListProvider call({
    int? page,
    int? categoryId,
  }) {
    return DishProductsListProvider(
      page: page,
      categoryId: categoryId,
    );
  }

  @override
  DishProductsListProvider getProviderOverride(
    covariant DishProductsListProvider provider,
  ) {
    return call(
      page: provider.page,
      categoryId: provider.categoryId,
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
  String? get name => r'dishProductsListProvider';
}

/// See also [DishProductsList].
class DishProductsListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DishProductsList, List<DishProductModel>> {
  /// See also [DishProductsList].
  DishProductsListProvider({
    int? page,
    int? categoryId,
  }) : this._internal(
          () => DishProductsList()
            ..page = page
            ..categoryId = categoryId,
          from: dishProductsListProvider,
          name: r'dishProductsListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dishProductsListHash,
          dependencies: DishProductsListFamily._dependencies,
          allTransitiveDependencies:
              DishProductsListFamily._allTransitiveDependencies,
          page: page,
          categoryId: categoryId,
        );

  DishProductsListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.categoryId,
  }) : super.internal();

  final int? page;
  final int? categoryId;

  @override
  FutureOr<List<DishProductModel>> runNotifierBuild(
    covariant DishProductsList notifier,
  ) {
    return notifier.build(
      page: page,
      categoryId: categoryId,
    );
  }

  @override
  Override overrideWith(DishProductsList Function() create) {
    return ProviderOverride(
      origin: this,
      override: DishProductsListProvider._internal(
        () => create()
          ..page = page
          ..categoryId = categoryId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DishProductsList,
      List<DishProductModel>> createElement() {
    return _DishProductsListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DishProductsListProvider &&
        other.page == page &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DishProductsListRef
    on AutoDisposeAsyncNotifierProviderRef<List<DishProductModel>> {
  /// The parameter `page` of this provider.
  int? get page;

  /// The parameter `categoryId` of this provider.
  int? get categoryId;
}

class _DishProductsListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DishProductsList,
        List<DishProductModel>> with DishProductsListRef {
  _DishProductsListProviderElement(super.provider);

  @override
  int? get page => (origin as DishProductsListProvider).page;
  @override
  int? get categoryId => (origin as DishProductsListProvider).categoryId;
}

String _$updateDishHash() => r'eb5acece168e88a22c581a5201726425e5151f4c';

abstract class _$UpdateDish
    extends BuildlessAutoDisposeAsyncNotifier<ApiResponse?> {
  late final String? productId;
  late final DishProductModel? product;
  late final List<File>? images;

  FutureOr<ApiResponse?> build({
    String? productId,
    DishProductModel? product,
    List<File>? images,
  });
}

/// See also [UpdateDish].
@ProviderFor(UpdateDish)
const updateDishProvider = UpdateDishFamily();

/// See also [UpdateDish].
class UpdateDishFamily extends Family<AsyncValue<ApiResponse?>> {
  /// See also [UpdateDish].
  const UpdateDishFamily();

  /// See also [UpdateDish].
  UpdateDishProvider call({
    String? productId,
    DishProductModel? product,
    List<File>? images,
  }) {
    return UpdateDishProvider(
      productId: productId,
      product: product,
      images: images,
    );
  }

  @override
  UpdateDishProvider getProviderOverride(
    covariant UpdateDishProvider provider,
  ) {
    return call(
      productId: provider.productId,
      product: provider.product,
      images: provider.images,
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
  String? get name => r'updateDishProvider';
}

/// See also [UpdateDish].
class UpdateDishProvider
    extends AutoDisposeAsyncNotifierProviderImpl<UpdateDish, ApiResponse?> {
  /// See also [UpdateDish].
  UpdateDishProvider({
    String? productId,
    DishProductModel? product,
    List<File>? images,
  }) : this._internal(
          () => UpdateDish()
            ..productId = productId
            ..product = product
            ..images = images,
          from: updateDishProvider,
          name: r'updateDishProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateDishHash,
          dependencies: UpdateDishFamily._dependencies,
          allTransitiveDependencies:
              UpdateDishFamily._allTransitiveDependencies,
          productId: productId,
          product: product,
          images: images,
        );

  UpdateDishProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
    required this.product,
    required this.images,
  }) : super.internal();

  final String? productId;
  final DishProductModel? product;
  final List<File>? images;

  @override
  FutureOr<ApiResponse?> runNotifierBuild(
    covariant UpdateDish notifier,
  ) {
    return notifier.build(
      productId: productId,
      product: product,
      images: images,
    );
  }

  @override
  Override overrideWith(UpdateDish Function() create) {
    return ProviderOverride(
      origin: this,
      override: UpdateDishProvider._internal(
        () => create()
          ..productId = productId
          ..product = product
          ..images = images,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
        product: product,
        images: images,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UpdateDish, ApiResponse?>
      createElement() {
    return _UpdateDishProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateDishProvider &&
        other.productId == productId &&
        other.product == product &&
        other.images == images;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);
    hash = _SystemHash.combine(hash, product.hashCode);
    hash = _SystemHash.combine(hash, images.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateDishRef on AutoDisposeAsyncNotifierProviderRef<ApiResponse?> {
  /// The parameter `productId` of this provider.
  String? get productId;

  /// The parameter `product` of this provider.
  DishProductModel? get product;

  /// The parameter `images` of this provider.
  List<File>? get images;
}

class _UpdateDishProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UpdateDish, ApiResponse?>
    with UpdateDishRef {
  _UpdateDishProviderElement(super.provider);

  @override
  String? get productId => (origin as UpdateDishProvider).productId;
  @override
  DishProductModel? get product => (origin as UpdateDishProvider).product;
  @override
  List<File>? get images => (origin as UpdateDishProvider).images;
}

String _$radiusListHash() => r'fc7b2e1e5c6fed0bf6d563bb775efca6c2ce9536';

/// See also [RadiusList].
@ProviderFor(RadiusList)
final radiusListProvider =
    AutoDisposeAsyncNotifierProvider<RadiusList, List<RadiusModel>>.internal(
  RadiusList.new,
  name: r'radiusListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$radiusListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RadiusList = AutoDisposeAsyncNotifier<List<RadiusModel>>;
String _$kitchensListHash() => r'1bb2e13c2bd7eca832a87184ca4308461bd651e3';

/// See also [KitchensList].
@ProviderFor(KitchensList)
final kitchensListProvider =
    AutoDisposeAsyncNotifierProvider<KitchensList, List<KitchenList>>.internal(
  KitchensList.new,
  name: r'kitchensListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$kitchensListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$KitchensList = AutoDisposeAsyncNotifier<List<KitchenList>>;
String _$kitchensPostHash() => r'bb6173d4eeceb5cbe630be1766ad100447478d63';

abstract class _$KitchensPost
    extends BuildlessAutoDisposeAsyncNotifier<ApiResponse?> {
  late final List<int> ids;

  FutureOr<ApiResponse?> build(
    List<int> ids,
  );
}

/// See also [KitchensPost].
@ProviderFor(KitchensPost)
const kitchensPostProvider = KitchensPostFamily();

/// See also [KitchensPost].
class KitchensPostFamily extends Family<AsyncValue<ApiResponse?>> {
  /// See also [KitchensPost].
  const KitchensPostFamily();

  /// See also [KitchensPost].
  KitchensPostProvider call(
    List<int> ids,
  ) {
    return KitchensPostProvider(
      ids,
    );
  }

  @override
  KitchensPostProvider getProviderOverride(
    covariant KitchensPostProvider provider,
  ) {
    return call(
      provider.ids,
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
  String? get name => r'kitchensPostProvider';
}

/// See also [KitchensPost].
class KitchensPostProvider
    extends AutoDisposeAsyncNotifierProviderImpl<KitchensPost, ApiResponse?> {
  /// See also [KitchensPost].
  KitchensPostProvider(
    List<int> ids,
  ) : this._internal(
          () => KitchensPost()..ids = ids,
          from: kitchensPostProvider,
          name: r'kitchensPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$kitchensPostHash,
          dependencies: KitchensPostFamily._dependencies,
          allTransitiveDependencies:
              KitchensPostFamily._allTransitiveDependencies,
          ids: ids,
        );

  KitchensPostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ids,
  }) : super.internal();

  final List<int> ids;

  @override
  FutureOr<ApiResponse?> runNotifierBuild(
    covariant KitchensPost notifier,
  ) {
    return notifier.build(
      ids,
    );
  }

  @override
  Override overrideWith(KitchensPost Function() create) {
    return ProviderOverride(
      origin: this,
      override: KitchensPostProvider._internal(
        () => create()..ids = ids,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ids: ids,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<KitchensPost, ApiResponse?>
      createElement() {
    return _KitchensPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KitchensPostProvider && other.ids == ids;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ids.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin KitchensPostRef on AutoDisposeAsyncNotifierProviderRef<ApiResponse?> {
  /// The parameter `ids` of this provider.
  List<int> get ids;
}

class _KitchensPostProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<KitchensPost, ApiResponse?>
    with KitchensPostRef {
  _KitchensPostProviderElement(super.provider);

  @override
  List<int> get ids => (origin as KitchensPostProvider).ids;
}

String _$radiusPostHash() => r'1f7240a612f15fadd3cfba4b783261e34cc77a3e';

abstract class _$RadiusPost
    extends BuildlessAutoDisposeAsyncNotifier<ApiResponse?> {
  late final int radius;

  FutureOr<ApiResponse?> build({
    required int radius,
  });
}

/// See also [RadiusPost].
@ProviderFor(RadiusPost)
const radiusPostProvider = RadiusPostFamily();

/// See also [RadiusPost].
class RadiusPostFamily extends Family<AsyncValue<ApiResponse?>> {
  /// See also [RadiusPost].
  const RadiusPostFamily();

  /// See also [RadiusPost].
  RadiusPostProvider call({
    required int radius,
  }) {
    return RadiusPostProvider(
      radius: radius,
    );
  }

  @override
  RadiusPostProvider getProviderOverride(
    covariant RadiusPostProvider provider,
  ) {
    return call(
      radius: provider.radius,
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
  String? get name => r'radiusPostProvider';
}

/// See also [RadiusPost].
class RadiusPostProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RadiusPost, ApiResponse?> {
  /// See also [RadiusPost].
  RadiusPostProvider({
    required int radius,
  }) : this._internal(
          () => RadiusPost()..radius = radius,
          from: radiusPostProvider,
          name: r'radiusPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$radiusPostHash,
          dependencies: RadiusPostFamily._dependencies,
          allTransitiveDependencies:
              RadiusPostFamily._allTransitiveDependencies,
          radius: radius,
        );

  RadiusPostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.radius,
  }) : super.internal();

  final int radius;

  @override
  FutureOr<ApiResponse?> runNotifierBuild(
    covariant RadiusPost notifier,
  ) {
    return notifier.build(
      radius: radius,
    );
  }

  @override
  Override overrideWith(RadiusPost Function() create) {
    return ProviderOverride(
      origin: this,
      override: RadiusPostProvider._internal(
        () => create()..radius = radius,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        radius: radius,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RadiusPost, ApiResponse?>
      createElement() {
    return _RadiusPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RadiusPostProvider && other.radius == radius;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, radius.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RadiusPostRef on AutoDisposeAsyncNotifierProviderRef<ApiResponse?> {
  /// The parameter `radius` of this provider.
  int get radius;
}

class _RadiusPostProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RadiusPost, ApiResponse?>
    with RadiusPostRef {
  _RadiusPostProviderElement(super.provider);

  @override
  int get radius => (origin as RadiusPostProvider).radius;
}

String _$productDishHash() => r'0137825770a82b47371c93855021ae1cb78a1e6d';

abstract class _$ProductDish
    extends BuildlessAutoDisposeAsyncNotifier<ApiResponse?> {
  late final String? productId;

  FutureOr<ApiResponse?> build({
    String? productId,
  });
}

/// See also [ProductDish].
@ProviderFor(ProductDish)
const productDishProvider = ProductDishFamily();

/// See also [ProductDish].
class ProductDishFamily extends Family<AsyncValue<ApiResponse?>> {
  /// See also [ProductDish].
  const ProductDishFamily();

  /// See also [ProductDish].
  ProductDishProvider call({
    String? productId,
  }) {
    return ProductDishProvider(
      productId: productId,
    );
  }

  @override
  ProductDishProvider getProviderOverride(
    covariant ProductDishProvider provider,
  ) {
    return call(
      productId: provider.productId,
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
  String? get name => r'productDishProvider';
}

/// See also [ProductDish].
class ProductDishProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductDish, ApiResponse?> {
  /// See also [ProductDish].
  ProductDishProvider({
    String? productId,
  }) : this._internal(
          () => ProductDish()..productId = productId,
          from: productDishProvider,
          name: r'productDishProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productDishHash,
          dependencies: ProductDishFamily._dependencies,
          allTransitiveDependencies:
              ProductDishFamily._allTransitiveDependencies,
          productId: productId,
        );

  ProductDishProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String? productId;

  @override
  FutureOr<ApiResponse?> runNotifierBuild(
    covariant ProductDish notifier,
  ) {
    return notifier.build(
      productId: productId,
    );
  }

  @override
  Override overrideWith(ProductDish Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductDishProvider._internal(
        () => create()..productId = productId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProductDish, ApiResponse?>
      createElement() {
    return _ProductDishProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDishProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductDishRef on AutoDisposeAsyncNotifierProviderRef<ApiResponse?> {
  /// The parameter `productId` of this provider.
  String? get productId;
}

class _ProductDishProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductDish, ApiResponse?>
    with ProductDishRef {
  _ProductDishProviderElement(super.provider);

  @override
  String? get productId => (origin as ProductDishProvider).productId;
}

String _$deleteDishImageHash() => r'd47978c3a10a11f3d335de454634ea46c453b15d';

abstract class _$DeleteDishImage
    extends BuildlessAutoDisposeAsyncNotifier<ApiResponse?> {
  late final String imageId;

  FutureOr<ApiResponse?> build({
    required String imageId,
  });
}

/// See also [DeleteDishImage].
@ProviderFor(DeleteDishImage)
const deleteDishImageProvider = DeleteDishImageFamily();

/// See also [DeleteDishImage].
class DeleteDishImageFamily extends Family<AsyncValue<ApiResponse?>> {
  /// See also [DeleteDishImage].
  const DeleteDishImageFamily();

  /// See also [DeleteDishImage].
  DeleteDishImageProvider call({
    required String imageId,
  }) {
    return DeleteDishImageProvider(
      imageId: imageId,
    );
  }

  @override
  DeleteDishImageProvider getProviderOverride(
    covariant DeleteDishImageProvider provider,
  ) {
    return call(
      imageId: provider.imageId,
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
  String? get name => r'deleteDishImageProvider';
}

/// See also [DeleteDishImage].
class DeleteDishImageProvider extends AutoDisposeAsyncNotifierProviderImpl<
    DeleteDishImage, ApiResponse?> {
  /// See also [DeleteDishImage].
  DeleteDishImageProvider({
    required String imageId,
  }) : this._internal(
          () => DeleteDishImage()..imageId = imageId,
          from: deleteDishImageProvider,
          name: r'deleteDishImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteDishImageHash,
          dependencies: DeleteDishImageFamily._dependencies,
          allTransitiveDependencies:
              DeleteDishImageFamily._allTransitiveDependencies,
          imageId: imageId,
        );

  DeleteDishImageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.imageId,
  }) : super.internal();

  final String imageId;

  @override
  FutureOr<ApiResponse?> runNotifierBuild(
    covariant DeleteDishImage notifier,
  ) {
    return notifier.build(
      imageId: imageId,
    );
  }

  @override
  Override overrideWith(DeleteDishImage Function() create) {
    return ProviderOverride(
      origin: this,
      override: DeleteDishImageProvider._internal(
        () => create()..imageId = imageId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        imageId: imageId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DeleteDishImage, ApiResponse?>
      createElement() {
    return _DeleteDishImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteDishImageProvider && other.imageId == imageId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, imageId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteDishImageRef on AutoDisposeAsyncNotifierProviderRef<ApiResponse?> {
  /// The parameter `imageId` of this provider.
  String get imageId;
}

class _DeleteDishImageProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DeleteDishImage,
        ApiResponse?> with DeleteDishImageRef {
  _DeleteDishImageProviderElement(super.provider);

  @override
  String get imageId => (origin as DeleteDishImageProvider).imageId;
}

String _$addImagesDishHash() => r'e264c3ffb4f6311ba56935f1baf9161754de604e';

abstract class _$AddImagesDish
    extends BuildlessAutoDisposeAsyncNotifier<ApiResponse?> {
  late final String productId;
  late final List<File>? images;

  FutureOr<ApiResponse?> build({
    required String productId,
    List<File>? images,
  });
}

/// See also [AddImagesDish].
@ProviderFor(AddImagesDish)
const addImagesDishProvider = AddImagesDishFamily();

/// See also [AddImagesDish].
class AddImagesDishFamily extends Family<AsyncValue<ApiResponse?>> {
  /// See also [AddImagesDish].
  const AddImagesDishFamily();

  /// See also [AddImagesDish].
  AddImagesDishProvider call({
    required String productId,
    List<File>? images,
  }) {
    return AddImagesDishProvider(
      productId: productId,
      images: images,
    );
  }

  @override
  AddImagesDishProvider getProviderOverride(
    covariant AddImagesDishProvider provider,
  ) {
    return call(
      productId: provider.productId,
      images: provider.images,
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
  String? get name => r'addImagesDishProvider';
}

/// See also [AddImagesDish].
class AddImagesDishProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AddImagesDish, ApiResponse?> {
  /// See also [AddImagesDish].
  AddImagesDishProvider({
    required String productId,
    List<File>? images,
  }) : this._internal(
          () => AddImagesDish()
            ..productId = productId
            ..images = images,
          from: addImagesDishProvider,
          name: r'addImagesDishProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addImagesDishHash,
          dependencies: AddImagesDishFamily._dependencies,
          allTransitiveDependencies:
              AddImagesDishFamily._allTransitiveDependencies,
          productId: productId,
          images: images,
        );

  AddImagesDishProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
    required this.images,
  }) : super.internal();

  final String productId;
  final List<File>? images;

  @override
  FutureOr<ApiResponse?> runNotifierBuild(
    covariant AddImagesDish notifier,
  ) {
    return notifier.build(
      productId: productId,
      images: images,
    );
  }

  @override
  Override overrideWith(AddImagesDish Function() create) {
    return ProviderOverride(
      origin: this,
      override: AddImagesDishProvider._internal(
        () => create()
          ..productId = productId
          ..images = images,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
        images: images,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AddImagesDish, ApiResponse?>
      createElement() {
    return _AddImagesDishProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddImagesDishProvider &&
        other.productId == productId &&
        other.images == images;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);
    hash = _SystemHash.combine(hash, images.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddImagesDishRef on AutoDisposeAsyncNotifierProviderRef<ApiResponse?> {
  /// The parameter `productId` of this provider.
  String get productId;

  /// The parameter `images` of this provider.
  List<File>? get images;
}

class _AddImagesDishProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AddImagesDish, ApiResponse?>
    with AddImagesDishRef {
  _AddImagesDishProviderElement(super.provider);

  @override
  String get productId => (origin as AddImagesDishProvider).productId;
  @override
  List<File>? get images => (origin as AddImagesDishProvider).images;
}

String _$addPriceHash() => r'697bc5315b480d9766481397b57f5625d8ece705';

abstract class _$AddPrice
    extends BuildlessAutoDisposeAsyncNotifier<ApiResponse?> {
  late final int? productId;
  late final int? price;
  late final bool? isNotAvailable;

  FutureOr<ApiResponse?> build({
    int? productId,
    int? price,
    bool? isNotAvailable,
  });
}

/// See also [AddPrice].
@ProviderFor(AddPrice)
const addPriceProvider = AddPriceFamily();

/// See also [AddPrice].
class AddPriceFamily extends Family<AsyncValue<ApiResponse?>> {
  /// See also [AddPrice].
  const AddPriceFamily();

  /// See also [AddPrice].
  AddPriceProvider call({
    int? productId,
    int? price,
    bool? isNotAvailable,
  }) {
    return AddPriceProvider(
      productId: productId,
      price: price,
      isNotAvailable: isNotAvailable,
    );
  }

  @override
  AddPriceProvider getProviderOverride(
    covariant AddPriceProvider provider,
  ) {
    return call(
      productId: provider.productId,
      price: provider.price,
      isNotAvailable: provider.isNotAvailable,
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
  String? get name => r'addPriceProvider';
}

/// See also [AddPrice].
class AddPriceProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AddPrice, ApiResponse?> {
  /// See also [AddPrice].
  AddPriceProvider({
    int? productId,
    int? price,
    bool? isNotAvailable,
  }) : this._internal(
          () => AddPrice()
            ..productId = productId
            ..price = price
            ..isNotAvailable = isNotAvailable,
          from: addPriceProvider,
          name: r'addPriceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addPriceHash,
          dependencies: AddPriceFamily._dependencies,
          allTransitiveDependencies: AddPriceFamily._allTransitiveDependencies,
          productId: productId,
          price: price,
          isNotAvailable: isNotAvailable,
        );

  AddPriceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
    required this.price,
    required this.isNotAvailable,
  }) : super.internal();

  final int? productId;
  final int? price;
  final bool? isNotAvailable;

  @override
  FutureOr<ApiResponse?> runNotifierBuild(
    covariant AddPrice notifier,
  ) {
    return notifier.build(
      productId: productId,
      price: price,
      isNotAvailable: isNotAvailable,
    );
  }

  @override
  Override overrideWith(AddPrice Function() create) {
    return ProviderOverride(
      origin: this,
      override: AddPriceProvider._internal(
        () => create()
          ..productId = productId
          ..price = price
          ..isNotAvailable = isNotAvailable,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
        price: price,
        isNotAvailable: isNotAvailable,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AddPrice, ApiResponse?>
      createElement() {
    return _AddPriceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddPriceProvider &&
        other.productId == productId &&
        other.price == price &&
        other.isNotAvailable == isNotAvailable;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);
    hash = _SystemHash.combine(hash, price.hashCode);
    hash = _SystemHash.combine(hash, isNotAvailable.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddPriceRef on AutoDisposeAsyncNotifierProviderRef<ApiResponse?> {
  /// The parameter `productId` of this provider.
  int? get productId;

  /// The parameter `price` of this provider.
  int? get price;

  /// The parameter `isNotAvailable` of this provider.
  bool? get isNotAvailable;
}

class _AddPriceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AddPrice, ApiResponse?>
    with AddPriceRef {
  _AddPriceProviderElement(super.provider);

  @override
  int? get productId => (origin as AddPriceProvider).productId;
  @override
  int? get price => (origin as AddPriceProvider).price;
  @override
  bool? get isNotAvailable => (origin as AddPriceProvider).isNotAvailable;
}

String _$addDiscountHash() => r'3d745fac3f3d8aa8ce81333881edbe3559cdc3f8';

abstract class _$AddDiscount
    extends BuildlessAutoDisposeAsyncNotifier<ApiResponse?> {
  late final int id;
  late final int discount;
  late final int intervalTime;

  FutureOr<ApiResponse?> build({
    required int id,
    required int discount,
    required int intervalTime,
  });
}

/// See also [AddDiscount].
@ProviderFor(AddDiscount)
const addDiscountProvider = AddDiscountFamily();

/// See also [AddDiscount].
class AddDiscountFamily extends Family<AsyncValue<ApiResponse?>> {
  /// See also [AddDiscount].
  const AddDiscountFamily();

  /// See also [AddDiscount].
  AddDiscountProvider call({
    required int id,
    required int discount,
    required int intervalTime,
  }) {
    return AddDiscountProvider(
      id: id,
      discount: discount,
      intervalTime: intervalTime,
    );
  }

  @override
  AddDiscountProvider getProviderOverride(
    covariant AddDiscountProvider provider,
  ) {
    return call(
      id: provider.id,
      discount: provider.discount,
      intervalTime: provider.intervalTime,
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
  String? get name => r'addDiscountProvider';
}

/// See also [AddDiscount].
class AddDiscountProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AddDiscount, ApiResponse?> {
  /// See also [AddDiscount].
  AddDiscountProvider({
    required int id,
    required int discount,
    required int intervalTime,
  }) : this._internal(
          () => AddDiscount()
            ..id = id
            ..discount = discount
            ..intervalTime = intervalTime,
          from: addDiscountProvider,
          name: r'addDiscountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addDiscountHash,
          dependencies: AddDiscountFamily._dependencies,
          allTransitiveDependencies:
              AddDiscountFamily._allTransitiveDependencies,
          id: id,
          discount: discount,
          intervalTime: intervalTime,
        );

  AddDiscountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.discount,
    required this.intervalTime,
  }) : super.internal();

  final int id;
  final int discount;
  final int intervalTime;

  @override
  FutureOr<ApiResponse?> runNotifierBuild(
    covariant AddDiscount notifier,
  ) {
    return notifier.build(
      id: id,
      discount: discount,
      intervalTime: intervalTime,
    );
  }

  @override
  Override overrideWith(AddDiscount Function() create) {
    return ProviderOverride(
      origin: this,
      override: AddDiscountProvider._internal(
        () => create()
          ..id = id
          ..discount = discount
          ..intervalTime = intervalTime,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        discount: discount,
        intervalTime: intervalTime,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AddDiscount, ApiResponse?>
      createElement() {
    return _AddDiscountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddDiscountProvider &&
        other.id == id &&
        other.discount == discount &&
        other.intervalTime == intervalTime;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, discount.hashCode);
    hash = _SystemHash.combine(hash, intervalTime.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddDiscountRef on AutoDisposeAsyncNotifierProviderRef<ApiResponse?> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `discount` of this provider.
  int get discount;

  /// The parameter `intervalTime` of this provider.
  int get intervalTime;
}

class _AddDiscountProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AddDiscount, ApiResponse?>
    with AddDiscountRef {
  _AddDiscountProviderElement(super.provider);

  @override
  int get id => (origin as AddDiscountProvider).id;
  @override
  int get discount => (origin as AddDiscountProvider).discount;
  @override
  int get intervalTime => (origin as AddDiscountProvider).intervalTime;
}

String _$addCategoryDishHash() => r'e6f38f44a5b7cd6ac0137b7f1761fe40addace05';

abstract class _$AddCategoryDish
    extends BuildlessAutoDisposeAsyncNotifier<ApiResponse?> {
  late final String nameCategory;
  late final File image;

  FutureOr<ApiResponse?> build({
    required String nameCategory,
    required File image,
  });
}

/// See also [AddCategoryDish].
@ProviderFor(AddCategoryDish)
const addCategoryDishProvider = AddCategoryDishFamily();

/// See also [AddCategoryDish].
class AddCategoryDishFamily extends Family<AsyncValue<ApiResponse?>> {
  /// See also [AddCategoryDish].
  const AddCategoryDishFamily();

  /// See also [AddCategoryDish].
  AddCategoryDishProvider call({
    required String nameCategory,
    required File image,
  }) {
    return AddCategoryDishProvider(
      nameCategory: nameCategory,
      image: image,
    );
  }

  @override
  AddCategoryDishProvider getProviderOverride(
    covariant AddCategoryDishProvider provider,
  ) {
    return call(
      nameCategory: provider.nameCategory,
      image: provider.image,
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
  String? get name => r'addCategoryDishProvider';
}

/// See also [AddCategoryDish].
class AddCategoryDishProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AddCategoryDish, ApiResponse?> {
  /// See also [AddCategoryDish].
  AddCategoryDishProvider({
    required String nameCategory,
    required File image,
  }) : this._internal(
          () => AddCategoryDish()
            ..nameCategory = nameCategory
            ..image = image,
          from: addCategoryDishProvider,
          name: r'addCategoryDishProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addCategoryDishHash,
          dependencies: AddCategoryDishFamily._dependencies,
          allTransitiveDependencies:
              AddCategoryDishFamily._allTransitiveDependencies,
          nameCategory: nameCategory,
          image: image,
        );

  AddCategoryDishProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.nameCategory,
    required this.image,
  }) : super.internal();

  final String nameCategory;
  final File image;

  @override
  FutureOr<ApiResponse?> runNotifierBuild(
    covariant AddCategoryDish notifier,
  ) {
    return notifier.build(
      nameCategory: nameCategory,
      image: image,
    );
  }

  @override
  Override overrideWith(AddCategoryDish Function() create) {
    return ProviderOverride(
      origin: this,
      override: AddCategoryDishProvider._internal(
        () => create()
          ..nameCategory = nameCategory
          ..image = image,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        nameCategory: nameCategory,
        image: image,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AddCategoryDish, ApiResponse?>
      createElement() {
    return _AddCategoryDishProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddCategoryDishProvider &&
        other.nameCategory == nameCategory &&
        other.image == image;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, nameCategory.hashCode);
    hash = _SystemHash.combine(hash, image.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddCategoryDishRef on AutoDisposeAsyncNotifierProviderRef<ApiResponse?> {
  /// The parameter `nameCategory` of this provider.
  String get nameCategory;

  /// The parameter `image` of this provider.
  File get image;
}

class _AddCategoryDishProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AddCategoryDish,
        ApiResponse?> with AddCategoryDishRef {
  _AddCategoryDishProviderElement(super.provider);

  @override
  String get nameCategory => (origin as AddCategoryDishProvider).nameCategory;
  @override
  File get image => (origin as AddCategoryDishProvider).image;
}

String _$addDishHash() => r'd04992aad07f83b73f7d7907a238f0425ac7c07e';

abstract class _$AddDish
    extends BuildlessAutoDisposeAsyncNotifier<ApiResponse?> {
  late final DishProductModel product;
  late final List<File> images;

  FutureOr<ApiResponse?> build({
    required DishProductModel product,
    required List<File> images,
  });
}

/// See also [AddDish].
@ProviderFor(AddDish)
const addDishProvider = AddDishFamily();

/// See also [AddDish].
class AddDishFamily extends Family<AsyncValue<ApiResponse?>> {
  /// See also [AddDish].
  const AddDishFamily();

  /// See also [AddDish].
  AddDishProvider call({
    required DishProductModel product,
    required List<File> images,
  }) {
    return AddDishProvider(
      product: product,
      images: images,
    );
  }

  @override
  AddDishProvider getProviderOverride(
    covariant AddDishProvider provider,
  ) {
    return call(
      product: provider.product,
      images: provider.images,
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
  String? get name => r'addDishProvider';
}

/// See also [AddDish].
class AddDishProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AddDish, ApiResponse?> {
  /// See also [AddDish].
  AddDishProvider({
    required DishProductModel product,
    required List<File> images,
  }) : this._internal(
          () => AddDish()
            ..product = product
            ..images = images,
          from: addDishProvider,
          name: r'addDishProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addDishHash,
          dependencies: AddDishFamily._dependencies,
          allTransitiveDependencies: AddDishFamily._allTransitiveDependencies,
          product: product,
          images: images,
        );

  AddDishProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.product,
    required this.images,
  }) : super.internal();

  final DishProductModel product;
  final List<File> images;

  @override
  FutureOr<ApiResponse?> runNotifierBuild(
    covariant AddDish notifier,
  ) {
    return notifier.build(
      product: product,
      images: images,
    );
  }

  @override
  Override overrideWith(AddDish Function() create) {
    return ProviderOverride(
      origin: this,
      override: AddDishProvider._internal(
        () => create()
          ..product = product
          ..images = images,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        product: product,
        images: images,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AddDish, ApiResponse?>
      createElement() {
    return _AddDishProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddDishProvider &&
        other.product == product &&
        other.images == images;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, product.hashCode);
    hash = _SystemHash.combine(hash, images.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddDishRef on AutoDisposeAsyncNotifierProviderRef<ApiResponse?> {
  /// The parameter `product` of this provider.
  DishProductModel get product;

  /// The parameter `images` of this provider.
  List<File> get images;
}

class _AddDishProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AddDish, ApiResponse?>
    with AddDishRef {
  _AddDishProviderElement(super.provider);

  @override
  DishProductModel get product => (origin as AddDishProvider).product;
  @override
  List<File> get images => (origin as AddDishProvider).images;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
