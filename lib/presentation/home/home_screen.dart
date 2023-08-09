import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/home/home_provider.dart';
import '../../utils/utils.dart';
import 'widgets/home_app_bar.dart';

class HomeScreen extends HookConsumerWidget {
  static String route = "/home";
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = useMemoized<GlobalKey<ScaffoldState>>(GlobalKey.new);
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
      key: scaffoldKey,
      appBar: HomeAppBar(scaffoldKey: scaffoldKey),
      drawer: const Drawer(),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          padding: padding16,
          child: Column(
            crossAxisAlignment: crossStart,
            children: const [],
          ),
        ),
      ),
    );
  }
}
