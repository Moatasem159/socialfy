import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/data/models/post_model.dart';
import 'package:socialfy/features/post/domain/usecases/create_post_usecase.dart';
import 'package:socialfy/features/post/presentation/cubit/create_post_cubit/create_post_state.dart';
class CreatePostCubit extends Cubit<CreatePostStates> {
  CreatePostCubit(this._createPostUseCase) : super(CreatePostInitialState());
  final CreatePostUseCase _createPostUseCase;
  static CreatePostCubit get(context)=>BlocProvider.of(context);
  TextEditingController captionController = TextEditingController();
  Future<void> createPost({required File image,required imageHeight,required imageWidth}) async {
    emit(CreatePostLoadingState());
    Either<Failure, void> response =
    await _createPostUseCase.call(postModel: PostModel(
      username: AppStrings.userName,
      uId: AppStrings.userLoggedInId,
      postId: "",
      commentsCount: 0,
      profilePic: AppStrings.profilePic,
      dateTime: DateTime.now().toIso8601String(),
      postText: captionController.text,
      postImageHeight: imageHeight,
      postImageWidth: imageWidth,
      likes: [],
    ), postImage: image);
    response.fold((failure) {
      emit(CreatePostErrorState());
    }, (done) {
      captionController.clear();
      emit(CreatePostSuccessState());
    });
  }
}
