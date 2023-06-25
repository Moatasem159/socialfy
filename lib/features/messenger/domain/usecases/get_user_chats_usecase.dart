import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/messenger/domain/repositories/chat_repository.dart';
class GetUserChatsUseCase{
  final ChatRepository _chatRepository;
  GetUserChatsUseCase(this._chatRepository);
  Future<Either<Failure,dynamic>>call(){
    return _chatRepository.getUserChats();
  }
}