import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/utils/assets_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late Timer _timer;
  AssetImage ?assetImage;

  _goNext(){
    if(AppStrings.userLoggedInId==null)
    {
      Navigator.pushNamedAndRemoveUntil(context, Routes.welcomeScreenRoute, (route) => false);
    }
    else if(AppStrings.userLoggedInId!=null){
      Navigator.pushNamedAndRemoveUntil(context,Routes.mainScreenRoute, (route) => false);
    }
  }
  _startDelay(){
    _timer=Timer(
        const Duration(
            milliseconds: 2000
        ),
            ()=>_goNext()
    );
  }

  @override
  void initState() {
    super.initState();
    assetImage = const AssetImage(ImageAssets.splashLogo,);
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();

  }
  @override
  void didChangeDependencies() {
    precacheImage(assetImage!, context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0x00000000),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.grey[200],
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.grey[200],
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor:Colors.grey[200],
          statusBarBrightness: Brightness.light,
          systemStatusBarContrastEnforced: true,
          systemNavigationBarContrastEnforced: true
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: assetImage!,
              width:  MediaQuery.of(context).size.width-150,
            ),
          ],
        ),
      ),
    );
  }
}
