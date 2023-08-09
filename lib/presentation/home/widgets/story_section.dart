import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/home/home_provider.dart';
import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';
import '../Image_full_view_screen.dart';

class StorySection extends HookConsumerWidget {
  const StorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(homeProvider);

    return SizedBox(
      height: 151.18.h,
      child: KListViewSeparated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: paddingLeft24,
        gap: 6.7,
        itemBuilder: (context, index) {
          return KInkWell(
            onTap: () {
              context.push("${ImageFullViewScreen.route}/$index");
            },
            child: KCachedNetworkImageNoBase(
              imageUrl: state.images[index],
              fit: BoxFit.fitWidth,
              height: 151.18.h,
              width: 94.73.w,
            ),
          );
        },
        itemCount: state.images.length,
      ),
    );
  }
}
