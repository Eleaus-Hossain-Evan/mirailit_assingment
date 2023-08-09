import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../domain/home/model/category_model.dart';
import '../../domain/home/model/home_data.dart';
import '../../domain/home/model/product_model.dart';

class HomeState extends Equatable {
  final bool loading;
  final HomeData homeData;
  final IList<String> images;
  final IList<CategoryModel> categories;
  final IList<ProductModel> topProducts;
  final IList<ProductModel> favoriteProducts;

  const HomeState({
    required this.loading,
    required this.homeData,
    required this.images,
    required this.categories,
    required this.topProducts,
    required this.favoriteProducts,
  });

  factory HomeState.init() => HomeState(
        loading: false,
        homeData: HomeData.init(),
        images: const IListConst([]),
        categories: const IListConst([]),
        topProducts: const IListConst([]),
        favoriteProducts: const IListConst([]),
      );

  HomeState copyWith({
    bool? loading,
    HomeData? homeData,
    IList<String>? images,
    IList<CategoryModel>? categories,
    IList<ProductModel>? topProducts,
    IList<ProductModel>? favoriteProducts,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      homeData: homeData ?? this.homeData,
      images: images ?? this.images,
      categories: categories ?? this.categories,
      topProducts: topProducts ?? this.topProducts,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
    );
  }

  @override
  String toString() {
    return 'HomeState(loading: $loading, homeData: $homeData, images: $images, categories: $categories, topProducts: $topProducts, favoriteProducts: $favoriteProducts)';
  }

  @override
  List<Object> get props {
    return [
      loading,
      homeData,
      images,
      categories,
      topProducts,
      favoriteProducts,
    ];
  }
}
