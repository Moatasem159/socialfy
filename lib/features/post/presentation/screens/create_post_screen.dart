import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/app/injection_container.dart';
import 'package:socialfy/features/post/presentation/cubit/get_gallery_cubit/get_gallery_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/get_gallery_cubit/get_gallery_state.dart';
import 'package:socialfy/features/post/presentation/widgets/create_post_appbar.dart';
import 'package:socialfy/features/post/presentation/widgets/create_post_screen_widgets/create_post_screen_body_widgets/create_post_screen_body.dart';
import 'package:socialfy/features/post/presentation/widgets/create_post_screen_widgets/next_button.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<GetGalleryCubit>()..getGallery(),
        child: BlocListener<GetGalleryCubit, GetGalleryStates>(
          listener: (context, state) {
            if(state is GetImagesErrorState)
              {
                Navigator.pop(context);
              }
          },
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              appBar: const CreatePostAppBar(
                leading: Icons.clear_outlined,
                title: "New post",
                actions: [NextButton()],
              ),
              body: const CreatePostScreenBody(),
            ),
          ),
        ));
  }
}
