import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mirailit_assingment/domain/home/model/product_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';

class ListTitleItemWidget<T> extends StatelessWidget {
  const ListTitleItemWidget({
    Key? key,
    required this.title,
    required this.items,
    required this.builder,
  }) : super(key: key);

  final String title;
  final List<T> items;
  final Function(BuildContext, T) builder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            title.text.lg.bold.make().expand(),
            Row(
              children: [
                "See all"
                    .text
                    .textStyle(ContentTextStyle.subtitle2)
                    .color(const Color(0xff757575))
                    .make(),
                Gap(7.w),
                Images.iconChevronRight
                    .assetImage(width: 7.5.w, color: const Color(0xff757575)),
              ],
            )
          ],
        ).pSymmetric(h: 25.w),
        gap10,
        SizedBox(
          height: T == ProductModel ? 205.h : 142.h,
          child: KListViewSeparated(
            scrollDirection: Axis.horizontal,
            padding: paddingLeft24,
            gap: 10,
            itemBuilder: (context, index) {
              final item = items[index];
              return builder(context, item);
            },
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}
