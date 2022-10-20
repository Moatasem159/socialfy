import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialfy/core/error/failures.dart';


abstract class LoginRepository{
  Future<Either<Failure,UserCredential>> userLogin({
    required String email,
    required String password});
}