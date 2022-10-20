import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';

class DeleteCommentUseCase{

  PostRepository postRepository;

  DeleteCommentUseCase({required this.postRepository});

  Future<Either<Failure,dynamic>> call({required String commentId,required String postId,required int commentCount }){
    return postRepository.deleteComment(postId: postId, commentId: commentId,commentCount: commentCount);
  }
}