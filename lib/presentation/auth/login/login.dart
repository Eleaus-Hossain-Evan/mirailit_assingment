import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../application/auth/auth_provider.dart';
import '../../../domain/auth/login_body.dart';
import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';
import '../signup/signup.dart';

class LoginScreen extends HookConsumerWidget {
  static String route = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey.new);
    final emailPhoneController = useTextEditingController(text: "01728897255");
    final passwordController = useTextEditingController(text: "123456");
    final phoneFocus = useFocusScopeNode();
    final passwordFocus = useFocusScopeNode();

    ref.listen(
      authProvider,
      (previous, next) {
        if (previous!.loading == true && next.loading == false) {
          BotToast.closeAllLoading();
        } else {
          BotToast.showLoading();
        }
      },
    );

    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              Gap(80.h),
              Images.logo.assetImage(width: .6.sw).centered(),
              "Merchant"
                  .text
                  .xl3
                  .bold
                  .colorPrimary(context)
                  .italic
                  .makeCentered(),
              divider.w(.3.sw).centered(),
              gap36,
              Text(
                AppStrings.login.toTitleCase(),
                style: CustomTextStyle.textStyle30w700,
              ),
              gap8,
              Text(
                AppStrings.loginBelowText,
                style: CustomTextStyle.textStyle16w400Black900,
              ),
              gap24,
              KTextFormField2(
                controller: emailPhoneController,
                focusNode: phoneFocus,
                keyboardType: TextInputType.text,
                hintText: AppStrings.phoneNumberOrEmail,
              ),
              gap16,
              KTextFormField2(
                controller: passwordController,
                focusNode: passwordFocus,
                keyboardType: TextInputType.text,
                hintText: AppStrings.password,
                isObscure: true,
              ),

              gap24,
              KFilledButton(
                onPressed: () async {
                  ref.read(authProvider.notifier).login(LoginBody(
                        value: emailPhoneController.text,
                        password: passwordController.text,
                      ));
                },
                text: AppStrings.login,
              ),
              // FilledButton(
              //   onPressed: () {},
              //   child: Text('Login with Google'),
              // ),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text('Login with Facebook'),
              // ),
              // OutlinedButton(
              //   onPressed: () {},
              //   child: Text('Login with Apple'),
              // ),
              gap24,
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: mainSpaceBetween,
                  children: [
                    // InkWell(
                    //   onTap: () => remember.value = !remember.value,
                    //   child: Row(
                    //     children: [
                    //       Checkbox(
                    //         value: remember.value,
                    //         onChanged: (value) {
                    //           remember.value = value!;
                    //         },
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(4.r),
                    //         ),
                    //         side: BorderSide(
                    //           color: ColorPalate.harrisonGrey1000,
                    //           width: 1.5.w,
                    //         ),
                    //         visualDensity: VisualDensity.compact,
                    //       ),
                    //       Text(
                    //         AppStrings.remember,
                    //         style: CustomTextStyle.textStyle16w500HG900,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Flexible(
                      child: KInkWell(
                        // style: ButtonStyle(
                        //   padding: MaterialStateProperty.all(EdgeInsets.zero),
                        // ),
                        child: Text(
                          AppStrings.forgotPassword,
                          style:
                              CustomTextStyle.textStyle16w600secondary.copyWith(
                            color: ColorPalate.secondary200,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              gap24,
              Align(
                alignment: Alignment.center,
                child: Text(
                  AppStrings.dontHaveAccount,
                  style: CustomTextStyle.textStyle16w500Black900,
                ),
              ),
              gap16,
              KElevatedButton(
                onPressed: () {
                  context.replace(SignupScreen.route);
                },
                text: AppStrings.createAccount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
