import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/home/home_provider.dart';
import '../../utils/utils.dart';
import 'widgets/category_section.dart';
import 'widgets/discount_product_section.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_product_list.dart';
import 'widgets/home_silder_widget.dart';
import 'widgets/story_section.dart';

class HomeScreen extends HookConsumerWidget {
  static String route = "/home";
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = useMemoized<GlobalKey<ScaffoldState>>(GlobalKey.new);

    final state = ref.watch(homeProvider);

    ref.listen(homeProvider, (previous, next) {
      if (previous!.loading == false && next.loading) {
        BotToast.showLoading();
      }
      if (previous.loading == true && next.loading == false) {
        BotToast.closeAllLoading();
      }
    });

    useEffect(() {
      Future.wait([
        Future.microtask(() => ref.read(homeProvider.notifier).fetchStories()),
        Future.microtask(() => ref.read(homeProvider.notifier).getHomeData()),
        Future.microtask(
            () => ref.read(homeProvider.notifier).fetchCategories()),
        Future.microtask(
            () => ref.read(homeProvider.notifier).fetchTopProduct()),
        Future.microtask(
            () => ref.read(homeProvider.notifier).fetchHotProduct()),
        Future.microtask(
            () => ref.read(homeProvider.notifier).fetchNewArrivalProduct()),
      ]);
      return () => BotToast.closeAllLoading();
    }, const []);

    return Scaffold(
      key: scaffoldKey,
      appBar: HomeAppBar(scaffoldKey: scaffoldKey),
      drawer: const Drawer(),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              // story section ----------
              const StorySection(),
              Gap(22.h),

              // Category Section --------
              const CategorySection(),
              Gap(17.h),

              const DiscountProductSection(),
              Gap(27.h),

              //  Hot Items
              HomeProductsList(
                title: "Hot Item",
                products: state.hotProducts.unlock,
              ),
              Gap(30.h),

              //  Slider Section ---------
              const HomeSliderWidget(),

              Gap(27.h),

              //  New Arrival Items
              HomeProductsList(
                title: "New Arrivals",
                products: state.newArrivalProducts.unlock,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
