import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/network/network_info.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/data/datasources/post_local_data_source.dart';
import 'package:socialfy/features/post/data/datasources/post_remote_data_source.dart';
import 'package:socialfy/features/post/data/models/comment_model.dart';
import 'package:socialfy/features/post/data/models/image_model.dart';
import 'package:socialfy/features/post/data/models/like_model.dart';
import 'package:socialfy/features/post/data/models/post_model.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource postRemoteDataSource;
  final PostLocalDataSource postLocalDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl(
      {required this.postLocalDataSource,
      required this.postRemoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, dynamic>> createPost(
      {required PostModel postModel, required File postImage}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await postRemoteDataSource.createPost(
            postModel: postModel, postImage: postImage);
        return right(response);
      } on FirebaseException catch (error) {
        return left(CreatePostFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }

  @override
  Future<List<FileModel>> getImageFromGallery() async {
    final response = await postLocalDataSource.getImagesFromGallery();
    return response;
  }

  @override
  Future<Either<Failure, dynamic>> getNewsFeed() async {
    if (await networkInfo.isConnected) {
      List<PostModel> posts = [];
      try {
        final postResponse = await postRemoteDataSource.getNewsFeed();
        for (var element in postResponse) {
          posts.add(PostModel.fromJson(element.data()!));
        }
        for (var post in posts) {
          post.likes = [];
          final likeResponse =
              await postRemoteDataSource.getPostLikes(postId: post.postId!);
          for (var element in likeResponse) {
            post.likes!.add(LikeModel.fromJson(element.data()!));
          }
        }
        return right(posts);
      } on FirebaseException catch (error) {
        return left(GetNewsFeedFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }

  @override
  Future<Either<Failure, dynamic>> addLike(
      {required String postId, required LikeModel likeData}) async {
    if (await networkInfo.isConnected) {
      try {
        return right(await postRemoteDataSource.addLike(
            postId: postId, likeModel: likeData));
      } on FirebaseException catch (error) {
        return left(AddLikeFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }

  @override
  Future<Either<Failure, dynamic>> disLike({required String postId}) async {
    if (await networkInfo.isConnected) {
      try {
        return right(await postRemoteDataSource.disLike(postId: postId));
      } on FirebaseException catch (error) {
        return left(DisLikeFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }

  @override
  Future<Either<Failure, dynamic>> createComment({
    required CommentModel commentModel,
    required String postId,
    required int commentsCount,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await postRemoteDataSource.createComment(
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
  Future<Either<Failure, dynamic>> getPostComments(
      {required String postId}) async {
    if (await networkInfo.isConnected) {
      List<CommentModel> comments = [];
      try {
        final commentResponse =
            await postRemoteDataSource.getPostComment(postId: postId);
        for (var element in commentResponse) {
          comments.add(CommentModel.fromJson(element.data()!));
        }
        for (var comment in comments) {
          comment.likes = [];
          final likeResponse =
          await postRemoteDataSource.getCommentsLikes(postId:postId,commentId: comment.commentID!);
          for (var element in likeResponse) {
            comment.likes!.add(LikeModel.fromJson(element.data()!));
          }
        }
        return right(comments);
      } on FirebaseException catch (error) {
        return left(GetPostCommentFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deletePost(
      {required String postId, required String postImage}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await postRemoteDataSource.deletePost(
            postId: postId, postImage: postImage);
        return right(response);
      } on FirebaseException catch (error) {
        return left(DeletePostFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteComment(
      {required String postId, required String commentId,required int commentCount}) async {
    if (await networkInfo.isConnected) {
      try {
        return right(await postRemoteDataSource.deleteComment(
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
  Future<Either<Failure, dynamic>> addLikeToComment(
      {required String postId,
      required LikeModel likeData,
      required String commentId}) async{
    if (await networkInfo.isConnected) {
      try {
        return right(await postRemoteDataSource.addLikeToComment(
            commentId:commentId,
            postId: postId, likeModel: likeData));
      } on FirebaseException catch (error) {
        return left(AddLikeToCommentFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }

  @override
  Future<Either<Failure, dynamic>> disLikeComment({required String postId, required commentId}) async{
    if (await networkInfo.isConnected) {
      try {
        return right(await postRemoteDataSource.disLikeComment(postId: postId,commentId:commentId ));
      } on FirebaseException catch (error) {
        return left(DisCommentLikeFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }
}
