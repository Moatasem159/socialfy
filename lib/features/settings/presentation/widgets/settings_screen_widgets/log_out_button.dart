import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/widgets/buttons.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_state.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileStates>(
      listener: (context, state) {
        if(state is LogoutDoneState) {
          Navigator.pushNamedAndRemoveUntil(context, Routes.welcomeScreenRoute, (route) => false);
        }
      },
      child: MainButton(
          onPressed: () =>ProfileCubit.get(context).logOut(),
          width: 50,
          height: 50,
          color: Theme.of(context).primaryColor,
          child: Text(
              "logout",
              style: AppTextStyles.getNormalText(fontSize: FontSize.s14, color: Theme.of(context).primaryColorLight)
          )),
    );
  }
}