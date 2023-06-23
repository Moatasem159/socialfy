import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:socialfy/features/post/presentation/widgets/create_post_screen_widgets/image_item.dart';
class ImagesList extends StatelessWidget {
  final List<Medium>images;
  const ImagesList({super.key, required this.images});
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 5, mainAxisSpacing: 4),
        delegate: SliverChildBuilderDelegate(
            childCount: images.length,
                (context, index) => ImageItem(image: images[index])));
  }
}