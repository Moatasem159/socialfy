import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/shared/shared_prefrences_consumer.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/core/models/user_model.dart';
import 'package:socialfy/features/profile/domain/usecase/get_profile_usecase.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit({required this.getProfileUseCase,required this.sharedPrefrencesConsumer}) : super(ProfileInitialState());

  static ProfileCubit get(context)=>BlocProvider.of(context);
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
    // List<PostModel>?posts=BlocProvider.of<PostCubit>(context).posts;
    // for (var element in posts!) {
    //   if(element.uId==AppStrings.userLoggedInId)
    //     {
    //       userPosts!.add(element);
    //     }
    // }
    emit(GetProfilePostsSuccessState());
  }

  logOut()async{
    emit(LogoutLoadingState());
    await sharedPrefrencesConsumer.clearSharedPrefrences();
    emit(LogoutDoneState());
  }
}
