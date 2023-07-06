import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/messenger/data/models/message_model.dart';
abstract class ChatRepository{
  Future<Either<Failure, dynamic>> getUserChats();
  Future<Either<Failure, dynamic>> createChat({required String chatId,required MessageModel message,required String receiverId});
  Future<Either<Failure, dynamic>> sendMessage({required String chatId,required MessageModel message});
  Stream<QuerySnapshot<Object>> getChatMessages({required String chatId});
}