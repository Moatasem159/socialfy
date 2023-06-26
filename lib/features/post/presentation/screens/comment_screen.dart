import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/app/injection_container.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/custom_appbar.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/cubit/create_comment_cubit/create_comment_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/get_comments_cubit/get_comments_cubit.dart';
import 'package:socialfy/features/post/presentation/widgets/comments_screen_widgets/comment_text_field.dart';
import 'package:socialfy/features/post/presentation/widgets/comments_screen_widgets/comments_screen_body.dart';
class CommentsScreen extends StatelessWidget {
  final Post post;
  const CommentsScreen({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<GetCommentsCubit>()),
        BlocProvider(create: (context) => sl<CreateCommentCubit>())
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              appBar: const CustomAppBar(title: AppStrings.comments),
              body: CommentsScreenBody(postId: post.postId!),
              bottomSheet: CommentTextField(
                commentCount: post.commentsCount!,
                postId: post.postId!))),
      ),
    );
  }
}