import 'package:flutter/material.dart';
import 'package:socialfy/core/entities/user.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/features/profile/presentation/cubit/user_posts_cubit/user_posts_cubit.dart';
import 'package:socialfy/features/profile/presentation/widgets/profile_details_widgets/profile_image_widget.dart';
import 'package:socialfy/features/profile/presentation/widgets/profile_details_widgets/profile_info.dart';
class ProfileDetailsWidget extends StatelessWidget {
  final User user;
  const ProfileDetailsWidget({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ProfileImageWidget(image: user.profilePic!),
                ProfileInfo(title:'posts',count: UserPostsCubit.get(context).userPosts.length),
                const ProfileInfo(title:'followers',count: 0),
                const ProfileInfo(title:'following',count: 0),
              ],
            ),
            5.ph,
            Text(user.name!,style: AppTextStyles.getNormalText(fontSize: FontSize.s16, color: Theme.of(context).primaryColor),),
          ],
        ),
      ),
    );
  }
}