import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/loading_widget.dart';
import 'package:socialfy/core/widgets/text_form_field.dart';
import 'package:socialfy/features/post/presentation/cubit/post_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/post_state.dart';

class FinishingPostScreen extends StatefulWidget {
  final dynamic imageFile;

  const FinishingPostScreen({this.imageFile, Key? key}) : super(key: key);

  @override
  State<FinishingPostScreen> createState() => _FinishingPostScreenState();
}

class _FinishingPostScreenState extends State<FinishingPostScreen> {
  @override
  Widget build(BuildContext context) {
    PostCubit cubit = BlocProvider.of<PostCubit>(context);
    return BlocConsumer<PostCubit, PostStates>(
      listener: (context, state) {
        if(state is CreatePostSuccessState)
        {
          Navigator.pushNamedAndRemoveUntil(context, Routes.mainScreenRoute, (route) => false);
          cubit.captionController.clear();
          cubit.files!.clear();
          cubit.imageFile=null;
          cubit.getNewFeed();
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  leading: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_outlined)),
                  title: const Text(AppStrings.newPost),
                  titleTextStyle: Theme.of(context)
                      .appBarTheme
                      .titleTextStyle!
                      .copyWith(fontSize: 20),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        cubit.createPost(
                            caption: cubit.captionController.text,
                            image: widget.imageFile,
                            context: context);
                        FocusScope.of(context).unfocus();
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'done',
                            style: Theme.of(context)
                                .appBarTheme
                                .titleTextStyle!
                                .copyWith(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                body: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                              width: 100,
                              height: 100,
                              child:
                              Image(image: FileImage(File(widget.imageFile)))),
                        ),
                        NoneBorderTextFormField(controller: cubit.captionController, size: 150,hintText: AppStrings.writeCaption),
                      ],
                    ),
                    if(state is CreatePostLoadingState)
                      const LoadingWidget()
                  ],
                ),
              )),
        );
      },
    );
  }
}