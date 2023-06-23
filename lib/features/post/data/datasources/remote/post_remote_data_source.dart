import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialfy/core/firebase/end_points.dart';
import 'package:socialfy/core/firebase/firebase_consumer.dart';
import 'package:socialfy/features/post/data/models/post_model.dart';
abstract class PostRemoteDataSource {
  Future<dynamic> createPost({required PostModel postModel, required File postImage});
  Future<dynamic> deletePost({required String postId, required String postImage});
  Stream<QuerySnapshot<Object>> getPosts();
  Future<dynamic> likePost({required String postId, required List<String> likes});
  Future<List<QueryDocumentSnapshot<Object?>>> getPostLikes();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final FireBaseConsumer _fireBaseConsumer;
  PostRemoteDataSourceImpl(this._fireBaseConsumer);
  @override
  Future createPost({required PostModel postModel, required File postImage}) async {
    await _fireBaseConsumer
        .uploadImage(
            link:
            "${EndPoints.postCollection}/${Uri.file(postImage.path).pathSegments.last}",
            image: postImage).then((url) async {
        final link = await url.ref.getDownloadURL();
        postModel.postImage = link;
        await _fireBaseConsumer.add(collectionName: EndPoints.postCollection, body: postModel.toMap());
      },
    );
  }
  @override
  Stream<QuerySnapshot<Object>> getPosts() =>
      _fireBaseConsumer.streamListen(collectionName: EndPoints.postCollection);
  @override
  Future<dynamic> likePost(
      {required String postId, required List<String> likes}) async {
    await _fireBaseConsumer.update(
        collectionName: EndPoints.postCollection,
        docName: postId,
        body: {"likes": likes});
  }

  @override
  Future deletePost({required String postId, required String postImage}) async {
    return await _fireBaseConsumer
        .delete(collectionName: EndPoints.postCollection, docName: postId)
        .then((value) async {
      await _fireBaseConsumer.deleteImage(link: postImage);
    });
  }

  @override
  Future<List<QueryDocumentSnapshot<Object?>>> getPostLikes() async{
    List<QueryDocumentSnapshot<Object?>> users=[];
    QuerySnapshot response= await _fireBaseConsumer.getCollections(collectionName: EndPoints.userCollection);
    users.addAll(response.docs);
    return users;
  }


}