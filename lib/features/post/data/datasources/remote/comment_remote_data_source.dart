import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialfy/core/firebase/end_points.dart';
import 'package:socialfy/core/firebase/firebase_consumer.dart';
import 'package:socialfy/features/post/data/models/comment_model.dart';
abstract class CommentRemoteDataSource {
  Future<dynamic> createComment({required String postId,required int commentsCount,
        required CommentModel commentModel});
  Stream<QuerySnapshot<Object>> getComments({required String postId});
  Future<dynamic> getCommentsLikes({required String postId, required String commentId});
  Future<dynamic> deleteComment(
      {required String postId,
        required String commentId,
        required int commentCount});
  Future<dynamic> likeComment({required String postId,required String commentId,required List<String> likes});
}

class CommentRemoteDataSourceImpl implements CommentRemoteDataSource {
  final FireBaseConsumer _fireBaseConsumer;
  CommentRemoteDataSourceImpl(this._fireBaseConsumer);
  @override
  Future createComment(
      {required String postId,
        required int commentsCount,
        required CommentModel commentModel}) async {
    return _fireBaseConsumer
        .addDeep1(
      collectionName1: EndPoints.postCollection,
      docName: postId,
      collectionName2: EndPoints.commentCollection,
      body: commentModel.toMap(),
    ).then((value) async {
      await _fireBaseConsumer.update(
          collectionName: EndPoints.postCollection,
          docName: postId,
          body: {
            "commentsCount": commentsCount + 1,
          });
    });
  }
  @override
  Future deleteComment(
      {required String postId,
        required String commentId,
        required int commentCount}) async {
    return _fireBaseConsumer
        .removeDeep1(
        collectionName1: EndPoints.postCollection,
        docName1: postId,
        collectionName2: EndPoints.commentCollection,
        docName2: commentId)
        .then((value) async {
      await _fireBaseConsumer.update(
          collectionName: EndPoints.postCollection,
          docName: postId,
          body: {"commentsCount": commentCount - 1});
    });
  }


  @override
  Future<dynamic> likeComment(
      {required String postId, required String commentId,required List<String> likes}) async {
    await _fireBaseConsumer.updateDeep1(
        collectionName1: EndPoints.postCollection,
        docName1: postId,
        collectionName2: EndPoints.commentCollection,
        docName2: commentId,
        body: {"likes": likes});
  }

  @override
  Future<List<QueryDocumentSnapshot<Object?>>> getCommentsLikes(
      {required String postId, required String commentId}) async {
    List<QueryDocumentSnapshot<Object?>> commentLikes=[];
    QuerySnapshot likesResponse = await _fireBaseConsumer.getCollectionDeep2(
        collectionName1: EndPoints.postCollection,
        docName1: postId,
        collectionName2: EndPoints.commentCollection,
        docName2: commentId,
        collectionName3: EndPoints.likeCollection,
        order: 'dateTime');

    for (var element in likesResponse.docs) {
      commentLikes.add(element);
    }
    return commentLikes;
  }
  @override
  Stream<QuerySnapshot<Object>> getComments({required String postId}) {
    return _fireBaseConsumer.streamListenDeep1(
        collectionName: EndPoints.postCollection, docName: postId, collectionName2: EndPoints.commentCollection);
  }
}