import 'dart:io';

import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/features/post/presentation/cubit/get_gallery_cubit/get_gallery_cubit.dart';
import 'package:socialfy/features/post/presentation/screens/finishing_post_screen.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        File? image=GetGalleryCubit.get(context).imageFile;
        dynamic height=GetGalleryCubit.get(context).selectedImage!.height;
        dynamic width=GetGalleryCubit.get(context).selectedImage!.width;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FinishingPostScreen(
              imageFile: image!,
              imageHeight: height,
              imageWidth: width,
            ),
          ),
        );
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Next',
            style: AppTextStyles.getNormalText(
                fontSize: FontSize.s16, color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
