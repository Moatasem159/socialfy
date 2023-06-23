import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';
class GetPostsUseCase{
  final PostRepository _postRepository;
  GetPostsUseCase(this._postRepository);
  Stream<QuerySnapshot<Object>>call()=>_postRepository.getPosts();
}