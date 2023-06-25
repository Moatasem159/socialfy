import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/models/user_model.dart';
import 'package:socialfy/core/network/network_info.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/messenger/data/datasources/chat_remote_data_source.dart';
import 'package:socialfy/features/messenger/data/models/chat_model.dart';
import 'package:socialfy/features/messenger/data/models/message_model.dart';
import 'package:socialfy/features/messenger/domain/entities/chat.dart';
import 'package:socialfy/features/messenger/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource _chatRemoteDataSource;
  final NetworkInfo _networkInfo;

  ChatRepositoryImpl(this._chatRemoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, dynamic>> getUsers() async {
    if (await _networkInfo.isConnected) {
      List<UserDataModel> users = [];
      try {
        final response = await _chatRemoteDataSource.getUsers();
        for (var element in response) {
          users.add(UserDataModel.fromJson(element.data()));
        }
        return Right(users);
      } on FirebaseException catch (error) {
        return left(DisCommentLikeFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }

  @override
  Future<Either<Failure, dynamic>> createChat(
      {required String chatId,required MessageModel message,required String receiverId}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _chatRemoteDataSource.createChat(
            chatId: chatId,
            message: message,
            receiverId: receiverId);
        return Right(response);
      } on FirebaseException catch (error) {
        return left(DisCommentLikeFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }
  @override
  Stream<QuerySnapshot<Object>> getChatMessages({required String chatId}) async* {
    if (await _networkInfo.isConnected) {
      try {
        yield* _chatRemoteDataSource.getChatMessages(chatId: chatId);
      } on FirebaseException catch (error) {
        yield* Stream.error(GetNewsFeedFailures(message: error.message));
      }
    } else {
      yield* Stream.error(const ServerFailure(message: AppStrings.serverError));
    }
  }

  @override
  Future<Either<Failure, dynamic>> getUserChats()async{
    if (await _networkInfo.isConnected) {
      List<Chat> chats = [];
      try {
        final response = await _chatRemoteDataSource.getUserChats();
        for (var element in response) {
          chats.add(ChatModel.fromJson(element.data()));
        }
        return Right(chats);
      } on FirebaseException catch (error) {
        return left(DisCommentLikeFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }

  @override
  Future<Either<Failure, dynamic>> sendMessage({required String chatId, required MessageModel message}) async{
    if (await _networkInfo.isConnected) {
      try {
        final response = await _chatRemoteDataSource.sendMessage(
            chatId: chatId,
            message: message);
        return Right(response);
      } on FirebaseException catch (error) {
        return left(DisCommentLikeFailures(message: error.message));
      }
    } else {
      return left(const ServerFailure(message: AppStrings.serverError));
    }
  }
}