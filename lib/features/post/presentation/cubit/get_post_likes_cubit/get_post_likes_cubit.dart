import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/domain/usecases/get_post_likes_usecase.dart';
import 'package:socialfy/features/post/presentation/cubit/get_post_likes_cubit/get_post_likes_state.dart';
class GetPostLikesCubit extends Cubit<GetPostLikesStates> {
  GetPostLikesCubit(this._getPostLikesUseCase) : super(GetPostLikesInitialState());
  static GetPostLikesCubit get(context) => BlocProvider.of(context);
  final GetPostLikesUseCase _getPostLikesUseCase;
  Future<void> getPostLikes(List<String> ids) async {
    emit(GetPostLikesLoadingState());
    Either<Failure, dynamic> response =
        await _getPostLikesUseCase.call(ids: ids);
    response.fold((l) => emit(GetPostLikesErrorState()),
        (users) => emit(GetPostLikesSuccessState(users)));
  }
}