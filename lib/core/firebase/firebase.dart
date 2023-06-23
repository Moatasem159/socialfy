import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:socialfy/core/firebase/firebase_consumer.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireBaseManager extends FireBaseConsumer {
  final FirebaseFirestore _client;
  final FirebaseAuth _auth;
  final FirebaseStorage _storage;
  // final FirebaseMessaging messaging;

  FireBaseManager(this._auth,this._client,this._storage);



  @override
  Future get({required String collectionName, required String docName}) async {
    final response = await _client.collection(collectionName).doc(docName).get();
    return response;
  }

  @override
  Future delete(
      {required String collectionName, required String docName}) async {
    final response =
        await _client.collection(collectionName).doc(docName).delete();
    return response;
  }



  @override
  Future add(
      {required String collectionName,
      required Map<String, dynamic> body}) async {
    final response = await _client.collection(collectionName).add(body);
    return response;
  }

  @override
  Future set(
      {required String collectionName,
      required String docName,
      required Map<String, dynamic> body}) async {
    final response =
        await _client.collection(collectionName).doc(docName).set(body);
    return response;
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future uploadImage({required String link, required File image}) {
    return _storage.ref().child(link).putFile(image);
  }

  @override
  Future setDeep1(
      {required String collectionName1,
      required String docName1,
      required String collectionName2,
      required String docName2,
      required Map<String, dynamic> body}) async {
    return await _client
        .collection(collectionName1)
        .doc(docName1)
        .collection(collectionName2)
        .doc(docName2)
        .set(body);
  }

  @override
  Future update(
      {required String collectionName,
      required String docName,
      required Map<String, dynamic> body}) async {
    return _client.collection(collectionName).doc(docName).update(body);
  }

  @override
  Future<QuerySnapshot> getCollections({required String collectionName}) async {
    return _client.collection(collectionName).get();
  }

  @override
  Future getCollectionDeep1(
      {required String collectionName1,
      required String docName1,
      required String collectionName2,
      required String order}) async {
    return await _client
        .collection(collectionName1)
        .doc(docName1)
        .collection(collectionName2)
        .orderBy(order)
        .get();
  }

  @override
  Future removeDeep1(
      {required String collectionName1,
      required String docName1,
      required String collectionName2,
      required String docName2}) async {
    return await _client
        .collection(collectionName1)
        .doc(docName1)
        .collection(collectionName2)
        .doc(docName2)
        .delete();
  }

  @override
  Future setDeep2(
      {required String collectionName1,
      required String docName1,
      required String collectionName2,
      required String docName2,
      required String collectionName3,
      required String docName3,
      required Map<String, dynamic> body}) async {
    return await _client
        .collection(collectionName1)
        .doc(docName1)
        .collection(collectionName2)
        .doc(docName2)
        .collection(collectionName3)
        .doc(docName3)
        .set(body);
  }

  @override
  Future removeDeep2(
      {required String collectionName1,
      required String docName1,
      required String collectionName2,
      required String docName2,
      required String collectionName3,
      required String docName3}) async {
    return await _client
        .collection(collectionName1)
        .doc(docName1)
        .collection(collectionName2)
        .doc(docName2)
        .collection(collectionName3)
        .doc(docName3)
        .delete();
  }

  @override
  Future addDeep1(
      {required String collectionName1,
      required String collectionName2,
      required String docName,
      required Map<String, dynamic> body}) async {
    return await _client
        .collection(collectionName1)
        .doc(docName)
        .collection(collectionName2)
        .add(body);
  }

  @override
  Future updateDeep1(
      {required String collectionName1,
      required String docName1,
      required String collectionName2,
      required String docName2,
      required Map<String, dynamic> body}) async {
    return await _client
        .collection(collectionName1)
        .doc(docName1)
        .collection(collectionName2)
        .doc(docName2)
        .update(body);
  }

  @override
  Future deleteImage({required String link}) async {
    return _storage.refFromURL(link).delete();
  }

  @override
  Future deleteDoc(
      {required String collectionName, required String docName}) async {
    return _client.runTransaction((transaction) async {
      DocumentReference;
      // transaction.delete(docName)
    });
  }

  @override
  Future getCollectionDeep2(
      {required String collectionName1,
      required String docName1,
      required String collectionName2,
      required String docName2,
      required String collectionName3,
      required String order}) async {
    return await _client
        .collection(collectionName1)
        .doc(docName1)
        .collection(collectionName2)
        .doc(docName2)
        .collection(collectionName3)
        .orderBy(order)
        .get();
  }
  @override
  Stream<QuerySnapshot<Object>> streamListen({required String collectionName}) {
    return _client.collection(collectionName)
        .orderBy('dateTime', descending: true)
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<Object>> streamListenDeep1(
  {required String collectionName, required String docName, required, required String collectionName2}) {
   return _client.collection(collectionName)
       .doc(docName).collection(collectionName2).orderBy('dateTime', descending: true).snapshots();
  }
}