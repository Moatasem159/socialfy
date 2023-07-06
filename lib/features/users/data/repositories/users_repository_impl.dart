import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/models/user_model.dart';
import 'package:socialfy/core/network/network_info.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/users/data/datasources/users_data_source.dart';
import 'package:socialfy/features/users/domain/repositories/users_repository.dart';
class UsersRepositoryImpl implements UsersRepository {
  final UsersRemoteDataSource _usersRemoteDataSource;
  final NetworkInfo _networkInfo;
  UsersRepositoryImpl(this._usersRemoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, dynamic>> getUsers() async {
    if (await _networkInfo.isConnected) {
      List<UserDataModel> users = [];
      try {
        final response = await _usersRemoteDataSource.getUsers();
        for (var element in response) {
          users.add(UserDataModel.fromJson(element.data()));
        }
        return Right(users);
      } on FirebaseException catch (error) {
        return left(DisCommentLikeFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }
}