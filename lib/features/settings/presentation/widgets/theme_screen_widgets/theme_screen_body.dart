import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/features/settings/presentation/cubit/theme_cubit/theme_cubit.dart';
import 'package:socialfy/features/settings/presentation/cubit/theme_cubit/theme_state.dart';
import 'package:socialfy/features/settings/presentation/widgets/theme_screen_widgets/theme_tile.dart';
class ThemeScreenBody extends StatelessWidget {
  const ThemeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeStates>(
  builder: (context, state) {
    return Column(
      children: [
        5.ph,
        ThemeTile(
          onTap: () => ThemeCubit.get(context).lightTheme(),
          title: "Light",
          bColor: state.mood == ThemeMode.light
              ? Colors.blue
              : Theme.of(context).primaryColorLight,
        ),
        ThemeTile(
          onTap: () =>  ThemeCubit.get(context).darkTheme(),
          title: "dark",
          bColor: state.mood == ThemeMode.dark
              ? Colors.blue
              : Theme.of(context).primaryColorLight,
        ),
        ThemeTile(
          onTap: () =>  ThemeCubit.get(context).systemTheme(),
          title: "System default",
          bColor: state.mood == ThemeMode.system
              ? Colors.blue
              : Theme.of(context).primaryColorLight,
        ),
      ],
    );
  },
);
  }
}