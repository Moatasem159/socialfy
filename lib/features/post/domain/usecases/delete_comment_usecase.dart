import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/domain/repositories/comment_repository.dart';
class DeleteCommentUseCase{
  final CommentRepository _commentRepository;
  DeleteCommentUseCase(this._commentRepository);
  Future<Either<Failure,dynamic>> call({required String commentId,required String postId,required int commentCount }){
    return _commentRepository.deleteComment(postId: postId, commentId: commentId,commentCount: commentCount);
  }
}