import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/post/presentation/cubit/get_gallery_cubit/get_gallery_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/get_gallery_cubit/get_gallery_state.dart';
import 'package:socialfy/features/post/presentation/widgets/create_post_screen_widgets/gallery_menu_widgets/gallery_delegate.dart';
import 'package:socialfy/features/post/presentation/widgets/create_post_screen_widgets/gallery_menu_widgets/gallery_drop_menu.dart';
class GalleryMenu extends StatelessWidget {
  const GalleryMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGalleryCubit, GetGalleryStates>(
      builder: (context, state) {
        GetGalleryCubit cubit = GetGalleryCubit.get(context);
        return SliverOverlapAbsorber(
          handle: cubit.appbar,
          sliver: SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: GalleryAlbumsDelegate(
              child: cubit.albums != null
                  ? const GalleryDropMenu()
                  : const SizedBox(),
            ),
          ),
        );
      },
    );
  }
}