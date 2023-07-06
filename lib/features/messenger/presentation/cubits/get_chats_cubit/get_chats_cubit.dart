import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/entities/user.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/messenger/domain/entities/chat.dart';
import 'package:socialfy/features/messenger/domain/usecases/get_user_chats_usecase.dart';
import 'package:socialfy/features/messenger/presentation/cubits/get_chats_cubit/get_chats_state.dart';
import 'package:socialfy/features/users/presentation/cubits/get_all_users_cubit.dart';
class GetChatsCubit extends Cubit<GetChatsStates> {
  GetChatsCubit(this._getUserChatsUseCase) : super(GetChatsInitialState());
  static GetChatsCubit get(context) => BlocProvider.of(context);
  final GetUserChatsUseCase _getUserChatsUseCase;
  List<Chat> userChats = [];
  List<User> allChats = [];
  Future<void> getUserChats() async {
    emit(GetChatsLoadingState());
    userChats = [];
    Either<Failure, dynamic> response = await _getUserChatsUseCase.call();
    response.fold(
      (l) => emit(GetChatsErrorState()),
      (r) {
        userChats = r;
        for (int i = 0; i < GetAllUsersCubit.allUsers.length; i++) {
          bool foundChat = false;
          for (Chat chat in userChats) {
            if (chat.receiverId == GetAllUsersCubit.allUsers[i].uId) {
              chat.user = GetAllUsersCubit.allUsers[i];
              foundChat = true;
              break;
            }
          }
          if (!foundChat && GetAllUsersCubit.allUsers[i].uId != AppStrings.userLoggedInId) {
            allChats.add(GetAllUsersCubit.allUsers[i]);
          }
        }
        emit(GetChatsSuccessState());
      },
    );
  }
  change() {
    emit(ChangeState());
  }
  bool isSuccess() {
    return state is GetChatsSuccessState;
  }
}