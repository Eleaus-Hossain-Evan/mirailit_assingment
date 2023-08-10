import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirailit_assingment/presentation/widgets/k_inkwell.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/utils.dart';

const tileColor = Color(0xFFF5F5F5);

const shadowColor = Color(0x00000000);

const primaryColor = Color(0xFF37AD57);

final titleTextStyle = TextStyle(
  color: const Color(0xFF181725),
  fontSize: 13.sp,
  fontFamily: 'Gilroy-Medium',
  fontWeight: FontWeight.w400,
);

final weightTextStyle = TextStyle(
  color: const Color(0xFF7C7C7C),
  fontSize: 12.sp,
  fontFamily: 'Gilroy-Medium',
  fontWeight: FontWeight.w400,
  height: 1.50,
);

final priceCurrentTextStyle = TextStyle(
  color: const Color(0xFF37AD57),
  fontSize: 14.sp,
  fontFamily: 'Gilroy-Bold',
  fontWeight: FontWeight.w400,
  height: 1.29,
  letterSpacing: 0.10,
);

final prevPriceTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 10.sp,
  fontFamily: 'Gilroy-SemiBold',
  fontWeight: FontWeight.w400,
  height: 1.80,
  letterSpacing: 0.10,
);

final pricePercentageTextStyle = TextStyle(
  color: const Color(0xFF37AD57),
  fontSize: 12.sp,
  fontFamily: 'Gilroy-Bold',
  fontWeight: FontWeight.w400,
  letterSpacing: 0.10,
);

class ProductTiles extends HookConsumerWidget {
  final bool isFavorite;
  final Function(bool isSelected) onFavoriteTap;
  final VoidCallback onCartAddTap;

  final String image;
  final String title;
  final String weight;
  final int price;
  final int discountPrice;
  final int discount;

  const ProductTiles({
    Key? key,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onCartAddTap,
    required this.image,
    required this.title,
    required this.weight,
    required this.price,
    required this.discountPrice,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isDiscount = useState(discount <= 0);

    return Container(
      width: 130.w,
      decoration: BoxDecoration(
        color: tileColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 12.r,
            offset: const Offset(0, 6),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            child: Stack(
              children: [
                Container(
                  height: 90.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(image),
                    ),
                  ),
                ),
                Visibility(
                  visible: !isDiscount.value,
                  child: Positioned(
                    top: 5.h,
                    left: 5.w, // Align green container to far left
                    child: Container(
                      width: 28.w,
                      height: 20.h,
                      color: primaryColor.withOpacity(.10),
                      child: Center(
                        child: Text(
                          '$discount%',
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            color: const Color(0xFF37AD57),
                            fontSize: 12.sp,
                            fontWeight: AppFontWeight.bold,
                            letterSpacing: 0.10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 6.h,
                  right: 5.w, // Align love icon to far right
                  child: isFavorite
                      ? GestureDetector(
                          onTap: () => onFavoriteTap(false),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )
                      : GestureDetector(
                          onTap: () => onFavoriteTap(true),
                          child: Icon(
                            Icons.favorite_border,
                            color: shadowColor.withOpacity(.38),
                          ),
                        ),
                ),
              ],
            ),
          ),
          const Gap(12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: AppFontWeight.medium,
                color: const Color(0xff181725),
              ),
            ),
          ),
          const Gap(2),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                weight,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: AppFontWeight.medium,
                  color: const Color(0xff7C7C7C),
                ),
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Gap(10.w),
              Text(
                isDiscount.value ? price.toCurrency : discountPrice.toCurrency,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: AppFontWeight.bold,
                  color: context.colors.primary,
                ),
              ),
              Gap(3.w),
              Visibility(
                visible: !isDiscount.value,
                child: Text(
                  price.toCurrency,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: AppFontWeight.semiBold,
                    color: const Color(0xff717171),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
              const Spacer(),
              KInkWell(
                onTap: () => onCartAddTap(),
                child: Container(
                  height: 28.w,
                  width: 28.w,
                  decoration: BoxDecoration(color: context.colors.primary),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
