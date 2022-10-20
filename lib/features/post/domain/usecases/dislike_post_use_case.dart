import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';

class DisLikePostUseCase{

PostRepository postRepository;

DisLikePostUseCase({required this.postRepository});


Future<Either<Failure,dynamic>> call({required String postId}){
  return postRepository.disLike(postId: postId);
}



}