import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/network/network_info.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/models/user_model.dart';
import 'package:socialfy/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:socialfy/features/profile/domain/repositories/profile_repository.dart';
class ProfileRepositoryImpl implements ProfileRepository{
  final ProfileRemoteDataSource _profileRemoteDataSources;
  final NetworkInfo _networkInfo;
  ProfileRepositoryImpl(this._profileRemoteDataSources, this._networkInfo);
  @override
  Future<Either<Failure, UserDataModel>> getProfile()async {
    if(await _networkInfo.isConnected)
      {
        try{
          final response= await _profileRemoteDataSources.getProfile();
          return right(response);
        }on FirebaseException catch(error){
          return left(GetProfileFailures(message: error.message));
        }
      }
    else{
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }
}