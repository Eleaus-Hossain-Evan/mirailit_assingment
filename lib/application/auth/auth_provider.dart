import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/auth/login_body.dart';
import '../../domain/auth/model/user_model.dart';
import '../../domain/auth/password_update_body.dart';
import '../../domain/auth/profile_update_body.dart';
import '../../domain/auth/signUp_body.dart';
import '../../infrastructure/auth_repository.dart';
import '../../route/go_router.dart';
import '../../utils/utils.dart';
import '../global.dart';
import 'auth_state.dart';
import 'loggedin_provider.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(AuthRepo(), ref);
}, name: 'authProvider');

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepo repo;
  final Ref ref;

  AuthNotifier(this.repo, this.ref) : super(AuthState.init());

  void setUser(UserModel user) {
    state = state.copyWith(user: user);
  }

  void signUp(SignUpBody body) async {
    state = state.copyWith(loading: true);

    final res = await repo.signUp(body);

    state = res.fold(
      (l) {
        showErrorToast(l.error.message);
        return state.copyWith(failure: l, loading: false);
      },
      (r) {
        showToast(r.message);
        ref
            .read(loggedInProvider.notifier)
            .updateAuthCache(token: r.data.token, user: r.data);
        return state.copyWith(user: r.data, loading: false);
      },
    );
  }

  void login(LoginBody body) async {
    state = state.copyWith(loading: true);

    final result = await repo.login(body);

    state = result.fold(
      (l) {
        showErrorToast(l.error.message);
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) {
        showToast(r.message);
        ref
            .read(loggedInProvider.notifier)
            .updateAuthCache(token: r.data.token, user: r.data);
        NetworkHandler.instance.setToken(r.data.token);
        return state = state.copyWith(user: r.data, loading: false);
      },
    );
  }

  void logout() {
    state = state.copyWith(user: UserModel.init());

    ref.read(loggedInProvider.notifier).deleteAuthCache();
    NetworkHandler.instance.setToken("");

    // _ref.read(loggedInProvider.notifier).isLoggedIn();

    showToast('${state.user.name} logging out');
  }

  Future<bool> passwordUpdate(PasswordUpdateBody body) async {
    bool success = false;
    state = state.copyWith(loading: true);

    repo.passwordUpdate(body).then((result) {
      state = result.fold(
        (l) {
          showErrorToast(l.error.message);
          return state = state.copyWith(failure: l, loading: false);
        },
        (r) {
          success = r.success;
          showToast(r.message);
          ref.read(routerProvider).pop();
          return state = state.copyWith(user: r.data, loading: false);
        },
      );
    });

    return success;
  }

  Future<void> profileView() async {
    // state = state.copyWith(loading: true);
    final result = await repo.profileView();

    state = result.fold(
      (l) {
        showErrorToast(l.error.message);
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) {
        // ref.read(loggedInProvider).changeSavedUser(r.data);
        return state.copyWith(user: r.data, loading: false);
      },
    );
  }

  Future<bool> profileUpdate(ProfileUpdateBody updateUser, File? image) async {
    bool success = false;

    // state = state.copyWith(loading: true);

    if (image != null) {
      uploadImage(image);
    }

    final result = await repo.profileUpdate(state.user.copyWith(
      name: updateUser.name,
      email: updateUser.email,
      phone: updateUser.phone,
      address: updateUser.address,
      pickupStyle: updateUser.pickUpStyle,
    ));

    state = result.fold(
      (l) {
        showErrorToast(l.error.message);
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) {
        success = r.success;
        return state.copyWith(user: r.data, loading: false);
      },
    );

    return success;
  }

  Future<bool> uploadImage(File file) async {
    bool success = false;
    state = state.copyWith(loading: true);
    final result = await repo.imageUpload(file);

    state = result.fold(
      (l) {
        showErrorToast(l.error.message);
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) {
        success = true;
        return state.copyWith(user: r.data, loading: false);
      },
    );

    return success;
  }
}
