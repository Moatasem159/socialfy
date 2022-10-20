import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String ?name;
  final String ?email;
  final String ?phone;
  final String ?uId;
  final String ? profilePic;
  final String ? bio;
  // bool ? isEmailVerified;
  final String ? token;

  const User({this.profilePic, this.bio, this.name, this.email, this.phone, this.uId, this.token});

  @override
  List<Object?> get props => [];
}
