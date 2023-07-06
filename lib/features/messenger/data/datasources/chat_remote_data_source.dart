import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialfy/core/firebase/end_points.dart';
import 'package:socialfy/core/firebase/firebase_consumer.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/messenger/data/models/message_model.dart';

abstract class ChatRemoteDataSource {
  Future<dynamic> createChat({required String chatId,required MessageModel message,required String receiverId});
  Future<dynamic> sendMessage({required String chatId,required MessageModel message});
  Stream<QuerySnapshot<Object>> getChatMessages({required String chatId});
  Future<List<QueryDocumentSnapshot<Object?>>> getUserChats();
}
class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final FireBaseConsumer _fireBaseConsumer;
  ChatRemoteDataSourceImpl(this._fireBaseConsumer);
  @override
  Future<dynamic> createChat({required String chatId,required MessageModel message,required String receiverId}) async {
    await _fireBaseConsumer.addDeep1(
        collectionName1: EndPoints.chatsCollection,
        docName:chatId,
        collectionName2: EndPoints.messagesCollection,
        body:message.toJson())
        .then((value)async{
          await _fireBaseConsumer.setDeep1(
              collectionName1: EndPoints.userCollection,
              docName1: AppStrings.userLoggedInId!,
              collectionName2: EndPoints.chatsCollection,
              docName2: chatId,
              body: {"chatId": chatId, "receiverId": receiverId});
        }).then((value)async{
      await _fireBaseConsumer.setDeep1(
          collectionName1: EndPoints.userCollection,
          docName1: receiverId,
          collectionName2: EndPoints.chatsCollection,
          docName2: chatId,
          body: {"chatId": chatId, "receiverId": AppStrings.userLoggedInId!});
    });}

  @override
  Stream<QuerySnapshot<Object>> getChatMessages({required String chatId}) {
    return _fireBaseConsumer.streamListenDeep1(
        collectionName: EndPoints.chatsCollection,
        docName: chatId,
        order: "createdAt",
        descending: false,
        collectionName2: EndPoints.messagesCollection);
  }

  @override
  Future<List<QueryDocumentSnapshot<Object?>>> getUserChats()async {
    if(AppStrings.userLoggedInId!=null){
      List<QueryDocumentSnapshot<Object?>> chats = [];
      QuerySnapshot response = await _fireBaseConsumer.getCollectionDeep1(
          collectionName1: EndPoints.userCollection,
          docName1:AppStrings.userLoggedInId!,
          collectionName2:EndPoints.chatsCollection);
      chats.addAll(response.docs);
      return chats;
    }
    return [];
  }
  @override
  Future sendMessage({required String chatId, required MessageModel message}) async{
    await _fireBaseConsumer.addDeep1(
        collectionName1: EndPoints.chatsCollection,
        docName:chatId,
        collectionName2: EndPoints.messagesCollection,
        body:message.toJson());
  }
}
