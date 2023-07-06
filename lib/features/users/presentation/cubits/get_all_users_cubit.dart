import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/entities/user.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/users/domain/usecases/get_all_users_usecase.dart';
import 'package:socialfy/features/users/presentation/cubits/get_all_users_state.dart';
class GetAllUsersCubit extends Cubit<GetAllUsersStates> {
  final GetAllUsersUsecase _getAllUsersUsecase;
  GetAllUsersCubit(this._getAllUsersUsecase) : super(GetAllUsersInitialState());
  static GetAllUsersCubit get(context) => BlocProvider.of(context);
  static List<User> allUsers=[];
  Future <void> getAllUsers()async{
    allUsers = [];
    Either<Failure, dynamic> response = await _getAllUsersUsecase.call();
    response.fold(
          (l) => emit(GetAllUsersErrorState()),
          (r) async{
            allUsers=r;
        emit(GetAllUsersSuccessState());
      },
    );
  }
}