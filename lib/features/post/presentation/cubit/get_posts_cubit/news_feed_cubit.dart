import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/data/models/post_model.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/domain/usecases/get_posts_usecase.dart';
import 'package:socialfy/features/post/presentation/cubit/get_posts_cubit/news_feed_state.dart';
import 'package:socialfy/features/profile/presentation/cubit/user_posts_cubit/user_posts_cubit.dart';
class GetPostsCubit extends Cubit<GetPostsStates> {
  GetPostsCubit(this._getPostsUseCase) : super(GetPostsInitialState());
  final GetPostsUseCase _getPostsUseCase;
  static GetPostsCubit get(context)=>BlocProvider.of(context);
  List<Post> posts=[];
  Stream<QuerySnapshot<Object>>getPosts() {
    return _getPostsUseCase.call();
  }
  void fillList(AsyncSnapshot<QuerySnapshot<Object?>> snapshot,context){
    posts.clear();
    for (var i = 0; i < snapshot.data!.docs.length; i++) {
      posts.add(PostModel.fromJson(snapshot.data!.docs[i].data()));
      posts[i].postId=snapshot.data!.docs[i].id;
      if(posts[i].likes!.contains(AppStrings.userLoggedInId)){
        posts[i].isLiked=true;
      }
    }
    UserPostsCubit.get(context).getUserPosts(context);
  }
}
