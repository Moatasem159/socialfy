import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:socialfy/core/extensions/screen_size_extension.dart';
import 'package:socialfy/features/post/presentation/cubit/get_gallery_cubit/get_gallery_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/get_gallery_cubit/get_gallery_state.dart';
class CreatePostMainImage extends StatelessWidget {
  const CreatePostMainImage({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGalleryCubit, GetGalleryStates>(
      builder: (context, state) {
        GetGalleryCubit cubit = GetGalleryCubit.get(context);
        return SliverAppBar(
          collapsedHeight:context.getHeight(h:2.4),
          expandedHeight:context.getHeight(h:2.4),
          automaticallyImplyLeading: false,
          flexibleSpace: cubit.selectedImage != null
              ? Center(child: Image(
            fit: BoxFit.cover,
            image: PhotoProvider(mediumId: cubit.selectedImage!.id),))
              : const SizedBox(),
        );
      },
    );
  }
}