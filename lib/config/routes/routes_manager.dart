import 'package:flutter/material.dart';
import 'package:socialfy/app/injection_container.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/home/presentation/screens/main_screen.dart';
import 'package:socialfy/features/login/presentation/screens/login_screen.dart';
import 'package:socialfy/features/register/presentation/screens/register_screen.dart';
import 'package:socialfy/features/settings/presentation/screens/settings_screen.dart';
import 'package:socialfy/features/settings/presentation/screens/theme_settings_screen.dart';
import 'package:socialfy/features/welcome/presentation/screens/welcome_screen.dart';


class Routes {
  static const String splashRoute = "/";
  static const String welcomeScreenRoute = "/welcomeScreen";
  static const String loginScreenRoute = "/loginScreen";
  static const String registerScreenRoute = "/registerScreen";
  // static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainScreenRoute = "/mainScreenRoute";
  static const String settingsScreenRoute = "/settingsScreenRoute";
  static const String themeSettingsScreenRoute = "/themeSettingsScreenRoute";
  // static const String onBoardingRoute = "/onBoarding";
  // static const String storeDetailsRoute = "/storeDetails";
}


class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        if(AppStrings.userLoggedInId==null)
        {
          return MaterialPageRoute(builder: (_) =>  const WelcomeScreen());
        }
        else if(AppStrings.userLoggedInId!=null){
          return MaterialPageRoute(builder: (_) =>  const MainScreen());
        }
        return unDefinedRoute();
      case Routes.welcomeScreenRoute:
        return MaterialPageRoute(builder: (_) =>  const WelcomeScreen());
      case Routes.registerScreenRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) =>  const RegisterScreen());
      case Routes.loginScreenRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) =>  const LoginScreen());
      case Routes.mainScreenRoute:
        return MaterialPageRoute(builder: (_) =>  const MainScreen());
      case Routes.settingsScreenRoute:
        return MaterialPageRoute(builder: (_) =>  const SettingsScreen());
      case Routes.themeSettingsScreenRoute:
        return MaterialPageRoute(builder: (_) =>  const ThemeSettingsScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
