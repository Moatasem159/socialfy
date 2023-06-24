import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/post/domain/usecases/delete_post_usecase.dart';
import 'package:socialfy/features/post/presentation/cubit/delete_post_cubit/delete_post_state.dart';
class DeletePostCubit extends Cubit<DeletePostStates> {
  DeletePostCubit(this._deletePostUseCase) : super(DeletePostInitialState());
  final DeletePostUseCase _deletePostUseCase;
  static DeletePostCubit get(context) => BlocProvider.of(context);
  Future<void> deletePost({required postId, required String postImage}) async {
    emit(DeletePostLoadingState());
    Either<Failure, void> response =
        await _deletePostUseCase.call(postId: postId, image: postImage);
    response.fold((failure) => emit(DeletePostErrorState()),
        (done) => emit(DeletePostSuccessState()));
  }
}