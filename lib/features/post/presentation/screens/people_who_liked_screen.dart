import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/custom_appbar.dart';
import 'package:socialfy/features/post/presentation/cubit/get_post_likes_cubit/get_post_likes_cubit.dart';
import 'package:socialfy/features/post/presentation/widgets/post_likes_screen_widgets/post_likes_screen_body.dart';
class PeopleWhoLikedScreen extends StatelessWidget {
  final List<String> ids;
  const PeopleWhoLikedScreen({Key? key, required this.ids}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPostLikesCubit()..getPostLikes(ids),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: const CustomAppBar(title: AppStrings.peopleWhoLiked),
          body: const PostLikesScreenBody(),
        ),
      ),
    );
  }
}