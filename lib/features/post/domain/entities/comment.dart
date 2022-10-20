import 'package:socialfy/features/post/data/models/like_model.dart';

class Comment {
  String? uId;
  String? commentID;
  String? comment;
  String? profilePic;
  String? name;
  String? dateTime;
  String? time;
  bool isLike = false;
  List<LikeModel>? likes;

  Comment(
      {this.uId,
      this.commentID,
      this.comment,
      this.profilePic,
      this.name,
      this.likes,
      this.dateTime});
}
