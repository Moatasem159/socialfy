import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserTileImage extends StatelessWidget {
  const UserTileImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: 45,
          height: 45,
        ),
        CachedNetworkImage(
          width: 40,
          height: 40,
          imageUrl: image,
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      width: 1),
                  shape: BoxShape.circle,
                  image: DecorationImage(image: imageProvider)),
            );
          },
        ),
        const Positioned(
            bottom: 0,
            right: 0,
            child: Icon(Icons.favorite_outlined, color: Colors.red,size: 20,))
      ],
    );
  }
}