import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialfy/features/messenger/domain/repositories/chat_repository.dart';
class GetChatMessagesUseCase{
  final ChatRepository _chatRepository;
  GetChatMessagesUseCase(this._chatRepository);
  Stream<QuerySnapshot<Object>>call({required String chatId})=>_chatRepository.getChatMessages(chatId: chatId);
}