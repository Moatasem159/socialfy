import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/utils/app_global.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/messenger/data/models/message_model.dart';
import 'package:socialfy/features/messenger/domain/entities/chat.dart';
import 'package:socialfy/features/messenger/domain/usecases/create_chat_usecase.dart';
import 'package:socialfy/features/messenger/domain/usecases/send_message_usecase.dart';
import 'package:socialfy/features/messenger/presentation/cubits/get_all_user_cubit/get_all_users_cubit.dart';
import 'package:socialfy/features/messenger/presentation/cubits/send_message_cubit/send_message_state.dart';
class SendMessageCubit extends Cubit<SendMessageStates> {
  SendMessageCubit(this._createChatUseCase, this._sendMessageUseCase) : super(SendMessageInitialState());
  static SendMessageCubit get(context) => BlocProvider.of(context);
  final CreateChatUseCase _createChatUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  late final Chat chat;
  late final bool newChat;
  final TextEditingController controller=TextEditingController();
  Future<void> sendMessage(context) async {
    emit(SendMessageLoadingState());
    if(controller.text.isNotEmpty) {
      String message=controller.text.trim();
     if(message.trim().isNotEmpty)
       {
         controller.clear();
         if(newChat)
         {
           _createChat(message);
         }
         else{
           _sendMessage(message);
         }
       }
    }
  }
  void _createChat(String message)async{
    Either<Failure, dynamic> response = await _createChatUseCase.call(
        chatId: chat.chatId,
        message: MessageModel(
            senderId: AppStrings.userLoggedInId!,
            message: message,
            createdAt: DateTime.now().toIso8601String()),
        receiverId: chat.receiverId);
    response.fold((l) => emit(SendMessageErrorState()),
            (r){

              emit(SendMessageSuccessState());
            });
  }

  void _sendMessage(String message) async {
    Either<Failure, dynamic> response = await _sendMessageUseCase.call(
        chatId: chat.chatId,
        message: MessageModel(
            senderId: AppStrings.userLoggedInId!,
            message: message,
            createdAt: DateTime.now().toIso8601String()));
    response.fold((l) => emit(SendMessageErrorState()), (r) {
      emit(SendMessageSuccessState());
    });
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
}