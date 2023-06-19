import 'package:flutter/material.dart';
import 'package:socialfy/core/extensions/screen_size_extension.dart';
import 'package:socialfy/core/utils/assets_manager.dart';
class WelcomeImage extends StatefulWidget {
  const WelcomeImage({Key ?key}) : super(key: key);
  @override
  State<WelcomeImage> createState() => _WelcomeImageState();
}
class _WelcomeImageState extends State<WelcomeImage> {
  AssetImage ?assetImage;
  @override
  void initState() {
    super.initState();
    assetImage = const AssetImage(ImageAssets.welcomeImagePath);
  }
  @override
  void didChangeDependencies() {
    precacheImage(assetImage!, context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height:context.getHeight(h: 2),
          width: context.getWidth(),
          decoration:  BoxDecoration(
              gradient: const LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black45,
                ],
              ),
              image:DecorationImage(
                  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.overlay),
                  image: assetImage!,
                  fit: BoxFit.cover),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              )
          ),
        ),
        Container(
          height:context.getHeight(h: 2),
          width: context.getWidth(),
          decoration:   BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
                colors: [
                  Colors.blue,
                  Colors.black.withOpacity(.2)
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              )
          ),
        ),
      ],
    );
  }
}