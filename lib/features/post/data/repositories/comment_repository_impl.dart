import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/network/network_info.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/data/datasources/remote/comment_remote_data_source.dart';
import 'package:socialfy/features/post/data/models/comment_model.dart';
import 'package:socialfy/features/post/domain/repositories/comment_repository.dart';
class CommentRepositoryImpl implements CommentRepository {
  final CommentRemoteDataSource _commentRemoteDataSource;
  final NetworkInfo _networkInfo;
  CommentRepositoryImpl(this._commentRemoteDataSource,this._networkInfo);
  @override
  Future<Either<Failure, dynamic>> createComment({
    required CommentModel commentModel,
    required String postId,
    required int commentsCount,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _commentRemoteDataSource.createComment(
            commentModel: commentModel,
            postId: postId,
            commentsCount: commentsCount);
        return right(response);
      } on FirebaseException catch (error) {
        return left(CreateCommentFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteComment(
      {required String postId, required String commentId,required int commentCount}) async {
    if (await _networkInfo.isConnected) {
      try {
        return right(await _commentRemoteDataSource.deleteComment(
            postId: postId, commentId: commentId,
            commentCount: commentCount
        ));
      } on FirebaseException catch (error) {
        return left(DeleteCommentFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }

  @override
  Future<Either<Failure, dynamic>> likeComment(
      {required String postId,
        required List<String> likes,
        required String commentId}) async{
    if (await _networkInfo.isConnected) {
      try {
        return right(await _commentRemoteDataSource.likeComment(
            commentId:commentId,
            postId: postId,likes: likes));
      } on FirebaseException catch (error) {
        return left(AddLikeToCommentFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }
  @override
  Stream<QuerySnapshot<Object>> getComments({required String postId}) async*{
    if (await _networkInfo.isConnected) {
      try {
        yield* _commentRemoteDataSource.getComments(postId: postId);
      } on FirebaseException catch (error) {
        yield* Stream.error(GetNewsFeedFailures(message: error.message));
      }
    } else {
      yield* Stream.error(const ServerFailure(message: AppStrings.serverError));
    }
  }
}