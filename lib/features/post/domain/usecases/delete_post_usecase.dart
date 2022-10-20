import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';

class DeletePostUseCase{
  PostRepository postRepository;

  DeletePostUseCase({required this.postRepository});


  Future<Either<Failure,dynamic>> call({required postId,required String image }){
    return postRepository.deletePost(postId: postId, postImage: image);
  }


}