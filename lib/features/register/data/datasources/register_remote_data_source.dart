import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialfy/core/firebase/end_points.dart';
import 'package:socialfy/core/firebase/firebase_consumer.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/profile/data/models/user_model.dart';

abstract class RegisterRemoteDataSource {
  Future<dynamic> register(
      {required String email,
      required String password,
      required String name,
      required String phone});
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  FireBaseConsumer fireBaseConsumer;

  RegisterRemoteDataSourceImpl({required this.fireBaseConsumer});

  @override
  Future<dynamic> register(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    UserCredential userCredential= await fireBaseConsumer.createUserWithEmailAndPassword(email: email, password: password);
    if(userCredential.user!=null)
      {
        userData(
            collectionName: EndPoints.USERCOLLECTION,
            email: email,
            name: name,
            uId: userCredential.user!.uid,
            phone: phone);
      }

    return userCredential;

  }

  Future<void> userData(
      {required String collectionName,
      required String email,
      required String name,
      required String uId,
      required String phone}) async {
    var model = UserDataModel(
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        token: AppStrings.userToken,
        bio: '',
        profilePic: '');
     await fireBaseConsumer.set(
        collectionName: collectionName, docName: uId, body: model.toJson());
  }
}
