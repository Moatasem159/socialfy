import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
class PostCaption extends StatelessWidget {
  final Post post;
  const PostCaption({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    if (post.postText != '') {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal:10),
        child: RichText(
          maxLines: null,
          text:TextSpan(
            text: post.username!,
            style:AppTextStyles.getBoldText(fontSize: FontSize.s14, color: Theme.of(context).primaryColor),
            children: [
              TextSpan(
                  text:" ${post.postText!}",
                  style: AppTextStyles.getNormalText(fontSize: FontSize.s14, color: Theme.of(context).primaryColor)
              )
            ],
          ),
        ),
      );
    }
    return const SizedBox();
  }
}