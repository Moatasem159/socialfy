import 'package:socialfy/features/messenger/domain/entities/chat.dart';

class ChatModel extends Chat{
  ChatModel({required super.receiverId, required super.chatId});
  factory ChatModel.fromJson(dynamic json) {
    return ChatModel(
      chatId: json["chatId"],
      receiverId: json["receiverId"],
    );
  }
}