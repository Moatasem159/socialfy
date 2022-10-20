import 'package:socialfy/features/post/domain/entities/post.dart';

class PostModel extends Post{
  PostModel({required super.username,
    required super.postId,
    required super.uId,
    required super.profilePic,
    required super.dateTime,
    required super.postText,
    required super.postImage,
    super.likes,
    super.commentsCount,
  });
  PostModel.fromJson(Map<String,dynamic >json){
    dateTime=json['dateTime']??'';
    username=json['name']??'';
    postText=json['postText']??'';
    uId=json['uId']??'';
    postId=json['postId']??'';
    postImage=json['postImage']??'';
    profilePic=json['profilePic']??'';
    commentsCount=json["commentsCount"]??0;
    if(DateTime.now().difference(DateTime.parse(json['dateTime'])).inSeconds == 0)
    {
      time = 'Just now';
    }
    if(DateTime.now().difference(DateTime.parse(json['dateTime'])).inMinutes < 1 && DateTime.now().difference(DateTime.parse(json['dateTime'])).inSeconds > 0)
    {
      time = '${DateTime.now().difference(DateTime.parse(json['dateTime'])).inSeconds} s';
    }
    if(DateTime.now().difference(DateTime.parse(json['dateTime'])).inMinutes >= 1)
    {
      time = '${DateTime.now().difference(DateTime.parse(json['dateTime'])).inMinutes} m';
    }
    if(DateTime.now().difference(DateTime.parse(json['dateTime'])).inHours >= 1)
    {
      time = '${DateTime.now().difference(DateTime.parse(json['dateTime'])).inHours} hours';
    }
    if(DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays >= 1)
    {
      time = '${DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays} days';
    }
    if(DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays >= 1 && DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays % 7 == 0)
    {
      time = '${(DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays / 7).floor()} week';
    }
    if(DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays >= 1 && DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays % 30 == 0)
    {
      time = '${(DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays / 30).floor()} m';
    }
  }

  Map<String ,dynamic> toMap(){
    return {
      'name':username,
      'dateTime':dateTime,
      'postText':postText,
      'uId':uId,
      'postImage':postImage,
      'profilePic':profilePic,
      'postId':postId,
    };
  }

}