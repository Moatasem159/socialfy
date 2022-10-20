import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/app/injection_container.dart' as di;
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/config/themes/app_theme.dart';
import 'package:socialfy/config/themes/cubit/theme_cubit.dart';
import 'package:socialfy/config/themes/cubit/theme_state.dart';
import 'package:socialfy/features/post/presentation/cubit/post_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_state.dart';

class Socialfy extends StatelessWidget {
  final bool ? isDark;
  final bool ?isThemeSystem;

  const Socialfy({Key? key, this.isDark, this.isThemeSystem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:
    [
      BlocProvider(create: (context) =>
      di.sl<PostCubit>()
        ..getNewFeed(),
      ),
      BlocProvider(create: (context) =>
      di.sl<ProfileCubit>()
        ..getProfile(),),
      BlocProvider(create: (context) =>
      di.sl<ThemeCubit>()
        ..changeThemeMode(fromShared: isDark, system: isThemeSystem),)
    ], child: BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ThemeCubit cubit = BlocProvider.of<ThemeCubit>(context);
        return BlocConsumer<ThemeCubit, ThemeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              onGenerateRoute: RouteGenerator.getRoute,
              debugShowCheckedModeBanner: false,
              themeMode:
              cubit.systemDefault == true ? ThemeMode.system : cubit
                  .isDark == true ? ThemeMode.dark : ThemeMode.light,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
            );
          },
        );
      },
    ));
  }
}
