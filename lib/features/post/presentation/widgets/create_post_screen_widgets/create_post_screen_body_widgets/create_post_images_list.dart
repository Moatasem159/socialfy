import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/post/presentation/cubit/get_gallery_cubit/get_gallery_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/get_gallery_cubit/get_gallery_state.dart';
import 'package:socialfy/features/post/presentation/widgets/create_post_screen_widgets/images_list.dart';

class CreatePostImagesList extends StatelessWidget {
  const CreatePostImagesList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGalleryCubit, GetGalleryStates>(
      builder: (context, state) {
        GetGalleryCubit cubit = GetGalleryCubit.get(context);
        if(cubit.albums!=null) {
          return CustomScrollView(
            slivers: [
              SliverOverlapInjector(handle: cubit.appbar),
              ImagesList(images: cubit.selectedAlbum!),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}