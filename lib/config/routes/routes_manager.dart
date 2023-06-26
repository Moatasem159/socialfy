import 'package:go_router/go_router.dart';
import 'package:socialfy/core/entities/user.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/home/presentation/screens/main_screen.dart';
import 'package:socialfy/features/login/presentation/screens/login_screen.dart';
import 'package:socialfy/features/messenger/presentation/screens/chat_screen.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/screens/comment_screen.dart';
import 'package:socialfy/features/post/presentation/screens/create_post_screen.dart';
import 'package:socialfy/features/post/presentation/screens/people_who_liked_screen.dart';
import 'package:socialfy/features/profile/presentation/screens/posts_screen.dart';
import 'package:socialfy/features/register/presentation/screens/register_screen.dart';
import 'package:socialfy/features/settings/presentation/screens/settings_screen.dart';
import 'package:socialfy/features/settings/presentation/screens/theme_settings_screen.dart';
import 'package:socialfy/features/welcome/presentation/screens/welcome_screen.dart';
class Routes {
  static const String initialRoute = "/";
  static const String welcomeScreenRoute = "/welcomeScreen";
  static const String loginScreenRoute = "/loginScreen";
  static const String registerScreenRoute = "/registerScreen";
  static const String mainScreenRoute = "/mainScreenRoute";
  static const String settingsScreenRoute = "/settingsScreenRoute";
  static const String themeSettingsScreenRoute = "/themeSettingsScreenRoute";
  static const String createPostScreenRoute = "/createPostScreenRoute";
  static const String chatScreenRoute = "/chatScreenRoute";
  static const String postLikesScreenRoute = "/postLikesScreenRoute";
  static const String commentsScreenRoute = "/commentsScreenRoute";
  static const String userPostScreenRoute = "/userPostScreenRoute";
}
class AppRoutes{
  static final router = GoRouter(
    routes: [
      GoRoute(
          path: Routes.initialRoute,
          name: Routes.initialRoute,
          builder: (context, state) => AppStrings.userLoggedInId != null
              ? const MainScreen()
              : const WelcomeScreen()),
      GoRoute(
          path: Routes.mainScreenRoute,
          name: Routes.mainScreenRoute,
          builder: (context, state) => const MainScreen()),
      GoRoute(
          path: Routes.welcomeScreenRoute,
          name: Routes.welcomeScreenRoute,
          builder: (context, state) => const WelcomeScreen()),
      GoRoute(
          path: Routes.loginScreenRoute,
          name: Routes.loginScreenRoute,
          builder: (context, state) => const LoginScreen()),
      GoRoute(
          path: Routes.registerScreenRoute,
          name: Routes.registerScreenRoute,
          builder: (context, state) => const RegisterScreen()),
      GoRoute(
          path: Routes.settingsScreenRoute,
          name: Routes.settingsScreenRoute,
          builder: (context, state) => const SettingsScreen()),
      GoRoute(
          path: Routes.themeSettingsScreenRoute,
          name: Routes.themeSettingsScreenRoute,
          builder: (context, state) => const ThemeSettingsScreen()),
      GoRoute(
          path: Routes.createPostScreenRoute,
          name: Routes.createPostScreenRoute,
          builder: (context, state) => const CreatePostScreen()),
      GoRoute(
          path: Routes.chatScreenRoute,
          name: Routes.chatScreenRoute,
          builder: (context, state) => ChatScreen(user: state.extra as User, newChat: state.queryParameters["newChat"]=='true'?true:false)),
      GoRoute(
          path: Routes.postLikesScreenRoute,
          name: Routes.postLikesScreenRoute,
          builder: (context, state) => PeopleWhoLikedScreen(ids: state.extra as List<String>)),
      GoRoute(
          path: Routes.commentsScreenRoute,
          name: Routes.commentsScreenRoute,
          builder: (context, state) => CommentsScreen(post: state.extra as Post)),
      GoRoute(
          path: Routes.userPostScreenRoute,
          name: Routes.userPostScreenRoute,
          builder: (context, state) => PostsScreen(index: state.extra as int)),
    ],
  );
}