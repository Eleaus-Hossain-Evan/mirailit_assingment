import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../application/home/home_provider.dart';
import '../../utils/utils.dart';

class ImageFullViewScreen extends HookConsumerWidget {
  static String route = "/image-full-view";

  const ImageFullViewScreen({
    super.key,
    this.initialPage = 0,
  });

  final int initialPage;

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(homeProvider);
    return PhotoViewGallery.builder(
      pageController: PageController(initialPage: initialPage),
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: CachedNetworkImageProvider(state.images[index]),
          initialScale: PhotoViewComputedScale.contained * 0.8,
          heroAttributes: PhotoViewHeroAttributes(
            tag: state.images[index],
          ),
        );
      },
      itemCount: state.images.length,
      loadingBuilder: (context, event) => Center(
        child: SizedBox(
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator(
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
          ),
        ),
      ),
      backgroundDecoration: const BoxDecoration(color: AppColors.black1000),
    );
  }
}
