// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirailit_assingment/theme/app_theme.dart';

import 'application/local_storage/storage_handler.dart';
import 'application/global.dart';
import 'route/go_router.dart';

import '../../utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer(
    observers: [ProviderLog()],
  );

  //  initialize the logger with custom color,
  //  that will helping log anything anywhere in the project
  Logger.init(
    kDebugMode,
    isShowFile: false,
    isShowTime: false,
    levelVerbose: 247,
    levelDebug: 15,
    levelInfo: 10,
    levelWarn: 5,
    levelError: 9,
    phoneVerbose: Colors.white,
    phoneDebug: AppColors.success,
    phoneInfo: AppColors.info,
    phoneWarn: AppColors.warning,
    phoneError: AppColors.error,
  );

  //  initialize local storage.....
  final box = container.read(hiveProvider);
  await box.init();

  //  initialize the theme provider
  container.read(themeProvider);

  //  read the saved token from local storage...
  final String token = box.get(AppStrings.token, defaultValue: '');

  //  initialize the Network Handler class using for calling api's and setup the token....
  NetworkHandler.instance
    ..setup(baseUrl: APIRoute.BASE_URL, showLogs: false)
    ..setToken("token");

  Logger.d('token: $token');

  //  run flutter app
  runApp(
    ProviderScope(
      parent: container,
      observers: [ProviderLog()],
      child: const MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  initialize router provider
    final router = ref.watch(routerProvider);
    //  initialize theme provider
    final appTheme = ref.watch(themeProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return DismissKeyboard(
          child: MaterialApp.router(
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            scaffoldMessengerKey: ref.watch(scaffoldKeyProvider),
            scrollBehavior: const ScrollBehavior()
                .copyWith(physics: const BouncingScrollPhysics()),
            //: Router
            routerConfig: router,
            //:BotToast
            builder: BotToastInit(),

            //:localization
            // localizationsDelegates: AppLocalizations.localizationsDelegates,
            // supportedLocales: AppLocalizations.supportedLocales,
            locale: ref.watch(appLocalProvider),

            //:theme
            themeMode: appTheme.theme.isEmpty
                ? ThemeMode.system
                : appTheme.theme == "dark"
                    ? ThemeMode.dark
                    : ThemeMode.light,

            theme: const AppTheme().themeData,
          ),
        );
      },
    );
  }
}

// helping logging provider's state
class ProviderLog extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    Logger.i('''
{
  "PROVIDER": "${provider.name}; ${provider.runtimeType.toString()}"

}''');
    log("$newValue");
  }
}
