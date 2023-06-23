import 'package:socialfy/core/entities/user.dart';
abstract class GetPostLikesStates {}
class GetPostLikesInitialState extends GetPostLikesStates {}
class GetPostLikesLoadingState extends GetPostLikesStates {}
class GetPostLikesSuccessState extends GetPostLikesStates {
 final List<User> users;
  GetPostLikesSuccessState(this.users);
}
class GetPostLikesErrorState extends GetPostLikesStates {}
