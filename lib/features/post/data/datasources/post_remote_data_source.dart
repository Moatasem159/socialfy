import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialfy/core/firebase/end_points.dart';
import 'package:socialfy/core/firebase/firebase_consumer.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/data/models/comment_model.dart';
import 'package:socialfy/features/post/data/models/like_model.dart';
import 'package:socialfy/features/post/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<dynamic> createPost(
      {required PostModel postModel, required File postImage});

  Future<dynamic> deletePost(
      {required String postId, required String postImage});

  Future<dynamic> deleteComment(
      {required String postId, required String commentId,required int commentCount});

  Future<dynamic> getNewsFeed();

  Future<dynamic> getPostComment({required String postId});

  Future<dynamic> getPostLikes({required String postId});
  Future<dynamic> getCommentsLikes({required String postId,required String commentId});

  Future<dynamic> addLike(
      {required String postId, required LikeModel likeModel});

  Future<dynamic> disLike({required String postId});

  Future<dynamic> createComment({required String postId,
    required int commentsCount,
    required CommentModel commentModel});

  Future<dynamic> addLikeToComment({required String postId,
    required String commentId,
    required LikeModel likeModel});

  Future<dynamic> disLikeComment(
      {required String postId, required String commentId});
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final FireBaseConsumer fireBaseConsumer;

  PostRemoteDataSourceImpl({required this.fireBaseConsumer});

  @override
  Future createPost(
      {required PostModel postModel, required File postImage}) async {
    return await fireBaseConsumer
        .add(collectionName: EndPoints.POSTCOLLECTION, body: postModel.toMap())
        .then((value1) async {
      await fireBaseConsumer
          .uploadImage(
          link:
          "${EndPoints.POSTCOLLECTION}/${Uri
              .file(postImage.path)
              .pathSegments
              .last}",
          image: postImage)
          .then((value2) async {
        final link = await value2.ref.getDownloadURL();
        await fireBaseConsumer.update(
            collectionName: EndPoints.POSTCOLLECTION,
            docName: value1.id,
            body: {
              "postId": value1.id,
              "postImage": link,
            });
      });
    });
  }

  List<QueryDocumentSnapshot<Object?>>? posts;

  @override
  Future<List<QueryDocumentSnapshot<Object?>>> getNewsFeed() async {
    posts = [];
    QuerySnapshot postResponse = await fireBaseConsumer.getCollections(
        collectionName: EndPoints.POSTCOLLECTION, order: 'dateTime');
    for (var element in postResponse.docs) {
      posts!.add(element);
    }
    return posts!;
  }

  List<QueryDocumentSnapshot<Object?>>? postLikes;

  @override
  Future<List<QueryDocumentSnapshot<Object?>>> getPostLikes(
      {required String postId}) async {
    postLikes = [];
    QuerySnapshot likesResponse = await fireBaseConsumer.getCollectionDeep1(
        collectionName1: EndPoints.POSTCOLLECTION,
        docName1: postId,
        collectionName2: EndPoints.LIKECOLLECTION,
        order: 'dateTime');
    for (var element in likesResponse.docs) {
      postLikes!.add(element);
    }
    return postLikes!;
  }

  @override
  Future<dynamic> addLike(
      {required String postId, required LikeModel likeModel}) async {
    await fireBaseConsumer.setDeep1(
        collectionName1: EndPoints.POSTCOLLECTION,
        docName1: postId,
        collectionName2: EndPoints.LIKECOLLECTION,
        docName2: likeModel.uId!,
        body: likeModel.toMap());
  }

  @override
  Future disLike({required String postId}) async {
    return fireBaseConsumer.removeDeep1(
        collectionName1: EndPoints.POSTCOLLECTION,
        docName1: postId,
        collectionName2: EndPoints.LIKECOLLECTION,
        docName2: AppStrings.userLoggedInId!);
  }

  @override
  Future createComment({required String postId,
    required int commentsCount,
    required CommentModel commentModel}) async {
    return fireBaseConsumer
        .addDeep1(
      collectionName1: EndPoints.POSTCOLLECTION,
      docName: postId,
      collectionName2: EndPoints.COMMENTCOLLECTION,
      body: commentModel.toMap(),
    )
        .then((value) async {
      await fireBaseConsumer.updateDeep1(
          collectionName1: EndPoints.POSTCOLLECTION,
          docName1: postId,
          collectionName2: EndPoints.COMMENTCOLLECTION,
          docName2: value.id,
          body: {
            "commentId": value.id,
          });
      await fireBaseConsumer.update(
          collectionName: EndPoints.POSTCOLLECTION,
          docName: postId,
          body: {
            "commentsCount": commentsCount + 1,
          });
    });
  }

  List<QueryDocumentSnapshot<Object?>>? comments;

  @override
  Future<List<QueryDocumentSnapshot<Object?>>> getPostComment(
      {required String postId}) async {
    comments = [];
    QuerySnapshot commentsResponse = await fireBaseConsumer.getCollectionDeep1(
      collectionName1: EndPoints.POSTCOLLECTION,
      docName1: postId,
      collectionName2: EndPoints.COMMENTCOLLECTION,
      order: 'dateTime',
    );
    for (var element in commentsResponse.docs) {
      comments!.add(element);
    }
    return comments!;
  }

  @override
  Future deletePost({required String postId, required String postImage}) async {
    return await fireBaseConsumer
        .delete(collectionName: EndPoints.POSTCOLLECTION, docName: postId)
        .then((value) async {
      await fireBaseConsumer.deleteImage(link: postImage);
    });
  }

  @override
  Future deleteComment(
      {required String postId, required String commentId,required int commentCount}) async {
    return fireBaseConsumer.removeDeep1(
        collectionName1: EndPoints.POSTCOLLECTION,
        docName1: postId,
        collectionName2: EndPoints.COMMENTCOLLECTION,
        docName2: commentId).then((value)async{
          await fireBaseConsumer.update(collectionName: EndPoints.POSTCOLLECTION, docName: postId, body: {
            "commentsCount":commentCount-1
          });
    });
  }

  @override
  Future addLikeToComment({required String postId,
    required String commentId,
    required LikeModel likeModel}) async {
    await fireBaseConsumer.setDeep2(
      collectionName1: EndPoints.POSTCOLLECTION,
      docName1: postId,
      collectionName2: EndPoints.COMMENTCOLLECTION,
      docName2: commentId,
      collectionName3: EndPoints.LIKECOLLECTION,
      docName3: likeModel.uId!,
      body: likeModel.toMap(),
    );
  }

  @override
  Future disLikeComment(
      {required String postId, required String commentId}) async {
    return await fireBaseConsumer.removeDeep2(
        collectionName1: EndPoints.POSTCOLLECTION,
        docName1: postId,
        collectionName2: EndPoints.COMMENTCOLLECTION,
        docName2: commentId,
        collectionName3: EndPoints.LIKECOLLECTION,
        docName3: AppStrings.userLoggedInId!
    );
  }

  List<QueryDocumentSnapshot<Object?>>? commentLikes;
  @override
  Future<List<QueryDocumentSnapshot<Object?>>> getCommentsLikes({required String postId, required String commentId}) async{
    commentLikes=[];
    QuerySnapshot likesResponse = await fireBaseConsumer.getCollectionDeep2(
        collectionName1: EndPoints.POSTCOLLECTION,
        docName1: postId,
        collectionName2: EndPoints.COMMENTCOLLECTION,
        docName2:commentId ,
        collectionName3: EndPoints.LIKECOLLECTION,
        order: 'dateTime');

    for (var element in likesResponse.docs) {
      commentLikes!.add(element);
    }
    return commentLikes!;
  }
}
