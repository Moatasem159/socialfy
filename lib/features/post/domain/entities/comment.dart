class Comment {
  String? uId;
  String? commentId;
  String? comment;
  String? profilePic;
  String? name;
  String? dateTime;
  List<String>? likes;
  bool isLike=false;
  Comment(
      {this.uId,
      this.commentId,
      this.comment,
      this.profilePic,
      this.name,
      this.likes,
      this.dateTime});
}
