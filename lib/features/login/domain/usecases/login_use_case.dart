import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/login/domain/repositories/login_repository.dart';

class LoginUseCase{
  LoginRepository loginRepository;
  LoginUseCase({required this.loginRepository});
  Future<Either<Failure, UserCredential>> call(
      {required String email,
        required String password}) {
    return  loginRepository.userLogin(email: email, password: password);
  }
}