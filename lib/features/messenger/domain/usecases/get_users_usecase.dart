import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/messenger/domain/repositories/chat_repository.dart';
class GetAllUsersUsecase{
  final ChatRepository _chatRepository;
  GetAllUsersUsecase(this._chatRepository);
  Future<Either<Failure,dynamic>>call(){
    return _chatRepository.getUsers();
  }
}