import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/widgets/loading_widget.dart';
import 'package:socialfy/features/post/presentation/cubit/create_post_cubit/create_post_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/create_post_cubit/create_post_state.dart';

class DoneButton extends StatelessWidget {
  final File imageFile;
  final dynamic imageHeight;
  final dynamic imageWidth;
  const DoneButton({super.key, required this.imageFile, this.imageHeight, this.imageWidth});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit, CreatePostStates>(
      builder: (context, state) {
        if (state is CreatePostLoadingState) {
          return const Padding(
            padding: EdgeInsets.all(10),
            child: LoadingWidget(size: 30),
          );
        }
        return GestureDetector(
          onTap: () {
            CreatePostCubit.get(context).createPost(
              image: imageFile,
              imageHeight: imageHeight,
              imageWidth: imageWidth
            );
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'done',
                style: AppTextStyles.getNormalText(fontSize: FontSize.s16, color: Theme.of(context).primaryColor),

              ),
            ),
          ),
        );
      },
    );
  }
}