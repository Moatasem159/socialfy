import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/register/domain/repositories/register_repository.dart';
class RegisterUseCase{
   final  RegisterRepository _registerRepository;
  RegisterUseCase(this._registerRepository);
   Future<Either<Failure,UserCredential>> call(
       {required String email,
         required String password,
         required String name,
         required String phone}) {
     return _registerRepository.userRegister(
         email: email,
         password: password,
         name: name,
         phone: phone);
   }
}