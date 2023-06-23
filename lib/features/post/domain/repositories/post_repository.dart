import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/data/models/post_model.dart';
abstract class PostRepository {
  Future<Either<Failure, dynamic>> createPost(
      {required PostModel postModel, required File postImage});
  Future<Either<Failure, dynamic>> deletePost(
      {required String postId, required String postImage});
  Stream<QuerySnapshot<Object>> getPosts();
  Future<Either<Failure, dynamic>> getPostLikes({required List<String> ids});
  Future<Either<Failure, dynamic>> likes({required String postId,required List<String> likes});
}