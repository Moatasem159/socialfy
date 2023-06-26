import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/extensions/screen_size_extension.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/text_form_field.dart';
import 'package:socialfy/features/post/presentation/cubit/create_post_cubit/create_post_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/create_post_cubit/create_post_state.dart';
class FinishPostScreenBody extends StatelessWidget {
  final File imageFile;
  final dynamic imageHeight;
  final dynamic imageWidth;
  const FinishPostScreenBody({super.key, required this.imageFile, this.imageHeight, this.imageWidth});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePostCubit, CreatePostStates>(
      listener: (context, state) {
       if(state is CreatePostSuccessState)
         {
           GoRouter.of(context).pushReplacementNamed(Routes.mainScreenRoute);
         }
      },
      builder: (context, state) {
        CreatePostCubit cubit = CreatePostCubit.get(context);
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AspectRatio(
                  aspectRatio:(imageWidth/imageHeight)<0.9?0.9: (imageWidth/imageHeight),
                  child: Image(fit: BoxFit.cover, image: FileImage(imageFile))),
              NoneBorderTextFormField(
                  controller: cubit.captionController,
                  size: context.getWidth(w: 1.05),
                  hintText: AppStrings.writeCaption),
            ],
          ),
        );
      },
    );
  }
}