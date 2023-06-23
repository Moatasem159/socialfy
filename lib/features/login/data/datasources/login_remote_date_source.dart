import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialfy/core/firebase/end_points.dart';
import 'package:socialfy/core/firebase/firebase_consumer.dart';
import 'package:socialfy/core/models/user_model.dart';
abstract class LoginRemoteDataSource {
  Future<dynamic> login({required String email, required String password});
}
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final FireBaseConsumer _fireBaseConsumer;
  LoginRemoteDataSourceImpl(this._fireBaseConsumer);
  @override
  Future<dynamic> login(
      {required String email, required String password}) async {
    UserCredential userCredential = await _fireBaseConsumer
        .signInWithEmailAndPassword(email: email, password: password);
    if(userCredential.user!=null) {
      return await getUserData(userCredential.user!.uid);
    }
  }
  Future<UserDataModel> getUserData(uid)async{
    DocumentSnapshot<Map<String, dynamic>> response= await _fireBaseConsumer.get(
        collectionName: EndPoints.userCollection,
        docName: uid);
    return UserDataModel.fromJson(response.data()!);
  }
}
