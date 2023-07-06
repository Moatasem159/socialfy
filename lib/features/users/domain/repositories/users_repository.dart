import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
abstract class UsersRepository{
  Future<Either<Failure, dynamic>> getUsers();
}