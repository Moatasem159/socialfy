import 'package:socialfy/features/messenger/domain/entities/message.dart';
class MessageModel extends Message{
  const MessageModel({required super.senderId, required super.message, required super.createdAt});
  factory MessageModel.fromJson(dynamic json) =>MessageModel(
      senderId: json["senderId"],
      message: json["message"],
      createdAt: json["createdAt"]
  );
  Map<String, dynamic> toJson() =>{
    "senderId":senderId,
    "message":message,
    "createdAt":createdAt,
  };
}