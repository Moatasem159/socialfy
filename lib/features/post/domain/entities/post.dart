import 'package:socialfy/features/post/data/models/like_model.dart';

class Post {
  String? username;
  String? uId;
  String? postId;
  String? profilePic;
  String? dateTime;
  String? postText;
  String? postImage;
  // int? postCount;
  bool isLike = false;
  List<LikeModel>? likes;
  int? commentsCount;
  // final List<CommentModel>? comments;
  String? time;
  Post(
      {this.username,
      this.uId,
      this.profilePic,
      this.dateTime,
      this.postText,
      this.postImage,
      this.postId,
      this.likes,
      this.commentsCount,
      });
}
