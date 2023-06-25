import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/entities/user.dart';
import 'package:socialfy/core/utils/app_global.dart';
import 'package:socialfy/features/post/presentation/cubit/get_post_likes_cubit/get_post_likes_state.dart';
class GetPostLikesCubit extends Cubit<GetPostLikesStates> {
  GetPostLikesCubit() : super(GetPostLikesInitialState());
  Future<void> getPostLikes(List<String> ids) async {
    List<User>user=[];
    emit(GetPostLikesLoadingState());
    for (var element in AppGlobal.users){
      if(ids.contains(element.uId))
      {
        user.add(element);
      }
    }
    emit(GetPostLikesSuccessState(user));
  }
}