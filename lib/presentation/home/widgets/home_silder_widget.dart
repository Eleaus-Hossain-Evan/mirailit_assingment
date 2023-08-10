import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/home/home_provider.dart';

class HomeSliderWidget extends HookConsumerWidget {
  const HomeSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(homeProvider);
    return SizedBox(
      height: 305.h,
      child: Swiper(
        itemCount: state.sliders.length,
        itemBuilder: (context, index) {
          return Image.asset(
            state.sliders[index],
            fit: BoxFit.cover,
          );
        },
        viewportFraction: .8,
        scale: .85,
      ),
    );
  }
}
