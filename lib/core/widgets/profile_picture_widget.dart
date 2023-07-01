import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/assets_manager.dart';
class ProfilePicWidget extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  const ProfilePicWidget({super.key, required this.image, this.height = 30, this.width = 40});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: image,
        fadeOutDuration: Duration.zero,
        fadeInDuration: Duration.zero,
        imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                  image: DecorationImage(image: imageProvider)),
            ),
        errorWidget: (context, url, error) => Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(ImageAssets.noProfileImagePath))),
            ),
        placeholder: ((context, url) => Container(
              decoration:  BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                      image: AssetImage(ImageAssets.noProfileImagePath))),
            )));
  }
}