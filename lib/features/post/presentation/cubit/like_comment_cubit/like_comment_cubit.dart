import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/domain/usecases/like_comment_usecase.dart';
import 'package:socialfy/features/post/presentation/cubit/like_comment_cubit/like_comment_state.dart';
class LikeCommentCubit extends Cubit<LikeCommentStates> {
  LikeCommentCubit(this._likeCommentUseCase) : super(LikeCommentInitialState());
  final LikeCommentUseCase _likeCommentUseCase;
  static LikeCommentCubit get(context)=>BlocProvider.of(context);

  Future<void> likeComment({
    required String postId,
    required String commentId,
    required bool isLike,
    required List<String>likes})async{
    if(isLike)
    {

      likes.remove(AppStrings.userLoggedInId!);
    }
    else {

      likes.add(AppStrings.userLoggedInId!);
    }
    emit(LikeCommentLoadingState());
    Either<Failure, dynamic> response =
    await _likeCommentUseCase.call(postId: postId,likes:likes,commentId: commentId);
    response.fold(
    (failure)=>emit(LikeCommentErrorState()),
    (done) => emit(LikeCommentSuccessState()));
  }
}
