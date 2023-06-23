class Post {
  String? username;
  String? uId;
  String? postId;
  String? profilePic;
  dynamic postImageHeight;
  dynamic postImageWidth;
  String? dateTime;
  String? postText;
  String? postImage;
  List<String> ?likes;
  int? commentsCount;
  bool isLiked=false;
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
      this.postImageHeight,
      this.postImageWidth,
      });
}