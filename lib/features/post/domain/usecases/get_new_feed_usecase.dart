import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';

class GetNewsFeedUseCase{
  PostRepository postRepository;
  GetNewsFeedUseCase({required this.postRepository});
  Future<Either<Failure,dynamic>>call(){
    return postRepository.getNewsFeed();
  }
}