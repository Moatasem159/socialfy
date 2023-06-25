import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/messenger/data/models/message_model.dart';
import 'package:socialfy/features/messenger/domain/repositories/chat_repository.dart';
class CreateChatUseCase{
  final ChatRepository _chatRepository;
  CreateChatUseCase(this._chatRepository);
  Future<Either<Failure,dynamic>>call({required String chatId,required MessageModel message,required String receiverId}){
    return _chatRepository.createChat(chatId: chatId, message: message, receiverId: receiverId);
  }
}