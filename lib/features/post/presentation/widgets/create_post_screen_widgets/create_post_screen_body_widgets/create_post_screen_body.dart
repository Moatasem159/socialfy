import 'package:flutter/material.dart';
import 'package:socialfy/features/post/presentation/cubit/get_gallery_cubit/get_gallery_cubit.dart';
import 'package:socialfy/features/post/presentation/widgets/create_post_screen_widgets/create_post_screen_body_widgets/create_post_images_list.dart';
import 'package:socialfy/features/post/presentation/widgets/create_post_screen_widgets/create_post_screen_body_widgets/create_post_main_image.dart';
import 'package:socialfy/features/post/presentation/widgets/create_post_screen_widgets/gallery_menu_widgets/gallery_menu.dart';
class CreatePostScreenBody extends StatelessWidget {
  const CreatePostScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: GetGalleryCubit.get(context).single,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          const CreatePostMainImage(),
          const GalleryMenu()
        ];
      },
      body: const CreatePostImagesList(),
    );
  }
}