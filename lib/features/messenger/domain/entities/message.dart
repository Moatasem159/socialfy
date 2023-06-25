import 'package:equatable/equatable.dart';

class Message extends Equatable{
  final String senderId;
  final String message;
  final String createdAt;
  final String? messageId;
  const Message({this.messageId, required this.senderId,required this.message,required this.createdAt});
  @override
  List<Object?> get props =>[senderId, message, createdAt];
}