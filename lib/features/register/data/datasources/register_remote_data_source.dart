import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialfy/core/firebase/end_points.dart';
import 'package:socialfy/core/firebase/firebase_consumer.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/models/user_model.dart';
abstract class RegisterRemoteDataSource {
  Future<dynamic> register(
      {required String email,
      required String password,
      required String name,
      required String phone});
}
class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final FireBaseConsumer _fireBaseConsumer;
  RegisterRemoteDataSourceImpl(this._fireBaseConsumer);
  @override
  Future<dynamic> register(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    UserCredential userCredential= await _fireBaseConsumer.createUserWithEmailAndPassword(email: email, password: password);
    if(userCredential.user!=null)
      {
        userData(
            collectionName: EndPoints.userCollection,
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
     await _fireBaseConsumer.set(
        collectionName: collectionName, docName: uId, body: model.toJson());
  }
}
