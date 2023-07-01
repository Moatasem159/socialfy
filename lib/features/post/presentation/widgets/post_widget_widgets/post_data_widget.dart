import 'package:flutter/material.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/values_manager.dart';
import 'package:socialfy/core/widgets/profile_picture_widget.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
class PostDataWidget extends StatelessWidget {
  final Post post;
  const PostDataWidget({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          ProfilePicWidget(image: post.profilePic!),
          5.pw,
          Text(
            post.username!,
            style: AppTextStyles.getNormalText(fontSize: FontSize.s14, color: Theme.of(context).primaryColor)
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.more_vert_sharp,size:AppSize.s20,),
          )
        ],
      ),
    );
  }
}