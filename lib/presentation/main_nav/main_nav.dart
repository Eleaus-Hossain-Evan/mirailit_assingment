import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../home/home_screen.dart';
import 'widgets/main_bottom_nav.dart';

final bottomNavigatorKey = GlobalKey();

class MainNav extends HookConsumerWidget {
  static const route = '/main_nav';

  const MainNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = useState(0);

    useEffect(() {
      // Future.microtask(() => ref.read(authProvider.notifier).profileView());

      return () => Logger.i("app exit");
    }, const []);

    return Scaffold(
      body: IndexedStack(
        index: navIndex.value,
        children: const [
          HomeScreen(),
          Center(child: Text("page1")),
          Center(child: Text("page3")),
        ],
      ),
      bottomNavigationBar: MainBottomNav(navIndex: navIndex),
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
  }
}
