import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/assets_manager.dart';
class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:image,
      width: 75,
      height: 75,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider)),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(ImageAssets.noProfileImagePath))),
        );
      },
    );
  }
}