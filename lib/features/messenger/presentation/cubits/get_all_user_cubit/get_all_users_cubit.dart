import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/entities/user.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/utils/app_global.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/messenger/domain/entities/chat.dart';
import 'package:socialfy/features/messenger/domain/usecases/get_user_chats_usecase.dart';
import 'package:socialfy/features/messenger/domain/usecases/get_users_usecase.dart';
import 'package:socialfy/features/messenger/presentation/cubits/get_all_user_cubit/get_all_users_state.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersStates> {
  GetAllUsersCubit(this._getAllUsersUsecase, this._getUserChatsUseCase) : super(GetAllUsersInitialState());

  static GetAllUsersCubit get(context) => BlocProvider.of(context);
  final GetAllUsersUsecase _getAllUsersUsecase;
  final GetUserChatsUseCase _getUserChatsUseCase;

  List<User> allUser=[];
  List<Chat> userChats = [];
   getAllUsers() async {
    emit(GetAllUsersLoadingState());
    await _getAllUsers();
    await _getUserChats();
  }
  Future _getAllUsers()async{
    allUser = [];
    Either<Failure, dynamic> response = await _getAllUsersUsecase.call();
    response.fold(
          (l) => emit(GetAllUsersErrorState()),
          (r) async{
        AppGlobal.users.addAll(r);
        allUser=r;
        allUser.removeWhere((element) => element.uId==AppStrings.userLoggedInId);
        emit(GetAllUsersSuccessState());
      },
    );
  }

  Future _getUserChats()async{
    userChats = [];
    Either<Failure, dynamic> response = await _getUserChatsUseCase.call();
    response.fold(
          (l) => emit(GetAllUsersErrorState()),
          (r) {
        userChats = r;
        for (var element in userChats) {
          for (var user in AppGlobal.users) {
            if (element.receiverId == user.uId!) {
              element.user = user;
              allUser.removeWhere((element) => element.uId==user.uId);
            }
          }
        }
        emit(GetAllUsersSuccessState());
      },
    );
  }
  change(){
    emit(ChangeState());
  }
}
