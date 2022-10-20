import 'package:socialfy/features/post/domain/entities/comment.dart';

class CommentModel extends Comment {
  CommentModel(
      { required super.uId,
      required super.commentID,
       required super.comment,
       required super.profilePic,
       required super.name,
      super.likes,
      required super.dateTime,

      });
  CommentModel.fromJson(Map<String,dynamic >json){
    uId=json['uId'];
    comment=json['comment'];
    commentID=json['commentId'];
    profilePic=json['profilePic'];
    name=json['name'];
    dateTime=json['dateTime'];
    if(DateTime.now().difference(DateTime.parse(json['dateTime'])).inSeconds == 0)
    {
      time = 'now';
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
      time = '${DateTime.now().difference(DateTime.parse(json['dateTime'])).inHours} h';
    }
    if(DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays >= 1)
    {
      time = '${DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays} d';
    }
    if(DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays >= 1 && DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays % 7 == 0)
    {
      time = '${(DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays / 7).floor()} w';
    }
    if(DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays >= 1 && DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays % 30 == 0)
    {
      time = '${(DateTime.now().difference(DateTime.parse(json['dateTime'])).inDays / 30).floor()} m';
    }
  }
  Map<String ,dynamic> toMap(){
    return {
      'name':name,
      'uId':uId,
      'profilePic':profilePic,
      'comment':comment,
      'dateTime':dateTime,
      'commentId':commentID
    };
  }
}
