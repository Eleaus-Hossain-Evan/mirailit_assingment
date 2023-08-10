import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../domain/home/model/category_model.dart';
import '../../domain/home/model/product_model.dart';

class HomeState extends Equatable {
  final bool loading;
  final List<String> sliders;
  final IList<String> images;
  final IList<CategoryModel> categories;
  final IList<ProductModel> topProducts;
  final IList<ProductModel> favoriteProducts;
  final IList<ProductModel> hotProducts;
  final IList<ProductModel> newArrivalProducts;

  const HomeState({
    required this.loading,
    required this.sliders,
    required this.images,
    required this.categories,
    required this.topProducts,
    required this.favoriteProducts,
    required this.hotProducts,
    required this.newArrivalProducts,
  });

  factory HomeState.init() => const HomeState(
        loading: false,
        sliders: [],
        images: IListConst([]),
        categories: IListConst([]),
        topProducts: IListConst([]),
        favoriteProducts: IListConst([]),
        hotProducts: IListConst([]),
        newArrivalProducts: IListConst([]),
      );

  HomeState copyWith({
    bool? loading,
    List<String>? sliders,
    IList<String>? images,
    IList<CategoryModel>? categories,
    IList<ProductModel>? topProducts,
    IList<ProductModel>? favoriteProducts,
    IList<ProductModel>? hotProducts,
    IList<ProductModel>? newArrivalProducts,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      sliders: sliders ?? this.sliders,
      images: images ?? this.images,
      categories: categories ?? this.categories,
      topProducts: topProducts ?? this.topProducts,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
      hotProducts: hotProducts ?? this.hotProducts,
      newArrivalProducts: newArrivalProducts ?? this.newArrivalProducts,
    );
  }

  @override
  String toString() {
    return 'HomeState(loading: $loading, sliders: $sliders, images: $images, categories: $categories, topProducts: $topProducts, favoriteProducts: $favoriteProducts, hotProducts: $hotProducts, newArrivalProducts: $newArrivalProducts)';
  }

  @override
  List<Object> get props {
    return [
      loading,
      sliders,
      images,
      categories,
      topProducts,
      favoriteProducts,
      hotProducts,
      newArrivalProducts,
    ];
  }
}
