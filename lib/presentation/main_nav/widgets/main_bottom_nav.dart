import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../utils/utils.dart';

class MainBottomNav extends StatelessWidget {
  const MainBottomNav({
    super.key,
    required this.navIndex,
  });

  final ValueNotifier<int> navIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
          label: AppStrings.home,
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
          label: AppStrings.category,
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
          label: AppStrings.profile,
        ),
      ],
    );
  }
}
