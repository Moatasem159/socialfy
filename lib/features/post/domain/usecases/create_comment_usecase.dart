import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/data/models/comment_model.dart';
import 'package:socialfy/features/post/domain/repositories/comment_repository.dart';
class CreateCommentUseCase{
  final CommentRepository _commentRepository;
  CreateCommentUseCase(this._commentRepository);
  Future<Either<Failure,dynamic>>call({required CommentModel commentModel,required String postId,required int commentsCount}){
    return _commentRepository.createComment(commentModel: commentModel, postId: postId,commentsCount: commentsCount);
  }
}