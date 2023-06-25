import 'package:socialfy/core/entities/user.dart';

class Chat{
  final String chatId;
  final String receiverId;
  User? user;
  Chat({required this.receiverId,required this.chatId});
}