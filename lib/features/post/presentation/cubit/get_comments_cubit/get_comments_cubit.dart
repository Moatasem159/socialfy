import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/data/models/comment_model.dart';
import 'package:socialfy/features/post/domain/usecases/get_post_comments_usecase.dart';
import 'package:socialfy/features/post/presentation/cubit/get_comments_cubit/get_comments_state.dart';

class GetCommentsCubit extends Cubit<GetCommentsStates> {
  GetCommentsCubit(this._getPostCommentUseCase) : super(GetCommentsInitialState());
  final GetPostCommentUseCase _getPostCommentUseCase;
  static GetCommentsCubit get(context)=>BlocProvider.of(context);
  List<CommentModel>?comments;

  Stream<QuerySnapshot<Object>>getComments(String postId) {
    return _getPostCommentUseCase.call(postId:postId);
  }
  void fillList(AsyncSnapshot<QuerySnapshot<Object?>> snapshot){
    comments=[];
    if (snapshot.hasData) {
      for (var i = 0; i < snapshot.data!.docs.length; i++) {
        comments!.add(CommentModel.fromJson(snapshot.data!.docs[i]));
        comments![i].commentId=snapshot.data!.docs[i].id;
        if(comments![i].likes!.contains(AppStrings.userLoggedInId)){
          comments![i].isLike=true;
        }
      }
    }
  }
}
