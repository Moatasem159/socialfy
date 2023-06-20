import 'package:flutter/material.dart';
import 'package:socialfy/core/widgets/custom_appbar.dart';
import 'package:socialfy/features/settings/presentation/widgets/settings_screen_widgets/settings_screen_body.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar:const CustomAppBar(title: "Settings"),
        body: const SettingsScreenBody(),
      ),
    );
  }
}