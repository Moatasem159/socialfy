import 'package:socialfy/features/post/domain/entities/post.dart';
class PostModel extends Post{
  PostModel({
    super.username,
     super.postId,
     super.uId,
     super.profilePic,
     super.dateTime,
     super.postText,
     super.postImage,
    super.likes,
    super.commentsCount,
    super.postImageHeight,
    super.postImageWidth
  });
  factory PostModel.fromJson(dynamic json)=>PostModel(
    dateTime:json['dateTime']??'',
    username:json['name']??'',
    postText:json['postText']??'',
    uId:json['uId']??'',
    likes:List<String>.from(json['likes']),
    postImage:json['postImage']??'',
    profilePic:json['profilePic']??'',
    commentsCount:json["commentsCount"]??0,
    postImageWidth:json["postImageWidth"]??0,
    postImageHeight:json["postImageHeight"]??0,
  );

  Map<String ,dynamic> toMap(){
    return {
      'name':username,
      'dateTime':dateTime,
      'postText':postText,
      'uId':uId,
      "commentsCount":commentsCount,
      'postImage':postImage,
      'profilePic':profilePic,
      'postImageHeight':postImageHeight,
      'postImageWidth':postImageWidth,
      'likes':likes,
    };
  }

}