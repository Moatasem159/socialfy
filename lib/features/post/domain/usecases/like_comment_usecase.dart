import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/domain/repositories/comment_repository.dart';
class LikeCommentUseCase {
  final CommentRepository _commentRepository;
  LikeCommentUseCase(this._commentRepository);
  Future<Either<Failure, void>> call(
      {required String postId,
        required List<String> likes,
      required String commentId}){
    return _commentRepository.likeComment(postId: postId, likes:likes,commentId:commentId);
  }
}