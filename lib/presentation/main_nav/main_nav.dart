import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirailit_assingment/utils/app_text_style.dart';
import 'package:mirailit_assingment/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

import '../home/home_screen.dart';

final bottomNavigatorKey = GlobalKey();

class MainNav extends HookConsumerWidget {
  static const route = '/main_nav';

  const MainNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = useState(0);
    final navWidget = [
      const HomeScreen(),
      const Center(child: Text("page1")),
      const Center(child: Text("page3")),
    ];

    useEffect(() {
      // Future.microtask(() => ref.read(authProvider.notifier).profileView());

      return () => Logger.i("app exit");
    }, const []);

    return LayoutBuilder(
      builder: (context, constrain) {
        return Scaffold(
          body: navWidget[navIndex.value],

          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: context.colors.surface,
            elevation: 0,
            currentIndex: navIndex.value,
            onTap: (v) => navIndex.value = v,
            selectedItemColor: context.colors.primary,
            unselectedItemColor: const Color(0xFFBFC5C9),
            selectedLabelStyle: TextStyle(
              color: context.colors.primary,
              fontSize: 10.sp,
              fontWeight: AppFontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 10.sp,
              fontWeight: AppFontWeight.medium,
            ),
            type: BottomNavigationBarType.fixed,
            useLegacyColorScheme: true,
            items: [
              BottomNavigationBarItem(
                activeIcon: Container(
                  padding: EdgeInsets.only(top: 12.h, bottom: 7.h),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 2,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  child: Images.iconHome.assetImage(
                    width: 23.w,
                    height: 23.w,
                  ),
                ),
                icon: Container(
                  padding: EdgeInsets.only(top: 12.h, bottom: 7.h),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 2,
                        color: AppColors.transparent,
                      ),
                    ),
                  ),
                  child: Images.iconHome.assetImage(
                    width: 23.w,
                    height: 23.w,
                    color: AppColors.grey,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  padding: EdgeInsets.only(top: 12.h, bottom: 7.h),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 2,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  child: Images.iconCategory.assetImage(
                    width: 23.w,
                    height: 23.w,
                    color: context.colors.primary,
                  ),
                ),
                icon: Container(
                  padding: EdgeInsets.only(top: 12.h, bottom: 7.h),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 2,
                        color: AppColors.transparent,
                      ),
                    ),
                  ),
                  child: Images.iconCategory.assetImage(
                    width: 23.w,
                    height: 23.w,
                  ),
                ),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  padding: EdgeInsets.only(top: 12.h, bottom: 7.h),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 2,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  child: Images.iconProfile.assetImage(
                    width: 23.w,
                    height: 23.w,
                    color: context.colors.primary,
                  ),
                ),
                icon: Container(
                  padding: EdgeInsets.only(top: 12.h, bottom: 7.h),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 2,
                        color: AppColors.transparent,
                      ),
                    ),
                  ),
                  child: Images.iconProfile.assetImage(
                    width: 23.w,
                    height: 23.w,
                  ),
                ),
                label: 'Profile',
              ),
            ],
          ),
          // bottomNavigationBar: Container(
          //   // height: 60,
          //   decoration: BoxDecoration(
          //     color: context.theme.scaffoldBackgroundColor.darken(),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Column(
          //         mainAxisSize: mainMin,
          //         children: [
          //           Container(
          //             color: context.colors.primary,
          //             height: 12.h,
          //             width: 30.w,
          //           ).box.bottomRounded().clip(Clip.hardEdge).make(),
          //           KInkWell(
          //             padding: padding12,
          //             onTap: () {
          //               // navIndex.value = 0;
          //             },
          //             child: Column(
          //               mainAxisSize: mainMin,
          //               children: [
          //                 Images.iconHome.assetImage(
          //                   width: 23.w,
          //                   height: 23.w,
          //                 ),
          //                 AppStrings.home.text
          //                     .color(navIndex.value == 0
          //                         ? context.colors.primary
          //                         : AppColors.black900)
          //                     .sm
          //                     .make()
          //               ],
          //             ),
          //           ).pOnly(bottom: 16.h),
          //         ],
          //       ),
          //       IconButton(
          //         enableFeedback: false,
          //         onPressed: () {
          //           navIndex.value = 1;
          //         },
          //         icon: const Icon(
          //           Icons.work_rounded,
          //           size: 35,
          //         ),
          //       ),
          //       IconButton(
          //         enableFeedback: false,
          //         onPressed: () {
          //           navIndex.value = 2;
          //         },
          //         icon: const Icon(
          //           Icons.widgets_rounded,
          //           size: 35,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        );
      },
    );
  }
}
