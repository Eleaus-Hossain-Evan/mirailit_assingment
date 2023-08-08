import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/auth/loggedin_provider.dart';
import '../presentation/auth/login/login.dart';
import '../presentation/auth/reset_password/reset_password.dart';
import '../presentation/auth/signup/signup.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/main_nav/main_nav.dart';
import '../presentation/notification/notification_screen.dart';
import '../presentation/parcel/add_parcel_screen.dart';
import '../presentation/profile/pages/bank_details_screen.dart';
import '../presentation/profile/pages/change_password_screen.dart';
import '../presentation/profile/pages/edit_profile/profile_detail_screen.dart';
import '../presentation/profile/pages/html_text.dart';
import '../presentation/profile/pages/my_shop_screen.dart';
import '../presentation/splash/splash_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  final listenable = ValueNotifier<bool>(true);

  return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: listenable,
      redirect: router._redirectLogic,
      routes: router._routes,
      initialLocation: SplashScreen.route,
      errorPageBuilder: router._errorPageBuilder,
      observers: [
        BotToastNavigatorObserver(),
      ]);
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<bool>(
      loggedInProvider.select((value) => value.loggedIn),
      (_, __) => notifyListeners(),
    );
    // _ref.listen<bool>(
    //   loggedInProvider.select((value) => value.onboarding),
    //   (_, __) => notifyListeners(),
    // );
  }

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    final token = _ref.watch(loggedInProvider.notifier).token;
    final user = _ref.watch(loggedInProvider.notifier).user;

    final isLoggedIn = _ref.watch(loggedInProvider).loggedIn; //bool
    // final isOnboarding = _ref.watch(loggedInProvider).onboarding; //bool

    Logger.i('RouterNotifier: isLoggedIn - $isLoggedIn');
    log('RouterNotifier:  $token, $user');

    final areWeLoggingIn = state.matchedLocation == LoginScreen.route;
    final areWeRegistering = state.matchedLocation == SignupScreen.route;

    if (!isLoggedIn && areWeLoggingIn) {
      return areWeLoggingIn ? null : LoginScreen.route;
    }
    if (!isLoggedIn && areWeRegistering) {
      return areWeRegistering ? null : SignupScreen.route;
    }

    if (areWeLoggingIn || areWeRegistering) {
      return MainNav.route;
    }

    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: SplashScreen.route,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: MainNav.route,
          builder: (context, state) => const MainNav(),
        ),
        GoRoute(
          path: HomeScreen.route,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: LoginScreen.route,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: SignupScreen.route,
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          path: NotificationScreen.route,
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: const NotificationScreen(),
          ),
        ),
        GoRoute(
          path: ResetPasswordScreen.route,
          pageBuilder: (context, state) => SlideBottomToTopTransitionPage(
            key: state.pageKey,
            child: const ResetPasswordScreen(),
          ),
        ),
        GoRoute(
          path: ProfileDetailScreen.route,
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: const ProfileDetailScreen(),
          ),
        ),
        GoRoute(
          path: MyShopScreen.route,
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: const MyShopScreen(),
          ),
        ),
        GoRoute(
          path: BankDetailsScreen.route,
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: const BankDetailsScreen(),
          ),
        ),
        GoRoute(
          path: HtmlTextScreen.route,
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: const HtmlTextScreen(
              details: '',
              title: '',
            ),
          ),
        ),
        GoRoute(
          path: ChangePasswordScreen.route,
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: const ChangePasswordScreen(),
          ),
        ),
        GoRoute(
          path: AddParcelScreen.route,
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: const AddParcelScreen(),
          ),
        ),
      ];
  Page<void> _errorPageBuilder(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          // backgroundColor: Theme.of(context).errorColor.withOpacity(.1),
          body: Center(
            child: Text('Error: ${state.error.toString()}'),
          ),
        ),
      );
}

class SlideRightToLeftTransitionPage extends CustomTransitionPage {
  SlideRightToLeftTransitionPage({
    LocalKey? key,
    required Widget child,
    bool fullscreenDialog = true,
  }) : super(
          key: key,
          fullscreenDialog: fullscreenDialog,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.easeInOut),
                ),
              ),
              child: child,
            );
          },
          child:
              child, // Here you may also wrap this child with some common designed widget
        );
}

class SlideBottomToTopTransitionPage extends CustomTransitionPage {
  SlideBottomToTopTransitionPage({
    LocalKey? key,
    required Widget child,
  }) : super(
          key: key,
          fullscreenDialog: true,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.easeInOut),
                ),
              ),
              child: child,
            );
          },
          child:
              child, // Here you may also wrap this child with some common designed widget
        );
}

class NoTransitionPage extends CustomTransitionPage {
  NoTransitionPage({
    LocalKey? key,
    required Widget child,
  }) : super(
          key: key,
          fullscreenDialog: true,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return child;
          },
          child: child,
        );
}
