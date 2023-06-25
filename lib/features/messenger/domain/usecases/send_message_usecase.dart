import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/messenger/data/models/message_model.dart';
import 'package:socialfy/features/messenger/domain/repositories/chat_repository.dart';
class SendMessageUseCase{
  final ChatRepository _chatRepository;
  SendMessageUseCase(this._chatRepository);
  Future<Either<Failure,dynamic>>call({required String chatId,required MessageModel message}){
    return _chatRepository.sendMessage(chatId: chatId, message: message);
  }
}