import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/login/domain/repositories/login_repository.dart';
import 'package:socialfy/features/profile/data/models/user_model.dart';
class LoginUseCase{
  LoginRepository loginRepository;
  LoginUseCase({required this.loginRepository});
  Future<Either<Failure, UserDataModel>> call({required String email,required String password}) {
    return  loginRepository.userLogin(email: email, password: password);
  }
}