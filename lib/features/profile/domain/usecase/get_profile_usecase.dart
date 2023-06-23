import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/models/user_model.dart';
import 'package:socialfy/features/profile/domain/repositories/profile_repository.dart';

class GetProfileUseCase{
  ProfileRepository profileRepository;
  GetProfileUseCase({required this.profileRepository});
  Future<Either<Failure,UserDataModel>> call(){
    return profileRepository.getProfile();
  }
}