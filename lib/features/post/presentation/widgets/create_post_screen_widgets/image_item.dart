import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:socialfy/features/post/presentation/cubit/get_gallery_cubit/get_gallery_cubit.dart';
class ImageItem extends StatelessWidget {
  final Medium image;
  const ImageItem({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image(
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (frame == null) {
            return Container(
              color: Colors.grey,
            );
          } else {
            return child;
          }
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey,
          );
        },
        image: ThumbnailProvider(mediumId: image.id),
        fit: BoxFit.cover),
      onTap: () => GetGalleryCubit.get(context).changeImage(image),
    );
  }
}