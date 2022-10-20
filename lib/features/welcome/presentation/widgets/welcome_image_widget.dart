import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/assets_manager.dart';
import 'package:socialfy/core/utils/icons_manager.dart';
import 'package:socialfy/core/utils/values_manager.dart';

class WelcomeImageWidget extends StatefulWidget {
  const WelcomeImageWidget({Key? key}) : super(key: key);

  @override
  State<WelcomeImageWidget> createState() => _WelcomeImageWidgetState();
}

class _WelcomeImageWidgetState extends State<WelcomeImageWidget> {
  AssetImage ?assetImage;
  @override
  void initState() {

    super.initState();
    assetImage = const AssetImage(ImageAssets.image1);
  }
  @override
  void didChangeDependencies() {
    precacheImage(assetImage!, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height:380,
          width: MediaQuery.of(context).size.width,
          decoration:  BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.0),
                  Colors.black45,
                ],
              ),
              image:  DecorationImage(
                colorFilter: const ColorFilter.mode(Colors.black, BlendMode.overlay),
                image: assetImage!,
                fit: BoxFit.cover,

              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              )
          ),
        ),
        Container(
          height:380,
          width: MediaQuery.of(context).size.width,
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
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(MyCustomIcons.logo,size: AppSize.s110,color: Colors.white,),
                SizedBox(width: 25,)
              ],
            ),
            Text('Time to be Social',style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white
            ),)

          ],
        )
      ],
    );
  }
}
