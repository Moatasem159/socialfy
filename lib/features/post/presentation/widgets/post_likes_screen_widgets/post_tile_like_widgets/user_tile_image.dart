import 'package:flutter/material.dart';
import 'package:socialfy/core/widgets/profile_picture_widget.dart';

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
        ProfilePicWidget(image: image, width:40, height:40),
        const Positioned(
            bottom: 0,
            right: 0,
            child: Icon(Icons.favorite_outlined, color: Colors.red,size: 20,))
      ],
    );
  }
}