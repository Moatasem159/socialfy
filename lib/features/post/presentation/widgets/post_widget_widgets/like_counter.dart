import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
class LikeCounter extends StatelessWidget {
  const LikeCounter({super.key,required this.likes});
  final List<String> likes;
  @override
  Widget build(BuildContext context) {
    if (likes.isNotEmpty) {
      return Column(
        children: [
          7.ph,
          GestureDetector(
            onTap: () =>GoRouter.of(context).pushNamed(Routes.postLikesScreenRoute,extra: likes),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:0),
              child: Text(
                  likes.isEmpty?"":likes.length>1?
                  "${likes.length} likes":"${likes.length} like",
                  style: AppTextStyles.getBoldText(fontSize: FontSize.s14, color: Theme.of(context).primaryColor)
              ),
            ),
          ),
        ],
      );
    }
    return const SizedBox();
  }
}