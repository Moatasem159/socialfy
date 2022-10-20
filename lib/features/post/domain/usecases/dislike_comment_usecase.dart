import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';

class DisLikeCommentUseCase{



  PostRepository postRepository;

  DisLikeCommentUseCase({required this.postRepository});

  Future<Either<Failure,dynamic>> call({required String postId,required commentId}){
    return postRepository.disLikeComment(postId: postId,commentId:commentId);
  }
}