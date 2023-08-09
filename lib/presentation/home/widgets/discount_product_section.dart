import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/global.dart';
import '../../../application/home/home_provider.dart';
import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';
import 'product_tiles.dart';

class DiscountProductSection extends HookConsumerWidget {
  const DiscountProductSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(homeProvider);
    return SizedBox(
      height: 198.h,
      child: KListViewSeparated(
        scrollDirection: Axis.horizontal,
        padding: paddingLeft24,
        itemCount: state.topProducts.length,
        shrinkWrap: true,
        gap: 10,
        itemBuilder: (_, i) {
          final product = state.topProducts[i];
          return ProductTiles(
            image: product.image,
            title: product.title,
            weight: product.weight,
            price: product.price,
            discountPrice: product.discountPrice,
            discount: product.discount,
            onFavoriteTap: (v) =>
                ref.read(homeProvider.notifier).favoriteProduct(product),
            onCartAddTap: () => showToast("Product added to the cart"),
            isFavorite: state.favoriteProducts.contains(product),
          );
        },
      ),
    );
  }
}
