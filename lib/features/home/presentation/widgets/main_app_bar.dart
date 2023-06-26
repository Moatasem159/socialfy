import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int index;
  const MainAppBar({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(index==4 )
      {
        return AppBar(
          title: Text(AppStrings.userName!),
          automaticallyImplyLeading: false,
          titleTextStyle: AppTextStyles.getBoldText(fontSize: FontSize.s17, color: Theme.of(context).primaryColor),
          actions: [
            GestureDetector(
              onTap: ()=> GoRouter.of(context).pushNamed(Routes.createPostScreenRoute),
              child: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.add_box_outlined),
              ),
            ),
            GestureDetector(
              onTap: () => GoRouter.of(context).pushNamed(Routes.settingsScreenRoute),
              child: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.menu_outlined),
              ),
            ),
          ],
        );
      }
    return AppBar(
      title: const Text(AppStrings.appTitle),
      automaticallyImplyLeading: false,
      titleTextStyle: AppTextStyles.getNormalText(
          fontSize: FontSize.s30, color: Theme.of(context).primaryColor).copyWith(
          fontFamily: FontConstants.billaBong),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.search_outlined),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity, 60);
}