import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/shared/shared_prefrences_consumer.dart';
import 'package:socialfy/core/models/user_model.dart';
import 'package:socialfy/features/profile/domain/usecase/get_profile_usecase.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit/profile_state.dart';
class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit({required this.getProfileUseCase,required this.sharedPrefrencesConsumer})
      : super(ProfileInitialState());
  static ProfileCubit get(context)=>BlocProvider.of(context);
  GetProfileUseCase getProfileUseCase;
  SharedPrefrencesConsumer sharedPrefrencesConsumer;
  final SliverOverlapAbsorberHandle appbar = SliverOverlapAbsorberHandle();
  Future<void> getProfile()async{
      emit(GetProfileLoadingState());
      Either<Failure,UserDataModel> response=await getProfileUseCase.call();
      response.fold((failure){
        emit(GetProfileErrorState());
      }, (user){
        emit(GetProfileSuccessState(user));
      });
  }
  logOut()async{
    emit(LogoutLoadingState());
    await sharedPrefrencesConsumer.clearSharedPrefrences();
    emit(LogoutDoneState());
  }
}
