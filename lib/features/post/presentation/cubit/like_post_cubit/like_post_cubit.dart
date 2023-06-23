import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/domain/usecases/add_like_to_post_usecase.dart';
import 'package:socialfy/features/post/presentation/cubit/like_post_cubit/like_post_state.dart';
class LikePostCubit extends Cubit<LikePostStates> {
  LikePostCubit(this._likePostUseCase) : super(LikePostInitialState());
  final LikePostUseCase _likePostUseCase;
  static LikePostCubit get(context)=>BlocProvider.of(context);
  Future<void> likePost({required postId,required List<String>likes,required bool isLiked}) async {
    if(isLiked)
    {
      likes.remove(AppStrings.userLoggedInId!);
    }
    else {
      likes.add(AppStrings.userLoggedInId!);
    }
    emit(LikePostLoadingState());
    Either<Failure, dynamic> response =
    await _likePostUseCase.call(postId: postId,likes:likes);
    response.fold(
            (failure) =>emit(LikePostErrorState()),
            (done) =>emit(LikePostSuccessState()));
  }
}
