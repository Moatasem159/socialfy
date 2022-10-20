import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FireBaseConsumer {
  Future<dynamic> get(
      {required String collectionName, required String docName});

  Future<QuerySnapshot> getCollections(
      {required String collectionName, required String order});

  dynamic listen({required String collectionName});

  Future<dynamic> add(
      {required String collectionName, required Map<String, dynamic> body});

  Future<dynamic> addDeep1(
      {required String collectionName1,
      required String collectionName2,
      required String docName,
      required Map<String, dynamic> body});

  Future<dynamic> set(
      {required String collectionName,
      required String docName,
      required Map<String, dynamic> body});

  Future<dynamic> update(
      {required String collectionName,
      required String docName,
      required Map<String, dynamic> body});
  Future<dynamic> updateDeep1(
      {required String collectionName1,
        required String docName1,
        required String collectionName2,
        required String docName2,
        required Map<String, dynamic> body});

  Future<dynamic> setDeep1(
      {required String collectionName1,
      required String docName1,
      required String collectionName2,
      required String docName2,
      required Map<String, dynamic> body});

  Future<dynamic> setDeep2(
      {required String collectionName1,
      required String docName1,
      required String collectionName2,
      required String docName2,
      required String collectionName3,
      required String docName3,
      required Map<String, dynamic> body});

  Future<dynamic> removeDeep2(
      {required String collectionName1,
      required String docName1,
      required String collectionName2,
      required String docName2,
      required String collectionName3,
      required String docName3});

  Future<dynamic> removeDeep1(
      {required String collectionName1,
      required String docName1,
      required String collectionName2,
      required String docName2});

  Future<dynamic> getCollectionDeep1(
      {required String collectionName1,
      required String docName1,
      required String collectionName2,
      required String order});

  Future<dynamic> getCollectionDeep2(
      {required String collectionName1,
        required String docName1,
        required String collectionName2,
        required String docName2,
        required String collectionName3,
        required String order
      });

  Future<dynamic> delete(
      {required String collectionName, required String docName});

  Future<dynamic> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<dynamic> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<dynamic> uploadImage({
    required String link,
    required File image,
  });
  Future<dynamic> deleteImage({
    required String link,
  });
  Future<dynamic> deleteDoc({
    required String collectionName, required String docName
  });
}
