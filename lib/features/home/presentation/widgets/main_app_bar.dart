import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(AppStrings.appTitle),
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
          fontFamily: FontConstants.billaBong,
          fontSize: 35
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.search_outlined),
        ),
      ],
    );
  }
}
