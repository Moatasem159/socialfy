import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialfy/features/post/domain/repositories/comment_repository.dart';
class GetPostCommentUseCase{
  final CommentRepository _commentRepository;
  GetPostCommentUseCase(this._commentRepository);
  Stream<QuerySnapshot<Object>>call({required String postId}){
    return _commentRepository.getComments(postId: postId);
  }
}