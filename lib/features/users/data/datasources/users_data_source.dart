import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialfy/core/firebase/end_points.dart';
import 'package:socialfy/core/firebase/firebase_consumer.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
abstract class UsersRemoteDataSource {
  Future<List<QueryDocumentSnapshot<Object?>>> getUsers();
}
class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  final FireBaseConsumer _fireBaseConsumer;
  UsersRemoteDataSourceImpl(this._fireBaseConsumer);
  @override
  Future<List<QueryDocumentSnapshot<Object?>>> getUsers() async {
    if(AppStrings.userLoggedInId!=null){
      List<QueryDocumentSnapshot<Object?>> users = [];
      QuerySnapshot response = await _fireBaseConsumer.getCollections(
          collectionName: EndPoints.userCollection);
      users.addAll(response.docs);
      return users;
    }
    return [];
  }
}