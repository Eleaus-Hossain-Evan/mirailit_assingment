import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:mirailit_assingment/presentation/widgets/k_inkwell.dart';

import '../../../utils/utils.dart';
import 'home_appbar_search_delegate.dart';

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
            Gap(27.w),
            Flexible(
              child: Row(
                children: [
                  Images.iconSearch.assetImage(
                    width: 16.w,
                    height: 16.w,
                  ),
                  const Gap(7),
                  "Search here"
                      .text
                      .textStyle(TextStyle(fontSize: 14.sp))
                      .normal
                      .color(const Color(0xff969696))
                      .make()
                      .expand(),
                  Images.iconVoice.assetImage(
                    width: 16.w,
                    height: 16.w,
                  ),
                ],
              )
                  .pSymmetric(h: 10.w, v: 12)
                  .box
                  // .height(40.h)
                  .color(const Color(0xfff2f2f2))
                  .roundedSM
                  .make()
                  .onInkTap(() {
                showSearch(
                  context: context,
                  delegate: HomeAppBarSearchDelegate(ref),
                );
              }),
            ),
            Gap(26.w),
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
          top: 12.h,
        )
        .box
        .make();
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 16.h);
}
