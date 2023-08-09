import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/utils.dart';
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
          Center(child: Text(AppStrings.category)),
          Center(child: Text(AppStrings.profile)),
        ],
      ),
      bottomNavigationBar: MainBottomNav(navIndex: navIndex),
    );
  }
}
