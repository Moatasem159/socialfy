import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/features/post/presentation/cubit/like_post_cubit/like_post_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/like_post_cubit/like_post_state.dart';
import 'package:socialfy/features/post/presentation/screens/people_who_liked_screen.dart';
class LikeCounter extends StatelessWidget {
  const LikeCounter({super.key,required this.likes});
  final List<String> likes;
  @override
  Widget build(BuildContext context) {
    if (likes.isNotEmpty) {
      return BlocBuilder<LikePostCubit, LikePostStates>(
  builder: (context, state) {
    return Column(
        children: [
          7.ph,
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PeopleWhoLikedScreen(ids:likes),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:15),
              child: Text(
                  likes.isEmpty?"":likes.length>1?
                  "${likes.length} likes":"${likes.length} like",
                  style: AppTextStyles.getBoldText(fontSize: FontSize.s14, color: Theme.of(context).primaryColor)
              ),
            ),
          ),
        ],
      );
  },
);
    }
    return const SizedBox();
  }
}