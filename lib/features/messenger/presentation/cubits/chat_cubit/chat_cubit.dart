import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/utils/app_global.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/messenger/data/models/message_model.dart';
import 'package:socialfy/features/messenger/domain/entities/chat.dart';
import 'package:socialfy/features/messenger/domain/entities/message.dart';
import 'package:socialfy/features/messenger/domain/usecases/create_chat_usecase.dart';
import 'package:socialfy/features/messenger/domain/usecases/get_chat_messages_usecase.dart';
import 'package:socialfy/features/messenger/domain/usecases/send_message_usecase.dart';
import 'package:socialfy/features/messenger/presentation/cubits/chat_cubit/chat_state.dart';
import 'package:socialfy/features/messenger/presentation/cubits/get_all_user_cubit/get_all_users_cubit.dart';
class ChatCubit extends Cubit<ChatStates> {
  ChatCubit(this._getChatMessagesUseCase, this._createChatUseCase, this._sendMessageUseCase):super(ChatInitialState());
  final GetChatMessagesUseCase _getChatMessagesUseCase;
  final CreateChatUseCase _createChatUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  static ChatCubit get(context)=>BlocProvider.of(context);
  List<Message> messages=[];
  final TextEditingController controller=TextEditingController();
  late final Chat chat=Chat(receiverId: receiverId, chatId: _getChatId());
  late final String receiverId;
  late final bool newChat;
  Stream<QuerySnapshot<Object>>getChatMessages() {
    return _getChatMessagesUseCase.call(chatId: _getChatId());
  }
  void fillList(List<QueryDocumentSnapshot<Object?>> snapshot){
    for (var i = 0; i < snapshot.length; i++) {
      if(!messages.contains(MessageModel.fromJson(snapshot[i].data()))){
        messages.add(MessageModel.fromJson(snapshot[i].data()));
        messages[i].messageId!=snapshot[i].id;
      }
    }
  }
  Future<void> sendMessage() async {
    emit(SendMessageLoadingState());
    if(controller.text.isNotEmpty) {
      String message=controller.text.trim();
      MessageModel model=MessageModel(
          senderId: AppStrings.userLoggedInId!,
          message: message,
          createdAt: DateTime.now().toIso8601String());
      if(message.trim().isNotEmpty)
      {
        controller.clear();
        if(newChat)
        {
          _createChat(message,model);
        }
        else{
          _sendMessage(message,model);
        }
      }
    }
  }

  void _createChat(String message, MessageModel model) async {
    Either<Failure, dynamic> response = await _createChatUseCase.call(
        chatId: chat.chatId, message: model, receiverId: chat.receiverId);
    response.fold((l) => emit(SendMessageErrorState()),
        (r) => emit(SendMessageSuccessState()));
  }

  void _sendMessage(String message, MessageModel model) async {
    Either<Failure, dynamic> response =
        await _sendMessageUseCase.call(chatId: chat.chatId, message: model);
    response.fold((l) => emit(SendMessageErrorState()),
        (r) => emit(SendMessageSuccessState()));
  }

  void listen(context,states)
  {
    if(state is SendMessageSuccessState)
    {
      if(newChat)
      {
        chat.user = AppGlobal.users.firstWhere((element) => element.uId == chat.receiverId);
        GetAllUsersCubit.get(context).userChats.add(chat);
        GetAllUsersCubit.get(context).allUser.remove(chat.user!);
        GetAllUsersCubit.get(context).change();
      }
    }
  }

  String _getChatId(){
    if(receiverId.length>AppStrings.userLoggedInId!.length)
      {
        return "${AppStrings.userLoggedInId.hashCode+receiverId.hashCode}";
      }
    else{
      return "${receiverId.hashCode+AppStrings.userLoggedInId.hashCode}";
    }
  }
}