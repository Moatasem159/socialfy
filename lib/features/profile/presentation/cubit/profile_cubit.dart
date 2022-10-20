import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/shared/shared_prefrences_consumer.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/data/models/post_model.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/cubit/post_cubit.dart';
import 'package:socialfy/features/profile/data/models/user_model.dart';
import 'package:socialfy/features/profile/domain/usecase/get_profile_usecase.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit({required this.getProfileUseCase,required this.sharedPrefrencesConsumer}) : super(ProfileInitialState());

  GetProfileUseCase getProfileUseCase;
  SharedPrefrencesConsumer sharedPrefrencesConsumer;

  UserDataModel ?profile;

  Future<void> getProfile()async{
    if(AppStrings.userLoggedInId!=null)
    {
      emit(GetProfileLoadingState());
      Either<Failure,UserDataModel> response=await getProfileUseCase.call();
      response.fold((failure){
        emit(GetProfileErrorState());
      }, (user){
        profile=user;
        emit(GetProfileSuccessState());
      });
    }

  }



  List<Post>? userPosts;
  getUserPost({required BuildContext context}){
    emit(GetProfilePostsLoadingState());
    userPosts=[];
    List<PostModel>?posts=BlocProvider.of<PostCubit>(context).posts;
    for (var element in posts!) {
      if(element.uId==profile!.uId)
        {
          userPosts!.add(element);
        }
    }
    emit(GetProfilePostsSuccessState());
  }




  ScrollController itemController = ScrollController();

  Future scrollToPost({required double index}) async {
    itemController.jumpTo(index);
  }


  logOut(context)async{
    // logout=true;

    emit(LogoutLoadingState());
    await sharedPrefrencesConsumer.clear(key: AppStrings.userLoggedIn);
    emit(LogoutDoneState());
    Navigator.pushNamedAndRemoveUntil(context, Routes.welcomeScreenRoute, (route) => false);
  }

}
