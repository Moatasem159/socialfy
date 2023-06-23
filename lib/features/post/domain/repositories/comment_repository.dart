import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/data/models/comment_model.dart';
abstract class CommentRepository {
  Future<Either<Failure, dynamic>> createComment({
    required CommentModel commentModel,
    required String postId,
    required int commentsCount,
  });
  Stream<QuerySnapshot<Object>> getComments({required String postId});
  Future<Either<Failure, dynamic>> deleteComment(
      {required String postId, required String commentId,required int commentCount});
  Future<Either<Failure, dynamic>> likeComment(
      {required String postId,
        required List<String> likes,
        required String commentId});
}