import 'package:socialfy/features/post/domain/entities/comment.dart';

class CommentModel extends Comment {
  CommentModel({
    required super.uId,
    super.commentId,
    required super.comment,
    required super.profilePic,
    required super.name,
    super.likes,
    required super.dateTime,
  });

  factory CommentModel.fromJson(dynamic json) => CommentModel(
        uId: json['uId'],
        comment: json['comment'],
        profilePic: json['profilePic'],
        name: json['name'],
        dateTime: json['dateTime'],
        likes:List<String>.from(json['likes']),
      );
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'profilePic': profilePic,
      'comment': comment,
      'dateTime': dateTime,
      'likes':likes,
    };
  }
}
