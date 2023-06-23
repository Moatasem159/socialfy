import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/app/injection_container.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/presentation/cubit/create_post_cubit/create_post_cubit.dart';
import 'package:socialfy/features/post/presentation/widgets/create_post_appbar.dart';
import 'package:socialfy/features/post/presentation/widgets/finish_post_screen_widgets/done_button.dart';
import 'package:socialfy/features/post/presentation/widgets/finish_post_screen_widgets/finish_post_screen_body.dart';
class FinishingPostScreen extends StatelessWidget {
  final File imageFile;
  final dynamic imageHeight;
  final dynamic imageWidth;
  const FinishingPostScreen({required this.imageFile, Key? key, this.imageHeight, this.imageWidth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CreatePostCubit>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar:  CreatePostAppBar(
              actions: [
                DoneButton(imageFile: imageFile,imageHeight: imageHeight,imageWidth: imageWidth),
              ],
              title: AppStrings.newPost,
              leading: Icons.arrow_back_outlined,
            ),
            body: FinishPostScreenBody(imageFile: imageFile,imageHeight: imageHeight,imageWidth: imageWidth),
          ),
        ),
      ),
    );
  }
}