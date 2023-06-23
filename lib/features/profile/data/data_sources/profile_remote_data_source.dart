import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socialfy/core/firebase/end_points.dart';
import 'package:socialfy/core/firebase/firebase_consumer.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/models/user_model.dart';

abstract class ProfileRemoteDataSource {

  Future<UserDataModel> getProfile();
}




class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource{

  FireBaseConsumer fireBaseConsumer;


  ProfileRemoteDataSourceImpl({required this.fireBaseConsumer});

  @override
  Future<UserDataModel> getProfile() async{
    DocumentSnapshot<Map<String, dynamic>> response= await fireBaseConsumer.get(
        collectionName: EndPoints.userCollection,
        docName: AppStrings.userLoggedInId!);
     return UserDataModel.fromJson(response.data()!);
  }
}