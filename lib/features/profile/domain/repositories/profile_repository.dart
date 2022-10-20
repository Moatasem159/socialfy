import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/profile/data/models/user_model.dart';

abstract class ProfileRepository{
  Future<Either<Failure,UserDataModel>> getProfile();
}