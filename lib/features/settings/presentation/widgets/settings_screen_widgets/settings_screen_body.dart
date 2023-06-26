import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/features/settings/presentation/widgets/settings_screen_widgets/log_out_button.dart';
import 'package:socialfy/features/settings/presentation/widgets/settings_screen_widgets/settings_tile.dart';

class SettingsScreenBody extends StatelessWidget {
  const SettingsScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsTile(
          onTap: () =>  GoRouter.of(context).pushNamed(Routes.themeSettingsScreenRoute),
          iconData: Icons.brightness_4_rounded,
          title: "Theme",
        ),
        SettingsTile(
          onTap: (){},
          iconData: Icons.manage_accounts,
          title: "Account",
        ),
        const LogoutButton()
      ],
    );
  }
}