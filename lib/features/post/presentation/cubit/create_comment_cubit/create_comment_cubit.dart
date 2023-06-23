import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/data/models/comment_model.dart';
import 'package:socialfy/features/post/domain/usecases/create_comment_usecase.dart';
import 'package:socialfy/features/post/presentation/cubit/create_comment_cubit/create_comment_state.dart';

class CreateCommentCubit extends Cubit<CreateCommentStates> {
  CreateCommentCubit(this._createCommentUseCase) : super(CreateCommentInitialState());
  static CreateCommentCubit get(context)=>BlocProvider.of(context);
  final CreateCommentUseCase _createCommentUseCase;
  TextEditingController commentController = TextEditingController();
  Future<void> createComment(
      {required String postId,required int commentsCount}) async {
    if(commentController.text.isNotEmpty){
      String text=commentController.text;
      commentController.clear();
      emit(CreateCommentLoadingState());
      Either<Failure, void> response = await _createCommentUseCase.call(
          commentModel: CommentModel(
            uId: AppStrings.userLoggedInId,
            commentId: '',
            comment: text,
            profilePic: AppStrings.profilePic,
            name: AppStrings.userName,
            dateTime: DateTime.now().toIso8601String(),
            likes: []),
            postId: postId,commentsCount: commentsCount);

      response.fold(
              (failure)=>emit(CreateCommentErrorState()),
              (done)=> emit(CreateCommentSuccessState()));
    }
  }
}
