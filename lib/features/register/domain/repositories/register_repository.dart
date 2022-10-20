import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';


abstract class RegisterRepository{

  Future<Either<Failure,UserCredential>> userRegister({
    required String email,
    required String password,
    required String name,
    required String phone});
}