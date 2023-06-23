import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/domain/usecases/delete_comment_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/delete_post_usecase.dart';
import 'package:socialfy/features/post/presentation/cubit/post_state.dart';
class PostCubit extends Cubit<PostStates> {
  PostCubit({
    required this.deletePostUseCase,
    required this.deleteCommentUseCase,}) : super(PostInitialState());

  DeletePostUseCase deletePostUseCase;
  DeleteCommentUseCase deleteCommentUseCase;

  static PostCubit get(context)=>BlocProvider.of(context);
  Future<void>deletePost({required postId,required String postImage})async {
    emit(DeletePostLoadingState());
    Either<Failure, void> response =await deletePostUseCase.call(postId: postId, image: postImage);
    response.fold((failure){
      emit(DeletePostErrorState());
    }, (done){
      emit(DeletePostSuccessState());
    });

  }






  Future<void>deleteComment({required postId,required String commentId,required commentCount})async {
    emit(DeleteCommentLoadingState());
    Either<Failure, void> response =await deleteCommentUseCase.call(postId: postId, commentId: commentId,commentCount:commentCount );

    response.fold((failure){
      emit(DeleteCommentErrorState());
    }, (done){
      // for (var element in comments!) {
      //   if(element.commentID==commentId)
      //     {
      //       comments!.remove(element);
      //     }
      // }
    });
    emit(DeleteCommentSuccessState());
  }



}
