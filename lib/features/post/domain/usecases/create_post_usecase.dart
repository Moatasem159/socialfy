import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/data/models/post_model.dart';
import 'package:socialfy/features/post/domain/repositories/post_repository.dart';

class CreatePostUseCase{

  final PostRepository postRepository;

  CreatePostUseCase({required this.postRepository});

  Future<Either<Failure,dynamic>>call({required PostModel postModel,required File postImage}){
    return postRepository.createPost(postModel: postModel, postImage: postImage);
  }
}