import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../application/home/home_provider.dart';
import '../../../domain/home/model/category_model.dart';
import '../../../utils/utils.dart';
import 'list_title_item_widget.dart';

class CategorySection extends HookConsumerWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return ListTitleItemWidget<CategoryModel>(
      title: "Categories",
      items: ref.watch(homeProvider).categories.unlock,
      builder: (context, category) => Column(
        mainAxisSize: mainMin,
        children: [
          category.image.assetImage(
            height: 109.h,
            width: 129.w,
          ),
          Gap(11.h),
          category.title.text.bold
              .subtitle2(context)
              .color(const Color(0xff3d3c48))
              .make(),
        ],
      ),
    );
  }
}
