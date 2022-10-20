import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/data/models/like_model.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';

class AddLikeToPostUseCase{
  PostRepository postRepository;
  AddLikeToPostUseCase({required this.postRepository});
  Future<Either<Failure,void>>call({required String postId,required LikeModel likeData}){
    return postRepository.addLike(postId: postId, likeData: likeData);
  }
}