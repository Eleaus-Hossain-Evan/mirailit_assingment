import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:mirailit_assingment/presentation/widgets/k_inkwell.dart';

import '../../../utils/utils.dart';

class HomeAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context, ref) {
    return SafeArea(
      child: SizedBox(
        width: 1.sw,
        child: Row(
          crossAxisAlignment: crossCenter,
          children: [
            KInkWell(
              onTap: () => scaffoldKey?.currentState?.openDrawer(),
              child: Images.iconHamburgerMenu.assetImage(
                width: 24.w,
                height: 24.w,
              ),
            ),
            gap16,
            Flexible(
              child: Row(
                children: [
                  Images.iconSearch.assetImage(
                    width: 16.w,
                    height: 16.w,
                  ),
                  const Gap(7),
                  Text(
                    "Search here",
                    style: ContentTextStyle.subtitle2.copyWith(
                      color: const Color(0xff969696),
                      letterSpacing: .3,
                    ),
                  ).expand()
                  // .text
                  // .medium
                  // .size(14.sp)
                  // .color(const Color(0xff969696))
                  // .make()
                  // .expand(),
                  ,
                  // "Search here"
                  //     .text
                  //     .subtitle2(context)
                  //     .medium
                  //     .letterSpacing(-.3)
                  //     .color(const Color(0xff969696))
                  //     .make(),
                  Images.iconVoice.assetImage(
                    width: 16.w,
                    height: 16.w,
                  ),
                ],
              )
                  .p(10.w)
                  .box
                  .height(40.h)
                  .color(const Color(0xfff2f2f2))
                  .roundedSM
                  .make(),
            ),
            gap18,
            Badge(
              label: const Text("1K"),
              child: Images.iconTrophy.assetImage(
                width: 21.w,
                height: 21.w,
              ),
            )
          ],
        ),
      ),
    )
        .pOnly(
          left: 16,
          right: 16,
          bottom: 8.h,
          top: 16.h,
        )
        .box
        .make();
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 16.h);
}
