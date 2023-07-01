import 'package:socialfy/core/entities/user.dart';
class UserDataModel extends User {
  const UserDataModel(
      {required super.name,
        required super.email,
        required super.phone,
        required super.uId,
        required super.token,
        required super.profilePic,
        required super.bio,
      });
  factory UserDataModel.fromJson(dynamic json) =>
      UserDataModel(
        name: json["name"]??'',
        email: json["email"]??'',
        phone: json["phone"]??'',
        uId: json["uId"]??'',
        token: json["token"]??'',
        profilePic: json["profilePic"]??'',
        bio: json["bio"]??'',
      );
  Map<String, dynamic> toJson() =>
      {
        "name": name??'',
        "email": email??'',
        "phone": phone??'',
        "uId": uId??'',
        "token": token??'',
        "profilePic": profilePic??'',
        "bio": bio??'',
      };
}