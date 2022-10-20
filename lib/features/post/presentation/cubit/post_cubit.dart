

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/data/models/comment_model.dart';
import 'package:socialfy/features/post/data/models/image_model.dart';
import 'package:socialfy/features/post/data/models/like_model.dart';
import 'package:socialfy/features/post/data/models/post_model.dart';
import 'package:socialfy/features/post/domain/usecases/add_like_to_comment_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/add_like_to_post_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/create_comment_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/create_post_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/delete_comment_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/delete_post_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/dislike_comment_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/dislike_post_use_case.dart';
import 'package:socialfy/features/post/domain/usecases/get_images_from_gallery_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/get_new_feed_usecase.dart';
import 'package:socialfy/features/post/domain/usecases/get_post_comments_usecase.dart';
import 'package:socialfy/features/post/presentation/cubit/post_state.dart';
import 'package:socialfy/features/profile/data/models/user_model.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit.dart';

class PostCubit extends Cubit<PostStates> {
  PostCubit({required this.getImageFromGalleryUseCase,
    required this.createPostUseCase,
    required this.deletePostUseCase,
    required this.getNewsFeedUseCase,
    required this.addLikeUseCase,
    required this.disLikeUseCase,
    required this.createCommentUseCase,
    required this.deleteCommentUseCase,
    required this.addLikeToCommentUseCase,
    required this.disLikeCommentUseCase,
    required this.getPostCommentUseCase,
  })
      : super(PostInitialState());
  CreatePostUseCase createPostUseCase;
  DeletePostUseCase deletePostUseCase;
  GetImageFromGalleryUseCase getImageFromGalleryUseCase;
  GetNewsFeedUseCase getNewsFeedUseCase;
  AddLikeToPostUseCase addLikeUseCase;
  DisLikePostUseCase disLikeUseCase;
  CreateCommentUseCase createCommentUseCase;
  GetPostCommentUseCase getPostCommentUseCase;
  DeleteCommentUseCase deleteCommentUseCase;
  AddLikeToCommentUseCase addLikeToCommentUseCase;
  DisLikeCommentUseCase disLikeCommentUseCase;

  TextEditingController captionController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  Future<void> createPost({required String caption,
    required dynamic image,
    required BuildContext context}) async {
    UserDataModel user = BlocProvider
        .of<ProfileCubit>(context)
        .profile!;

    PostModel post = PostModel(
      username: user.name,
      uId: user.uId,
      postId: "",
      commentsCount: 0,
      profilePic: user.profilePic,
      dateTime: DateTime.now().toIso8601String(),
      postText: caption,
      postImage: image,
    );
    emit(CreatePostLoadingState());
    Either<Failure, void> response =
    await createPostUseCase.call(postModel: post, postImage: imageFile!);
    response.fold((failure) {
      emit(CreatePostErrorState());
    }, (done) {
      emit(CreatePostSuccessState());
    });
  }


  Future<void>deletePost({required postId,required String postImage})async {
    emit(DeletePostLoadingState());
    Either<Failure, void> response =await deletePostUseCase.call(postId: postId, image: postImage);

    response.fold((failure){
      emit(DeletePostErrorState());
    }, (done){
      // for (var element in posts!) {
      //   if(element.postId==postId)
      //     {
      //       posts!.remove(element);
      //     }
      // }
      });
      emit(DeletePostSuccessState());
  }

  List<FileModel>? files;
  FileModel? selectedModel;
  String? image;
  File? imageFile;

  Future getImagesPath() async {
    emit(GetImagesLoadingState());
    List<FileModel> response = await getImageFromGalleryUseCase.call();
    files = response;
    if (files != null && files!.isNotEmpty) {
      selectedModel = files![2];
      selectedModel!.files!.sort((a, b) => b.compareTo(a),);
      image = files![2].files![0];
      imageFile = File(image!);
     // var a= decodeImageFromList(await imageFile!.readAsBytes());
     //  imageFile!.path;
    }
    emit(GetImagesSuccessState());
  }

  List<PostModel>? posts;

  Future<void> getNewFeed() async {
    emit(GetNewsFeedLoadingState());
    Either<Failure, dynamic> response = await getNewsFeedUseCase.call();
    response.fold((failure) {
      emit(GetNewsFeedErrorState());
    },(newsFeed){
      posts = newsFeed;
      for (var post in posts!) {
        for (var likes in post.likes!) {
          if (AppStrings.userLoggedInId == likes.uId) {
            post.isLike = true;
          }
        }
      }
      emit(GetNewsFeedSuccessState());
    });
  }

  Future<void> addLike({required postId,
    required String uid,
    required String name,
    required String profilePic}) async {
    final like = LikeModel(username: name,
        uId: uid,
        profilePic: profilePic,
        dateTime: DateTime.now().toIso8601String());
    for (var post in posts!) {
      if (post.postId == postId) {

        post.likes!.add(like);
        post.isLike = true;
      }
    }
    emit(AddLikeLoadingState());
    // LikeModel likeData = LikeModel(
    //   username: name,
    //   uId: uid,
    //   profilePic: profilePic,
    //   dateTime: DateTime.now().toIso8601String(),
    // );
    Either<Failure, dynamic> response =
    await addLikeUseCase.call(postId: postId, likeData: like);
    response.fold((failure) {
      emit(AddLikeErrorState());
    }, (done) {
      emit(AddLikeSuccessState());
    });
  }


  Future<void> disLike({required postId, required String uid}) async {
    for (int i = 0; i < posts!.length; i++) {
      if (posts![i].postId == postId) {
        for (int j = 0; j < posts![i].likes!.length; j++) {
          if (posts![i].likes![j].uId == AppStrings.userLoggedInId) {
            posts![i].likes!.remove(posts![i].likes![j]);
          }
        }
        posts![i].isLike = false;
      }
    }
    emit(DisLikeLoadingState());
    Either<Failure, dynamic> response =
    await disLikeUseCase.call(postId: postId);
    response.fold((failure) {
      emit(DisLikeErrorState());
    }, (done) {
      emit(DisLikeSuccessState());
    });
  }


  Future<void> like({
    required String postId,
    required String uid,
    required String name,
    required String profilePic}) async {
    for (var post in posts!) {
      if (postId == post.postId) {
        if (post.isLike == false) {
          addLike(postId: postId, uid: uid, name: name, profilePic: profilePic);
        }
        else if (post.isLike == true) {
          disLike(postId: postId, uid: uid);
        }
      }
    }
  }


  Future<void> createComment(
      {required String postId,
        required String comment,
        required int commentsCount,
        required BuildContext context}) async {
    UserDataModel user = BlocProvider
        .of<ProfileCubit>(context)
        .profile!;
    CommentModel commentModel = CommentModel(
      uId: user.uId,
      commentID: '',
      comment: comment,
      profilePic: user.profilePic,
      name: user.name,
      dateTime: DateTime.now().toIso8601String(),);
    emit(CreateCommentLoadingState());
    Either<Failure, void> response = await createCommentUseCase.call(
        commentModel: commentModel, postId: postId,commentsCount: commentsCount);
    response.fold((failure){
      emit(CreateCommentErrorState());
    }, (done){

  emit(CreateCommentSuccessState());
    });
  }

  Future<void>deleteComment({required postId,required String commentId,required commentCount})async {
    emit(DeleteCommentLoadingState());
    Either<Failure, void> response =await deleteCommentUseCase.call(postId: postId, commentId: commentId,commentCount:commentCount );

    response.fold((failure){
      emit(DeleteCommentErrorState());
    }, (done){
      // for (var element in comments!) {
      //   if(element.commentID==commentId)
      //     {
      //       comments!.remove(element);
      //     }
      // }
    });
    emit(DeleteCommentSuccessState());
  }


  Future<void> addLikeToComment({
    required String postId,
    required String commentId,
    required String uid,
    required String name,
    required String profilePic})async{
    final like = LikeModel(
        username: name,
        uId: uid,
        profilePic: profilePic,
        dateTime: DateTime.now().toIso8601String());
    for (var comment in comments!) {
      if (comment.commentID == commentId) {
        comment.likes!.add(like);
        comment.isLike = true;
      }
    }
    emit(AddLikeToCommentLoadingState());
    // LikeModel likeData = LikeModel(
    //   username: name,
    //   uId: uid,
    //   profilePic: profilePic,
    //   dateTime: DateTime.now().toIso8601String(),
    // );
    Either<Failure, dynamic> response =
    await addLikeToCommentUseCase.call(postId: postId, likeData: like, commentId: commentId);
    response.fold((failure) {
      emit(AddLikeToCommentErrorState());
    }, (done) {
      emit(AddLikeToCommentSuccessState());
    });
  }

  Future<void> disLikeComment({required postId, required String uid,required String commentId}) async {
    for (int i = 0; i < comments!.length; i++) {
      if (comments![i].commentID == commentId) {
        for (int j = 0; j < comments![i].likes!.length; j++) {
          if (comments![i].likes![j].uId == AppStrings.userLoggedInId) {
            comments![i].likes!.remove(comments![i].likes![j]);
          }
        }
        comments![i].isLike = false;
      }
    }
    emit(DisLikeLoadingState());
    Either<Failure, dynamic> response =
    await disLikeCommentUseCase.call(postId: postId,commentId: commentId);
    response.fold((failure) {
      emit(DisLikeErrorState());
    }, (done) {
      emit(DisLikeSuccessState());
    });
  }


  Future<void> likeComment({
    required String postId,
    required String commentId,
    required String uid,
    required String name,
    required String profilePic})async{
    for (var comment in comments!) {
      if (commentId == comment.commentID) {
        if (comment.isLike == false){
          addLikeToComment(postId: postId, uid: uid, name: name, profilePic: profilePic,commentId: commentId);
        }
        else if (comment.isLike == true) {
          disLikeComment(postId: postId, uid: uid, commentId: commentId);
        }
      }
    }
  }

  List<CommentModel>? comments;

  Future<void> getPostComments({required String postId})async{
    emit(GetPostCommentsLoadingState());
    Either<Failure, dynamic> response = await getPostCommentUseCase.call(postId: postId);
    response.fold((failure){
      emit(GetPostCommentsErrorState());
    },(postComments){
      comments=postComments;
      for (var comment in comments!) {
        for (var likes in comment.likes!) {
          if (AppStrings.userLoggedInId == likes.uId) {
            comment.isLike = true;
          }
        }
      }
      emit(GetPostCommentsSuccessState());
    });
  }
}
