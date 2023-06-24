import 'package:flutter/material.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/presentation/screens/create_post_screen.dart';
class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: Text(AppStrings.userName!),
      titleTextStyle: Theme.of(context)
          .appBarTheme
          .titleTextStyle!
          .copyWith(fontSize: 17),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CreatePostScreen(),
            ));
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.add_box_outlined),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.settingsScreenRoute);
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.menu_outlined),
          ),
        ),
      ],
    );
  }
}
