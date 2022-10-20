import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/widgets/buttons.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "Settings",
          style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                fontSize: 19,
              ),
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.themeSettingsScreenRoute);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                children: [
                  const Icon(
                    Icons.brightness_4_outlined,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Theme",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                children: [
                  const Icon(
                    Icons.manage_accounts_outlined,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Account",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<ProfileCubit, ProfileStates>(
            builder: (context, state) {
              return MainButton(
                  onPressed: () {
                    BlocProvider.of<ProfileCubit>(context).logOut(context);
                  },
                  width: 50,
                  height: 50,
                  child: Text(
                    "logout",
                    style: Theme.of(context).textTheme.button,
                  ));
            },
          )
        ],
      ),
    ));
  }
}
