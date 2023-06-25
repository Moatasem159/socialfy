import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/messenger/data/models/message_model.dart';
import 'package:socialfy/features/messenger/domain/entities/message.dart';
import 'package:socialfy/features/messenger/domain/usecases/get_chat_messages_usecase.dart';
import 'package:socialfy/features/messenger/presentation/cubits/chat_cubit/chat_state.dart';
class ChatCubit extends Cubit<ChatStates> {
  ChatCubit(this._getChatMessagesUseCase) : super(ChatInitialState());
  final GetChatMessagesUseCase _getChatMessagesUseCase;
  static ChatCubit get(context)=>BlocProvider.of(context);
  List<Message> messages=[];
  late final String ?receiverId;
  Stream<QuerySnapshot<Object>>getChatMessages() {
    return _getChatMessagesUseCase.call(chatId: getChatId());
  }
  void fillList(List<QueryDocumentSnapshot<Object?>> snapshot){
    for (var i = 0; i < snapshot.length; i++) {
      if(!messages.contains(MessageModel.fromJson(snapshot[i].data()))){
        messages.add(MessageModel.fromJson(snapshot[i].data()));
        messages[i].messageId!=snapshot[i].id;
      }

    }
  }

  String getChatId(){
    if(receiverId!.length>AppStrings.userLoggedInId!.length)
      {
        return "${AppStrings.userLoggedInId.hashCode+receiverId.hashCode}";
      }
    else{
      return "${receiverId.hashCode+AppStrings.userLoggedInId.hashCode}";
    }
  }
}