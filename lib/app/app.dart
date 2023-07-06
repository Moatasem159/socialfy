import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/app/injection_container.dart' as di;
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/config/themes/app_theme.dart';
import 'package:socialfy/features/messenger/presentation/cubits/get_chats_cubit/get_chats_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/get_posts_cubit/news_feed_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/like_post_cubit/like_post_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/user_posts_cubit/user_posts_cubit.dart';
import 'package:socialfy/features/settings/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:socialfy/features/settings/presentation/cubit/theme_cubit/theme_state.dart';
import 'package:socialfy/features/users/presentation/cubits/get_all_users_cubit.dart';
import 'package:socialfy/features/users/presentation/cubits/get_all_users_state.dart';
class Socialfy extends StatelessWidget {
  const Socialfy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<GetPostsCubit>()),
        BlocProvider(create: (context) => UserPostsCubit()),
        BlocProvider(create: (context) => di.sl<LikePostCubit>()),
        BlocProvider(create: (context) => di.sl<ProfileCubit>()..getProfile()),
        BlocProvider(create: (context) => di.sl<GetAllUsersCubit>()..getAllUsers()),
        BlocProvider(create: (context) => di.sl<GetChatsCubit>()),
        BlocProvider(create: (context) => di.sl<ThemeCubit>()..getTheme())
      ],
      child: BlocBuilder<ThemeCubit, ThemeStates>(
        builder: (context, themeState) {
          return BlocBuilder<GetAllUsersCubit, GetAllUsersStates>(
            builder: (context, state) {
              return MaterialApp.router(
                routerConfig: AppRoutes.router,
                debugShowCheckedModeBanner: false,
                themeMode: themeState.mood,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
              );
            },
          );
        },
      ),
    );
  }
}