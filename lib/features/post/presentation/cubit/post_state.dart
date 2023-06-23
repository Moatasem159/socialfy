import 'package:equatable/equatable.dart';
abstract class PostStates extends Equatable {
  @override
  List<Object> get props => [];
}
class PostInitialState extends PostStates {}

class DeletePostLoadingState extends PostStates{}
class DeletePostSuccessState extends PostStates{}
class DeletePostErrorState extends PostStates{}
class PickImagePostSuccessState extends PostStates{}
class PickImagePostErrorState extends PostStates{}
class RemoveImagePostState extends PostStates{}




class GetNewsFeedLoadingState extends PostStates{}
class GetNewsFeedSuccessState extends PostStates{}
class GetNewsFeedErrorState extends PostStates{}

class AddLikeLoadingState extends PostStates{}
class AddLikeSuccessState extends PostStates{}
class AddLikeErrorState extends PostStates{}
class DisLikeLoadingState extends PostStates{}
class DisLikeSuccessState extends PostStates{}
class DisLikeErrorState extends PostStates{}
class DeleteCommentLoadingState extends PostStates{}
class DeleteCommentSuccessState extends PostStates{}
class DeleteCommentErrorState extends PostStates{}

class AddLikeToCommentLoadingState extends PostStates{}
class AddLikeToCommentSuccessState extends PostStates{}
class AddLikeToCommentErrorState extends PostStates{}




