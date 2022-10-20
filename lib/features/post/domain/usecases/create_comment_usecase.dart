import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/data/models/comment_model.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';

class CreateCommentUseCase{
  PostRepository postRepository;
  CreateCommentUseCase({required this.postRepository});
  Future<Either<Failure,dynamic>>call({required CommentModel commentModel,required String postId,required int commentsCount}){
    return postRepository.createComment(commentModel: commentModel, postId: postId,commentsCount: commentsCount);
  }
}