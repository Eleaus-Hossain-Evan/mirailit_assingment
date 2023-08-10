import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/home/model/product_model.dart';
import '../../infrastructure/home_repo.dart';
import '../global.dart';
import 'home_state.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(HomeRepo(), ref);
}, name: "homeProvider");

class HomeNotifier extends StateNotifier<HomeState> {
  final HomeRepo repo;
  final Ref ref;

  HomeNotifier(this.repo, this.ref) : super(HomeState.init());

  void getHomeData() async {
    state = state.copyWith(loading: true);
    final result = await repo.getHomeDate();

    result.fold(
      (l) {
        showErrorToast(l.error.message);
        return state = state.copyWith(loading: false);
      },
      (r) => state = state.copyWith(sliders: r, loading: false),
    );
  }

  Future<void> fetchStories() async {
    state = state.copyWith(loading: true);

    final result = await repo.fetchStories();

    result.fold(
      (l) {
        showErrorToast(l.error.message);
        return state = state.copyWith(loading: false);
      },
      (r) => state = state.copyWith(images: r.images.lock, loading: false),
    );
  }

  Future<void> fetchCategories() async {
    state = state.copyWith(loading: true);

    final result = await repo.fetchCategories();

    result.fold(
      (l) {
        showErrorToast(l.error.message);
        return state = state.copyWith(loading: false);
      },
      (r) => state = state.copyWith(categories: r.lock, loading: false),
    );
  }

  Future<void> fetchTopProduct() async {
    state = state.copyWith(loading: true);

    final result = await repo.fetchTopProduct();

    result.fold(
      (l) {
        showErrorToast(l.error.message);
        return state = state.copyWith(loading: false);
      },
      (r) => state = state.copyWith(topProducts: r.lock, loading: false),
    );
  }

  void favoriteProduct(ProductModel product) {
    final index = state.favoriteProducts.indexOf(product);
    Logger.d('index: $index');
    Logger.d(product);
    if (state.favoriteProducts.contains(product)) {
      final productList = state.favoriteProducts.remove(product);
      state = state.copyWith(favoriteProducts: productList);
    } else {
      final productList = state.favoriteProducts.add(product);
      state = state.copyWith(favoriteProducts: productList);
    }
  }

  Future<void> fetchHotProduct() async {
    state = state.copyWith(loading: true);

    final result = await repo.fetchHotProduct();

    result.fold(
      (l) {
        showErrorToast(l.error.message);
        return state = state.copyWith(loading: false);
      },
      (r) => state = state.copyWith(hotProducts: r.lock, loading: false),
    );
  }

  Future<void> fetchNewArrivalProduct() async {
    state = state.copyWith(loading: true);

    final result = await repo.fetchNewArrivalProduct();

    result.fold(
      (l) {
        showErrorToast(l.error.message);
        return state = state.copyWith(loading: false);
      },
      (r) => state = state.copyWith(newArrivalProducts: r.lock, loading: false),
    );
  }
}
