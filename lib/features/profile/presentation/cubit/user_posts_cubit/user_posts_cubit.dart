import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/cubit/get_posts_cubit/news_feed_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/user_posts_cubit/user_posts_state.dart';

class UserPostsCubit extends Cubit<UserPostsStates> {
  UserPostsCubit() : super(UserPostsInitialState());
  static UserPostsCubit get(context)=>BlocProvider.of(context);
  List<Post> userPosts=[];
  void getUserPosts(context){
    userPosts=[];
    for (var element in GetPostsCubit.get(context).posts){
      if(element.uId==AppStrings.userLoggedInId)
      {
        userPosts.add(element);
      }
    }
  }
}
