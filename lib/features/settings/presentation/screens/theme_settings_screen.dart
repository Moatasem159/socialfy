import 'package:flutter/material.dart';
import 'package:socialfy/core/widgets/custom_appbar.dart';
import 'package:socialfy/features/settings/presentation/widgets/theme_screen_widgets/theme_screen_body.dart';
class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const CustomAppBar(title: "dark theme"),
        body: const ThemeScreenBody(),
      ),
    );
  }
}