import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/config/themes/cubit/theme_cubit.dart';
import 'package:socialfy/config/themes/cubit/theme_state.dart';

class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeCubit cubit=BlocProvider.of<ThemeCubit>(context);

    return BlocConsumer<ThemeCubit, ThemeStates>(
  listener: (context, state) {},
  builder: (context, state) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "Set theme",
          style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                fontSize: 19,
              ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: [
                 Text("Light",style: Theme.of(context).textTheme.bodyText1,),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    cubit.changeThemeMode(system: false,dark: false);
                  },
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor:cubit.systemDefault==false&&cubit.isDark==false?Colors.blue:Theme.of(context).backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: [
                 Text("dark",style: Theme.of(context).textTheme.bodyText1,),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    cubit.changeThemeMode(system: false,dark: true);
                  },
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: cubit.systemDefault==false&&cubit.isDark==true?Colors.blue:Theme.of(context).backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children:  [
                Text("System default",style: Theme.of(context).textTheme.bodyText1,),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    cubit.changeThemeMode(system: true);
                  },
                  child: CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: cubit.systemDefault==true?Colors.blue:Theme.of(context).backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    ));
  },
);
  }
}
