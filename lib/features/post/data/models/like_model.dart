import 'package:socialfy/features/post/domain/entities/like.dart';

class LikeModel extends Like{
  LikeModel({required super.username, required super.uId, required super.profilePic,required super.dateTime});

  LikeModel.fromJson(Map<String,dynamic >json){
    username=json['name'];
    uId=json['uId'];
    profilePic=json['profilePic'];
    dateTime=json['dateTime'];

  }
  Map<String ,dynamic> toMap(){
    return {
      'name':username,
      'dateTime':dateTime,
      'uId':uId,
      'profilePic':profilePic,
    };
  }
}