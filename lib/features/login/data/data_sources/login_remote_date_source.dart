import 'package:socialfy/core/firebase/firebase_consumer.dart';

abstract class LoginRemoteDataSource {

  Future<dynamic> login({required String email,
    required String password,});
}


class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final FireBaseConsumer fireBaseConsumer;
  LoginRemoteDataSourceImpl({required this.fireBaseConsumer});
  @override
  Future<dynamic> login({required String email, required String password}) async {
    return await fireBaseConsumer.signInWithEmailAndPassword(email: email, password: password);
  }
}