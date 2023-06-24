import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/domain/usecases/delete_comment_usecase.dart';
import 'package:socialfy/features/post/presentation/cubit/delete_comment_cubit/delete_comment_state.dart';
class DeleteCommentCubit extends Cubit<DeleteCommentStates> {
  DeleteCommentCubit(this._deleteCommentUseCase) : super(DeleteCommentInitialState());
  final DeleteCommentUseCase _deleteCommentUseCase;
  Future<void> deleteComment(
      {required postId,
      required String commentId,
      required commentCount}) async {
    emit(DeleteCommentLoadingState());
    Either<Failure, void> response = await _deleteCommentUseCase.call(
        postId: postId, commentId: commentId, commentCount: commentCount);
    response.fold((failure) => emit(DeleteCommentErrorState()),
        (done) => emit(DeleteCommentSuccessState()));
  }
}
