import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/network/network_info.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/register/data/datasources/register_remote_data_source.dart';
import 'package:socialfy/features/register/domain/repositories/register_repository.dart';
class RegisterRepositoryImpl implements RegisterRepository {
  final NetworkInfo _networkInfo;
  final RegisterRemoteDataSource _registerRemoteDataSource;
  RegisterRepositoryImpl(this._networkInfo,this._registerRemoteDataSource);
  @override
  Future<Either<Failure,UserCredential>> userRegister(
      {required String email,
      required String password,
      required String name,
      required String phone}) async{
    if(await _networkInfo.isConnected)
      {
        try{
       UserCredential response = await _registerRemoteDataSource
           .register(email: email, password: password, name: name, phone: phone);
       return right(response);
     }on FirebaseAuthException catch(error){
       return left(RegisterFailures(message: error.message));
     }
    }
    else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }
}