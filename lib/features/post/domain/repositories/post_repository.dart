import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/data/models/comment_model.dart';
import 'package:socialfy/features/post/data/models/image_model.dart';
import 'package:socialfy/features/post/data/models/like_model.dart';
import 'package:socialfy/features/post/data/models/post_model.dart';

abstract class PostRepository {
  Future<Either<Failure, dynamic>> createPost(
      {required PostModel postModel, required File postImage});

  Future<Either<Failure, dynamic>> deletePost(
      {required String postId, required String postImage});

  Future<Either<Failure, dynamic>> createComment({
    required CommentModel commentModel,
    required String postId,
    required int commentsCount,
  });

  Future<Either<Failure, dynamic>> getNewsFeed();

  Future<Either<Failure, dynamic>> getPostComments({required String postId});

  Future<Either<Failure, dynamic>> addLike(
      {required String postId, required LikeModel likeData});

  Future<Either<Failure, dynamic>> disLike({required String postId});

  Future<List<FileModel>> getImageFromGallery();

  Future<Either<Failure, dynamic>> deleteComment(
      {required String postId, required String commentId,required int commentCount});

  Future<Either<Failure, dynamic>> addLikeToComment(
      {required String postId,
      required LikeModel likeData,
      required String commentId});

  Future<Either<Failure, dynamic>> disLikeComment({required String postId, required commentId});
}
