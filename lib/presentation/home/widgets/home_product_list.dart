import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/global.dart';
import '../../../application/home/home_provider.dart';
import '../../../domain/home/model/product_model.dart';
import 'list_title_item_widget.dart';
import 'product_tiles.dart';

class HomeProductsList extends HookConsumerWidget {
  const HomeProductsList({
    super.key,
    required this.title,
    required this.products,
  });

  final String title;
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context, ref) {
    return ListTitleItemWidget<ProductModel>(
      title: title,
      items: products,
      builder: (context, product) => ProductTiles(
        image: product.image,
        title: product.title,
        weight: product.weight,
        price: product.price,
        discountPrice: product.discountPrice,
        discount: product.discount,
        onFavoriteTap: (v) =>
            ref.read(homeProvider.notifier).favoriteProduct(product),
        onCartAddTap: () => showToast("Product added to the cart"),
        isFavorite: ref.watch(homeProvider).favoriteProducts.contains(product),
      ),
    );
  }
}
