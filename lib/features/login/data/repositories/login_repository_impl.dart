import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/network/network_info.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/login/data/datasources/login_local_data_source.dart';
import 'package:socialfy/features/login/data/datasources/login_remote_date_source.dart';
import 'package:socialfy/features/login/domain/repositories/login_repository.dart';
import 'package:socialfy/features/profile/data/models/user_model.dart';
class LoginRepositoryImpl implements LoginRepository{
  final LoginRemoteDataSource _loginRemoteDataSource;
  final LoginLocalDataSource _loginLocalDataSource;
  final NetworkInfo _networkInfo;
  LoginRepositoryImpl(this._loginRemoteDataSource,this._networkInfo, this._loginLocalDataSource);
  @override
  Future<Either<Failure, UserDataModel>> userLogin({required String email, required String password})async {
    if(await _networkInfo.isConnected)
    {
      try{
        final response = await _loginRemoteDataSource.login(email: email,password: password);
        await _loginLocalDataSource.saveUserData(response);
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