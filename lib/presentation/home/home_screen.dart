import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../application/home/home_provider.dart';
import '../../utils/utils.dart';
import '../widgets/widgets.dart';
import 'widgets/home_app_bar.dart';

class HomeScreen extends HookConsumerWidget {
  static String route = "/home";
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(homeProvider, (previous, next) {
      if (previous!.loading == false && next.loading) {
        BotToast.showLoading();
      }
      if (previous.loading == true && next.loading == false) {
        BotToast.closeAllLoading();
      }
    });

    useEffect(() {
      // Future.microtask(() => ref.read(authProvider.notifier).profileView());
      return () => BotToast.closeAllLoading();
    }, const []);

    return Scaffold(
      appBar: const HomeAppBar(),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          padding: padding16,
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              //?  recent parcel section ----------------
              "Recent Parcels".text.lg.bold.make(),
              gap16,
              KListViewSeparated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gap: 16,
                padding: padding0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: "Evan Hossain".text.make(),
                    subtitle:
                        "169/B, North Konipara, Tejgoan, Dhaka, Bangladesh"
                            .text
                            .make(),
                  );
                },
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
