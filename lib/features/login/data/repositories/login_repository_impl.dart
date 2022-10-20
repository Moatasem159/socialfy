import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/network/network_info.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/login/data/data_sources/login_remote_date_source.dart';
import 'package:socialfy/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository{

  LoginRemoteDataSource loginRemoteDataSource;
  NetworkInfo networkInfo;
  LoginRepositoryImpl({required this.loginRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, UserCredential>> userLogin({required String email, required String password})async {
    if(await networkInfo.isConnected)
    {
      try{
        final response = await loginRemoteDataSource.login(email: email,password: password);
        return right(response);
      }on FirebaseAuthException catch(error){
        return Left(LoginFailures(message: error.message!));
      }
    }
    else {
      return left(const LoginFailures(message:AppStrings.serverError));
    }
  }






}