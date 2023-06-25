import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/network/network_info.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/data/datasources/remote/post_remote_data_source.dart';
import 'package:socialfy/features/post/data/models/post_model.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';
class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource _postRemoteDataSource;
  final NetworkInfo _networkInfo;
  PostRepositoryImpl(this._postRemoteDataSource,this._networkInfo);
  @override
  Future<Either<Failure, dynamic>> createPost(
      {required PostModel postModel, required File postImage}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _postRemoteDataSource.createPost(
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
  Stream<QuerySnapshot<Object>> getPosts() async*{
    if (await _networkInfo.isConnected) {
      try {
        yield* _postRemoteDataSource.getPosts();
      } on FirebaseException catch (error) {
        yield* Stream.error(GetNewsFeedFailures(message: error.message));
      }
    } else {
      yield* Stream.error(const ServerFailure(message: AppStrings.serverError));
    }
  }
  @override
  Future<Either<Failure, dynamic>> likes({required String postId,required List<String> likes}) async {
    if (await _networkInfo.isConnected) {
      try {
        return right(await _postRemoteDataSource.likePost(
            postId: postId, likes: likes));
      } on FirebaseException catch (error) {
        return left(AddLikeFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }
  @override
  Future<Either<Failure, dynamic>> deletePost(
      {required String postId, required String postImage}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _postRemoteDataSource.deletePost(
            postId: postId, postImage: postImage);
        return right(response);
      } on FirebaseException catch (error) {
        return left(DeletePostFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }
}