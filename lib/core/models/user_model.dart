import 'package:socialfy/core/entities/user.dart';
class UserDataModel extends User {
  const UserDataModel(
      {required String name,
        required String email,
        required String phone,
        required String uId,
        required String? token,
        required String? profilePic,
        required String ?bio,
      }):super(name: name,
      phone: phone,
      email: email,
      uId: uId,
      token: token,
      profilePic:profilePic,bio:bio);
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