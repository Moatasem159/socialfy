import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';
class LikePostUseCase{
  PostRepository postRepository;
  LikePostUseCase({required this.postRepository});
  Future<Either<Failure,void>>call({required String postId,required List<String> likes}){
    return postRepository.likes(postId: postId,likes: likes);
  }
}