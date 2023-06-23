import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/post/presentation/cubit/get_gallery_cubit/get_gallery_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/get_gallery_cubit/get_gallery_state.dart';
class GalleryDropMenu extends StatelessWidget {
  const GalleryDropMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGalleryCubit, GetGalleryStates>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                items: GetGalleryCubit.get(context)
                    .albums!
                    .map((album) => DropdownMenuItem(
                  value: album,
                  child: Text(
                    album.name!,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),).toList(),
                onChanged: (value) {
                  GetGalleryCubit.get(context).changeFolder(value);
                },
                value: GetGalleryCubit.get(context).selectedModel,
              ),
            ),
          ),
        );
      },
    );
  }
}