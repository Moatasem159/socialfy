import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';
class GetPostLikesUseCase{
  final PostRepository _postRepository;
  GetPostLikesUseCase(this._postRepository);
  Future<Either<Failure, dynamic>> call({required List<String> ids}) async {
    return _postRepository.getPostLikes(ids: ids);
  }
}