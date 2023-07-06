import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/users/domain/repositories/users_repository.dart';
class GetAllUsersUsecase{
  final UsersRepository _usersRepository;
  GetAllUsersUsecase(this._usersRepository);
  Future<Either<Failure,dynamic>>call(){
    return _usersRepository.getUsers();
  }
}