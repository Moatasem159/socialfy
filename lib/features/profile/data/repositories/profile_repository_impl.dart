import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/network/network_info.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:socialfy/features/profile/data/models/user_model.dart';
import 'package:socialfy/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository{

  ProfileRemoteDataSource profileRemoteDataSources;
  NetworkInfo networkInfo;

  ProfileRepositoryImpl({required this.profileRemoteDataSources,required  this.networkInfo});
  @override
  Future<Either<Failure, UserDataModel>> getProfile()async {
    if(await networkInfo.isConnected)
      {
        try{
          final response= await profileRemoteDataSources.getProfile();

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