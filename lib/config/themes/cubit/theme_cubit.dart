
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/config/themes/app_theme.dart';
import 'package:socialfy/config/themes/cubit/theme_state.dart';
import 'package:socialfy/core/shared/shared_prefrences_consumer.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit({required this.sharedPrefrencesConsumer}) : super(ThemeInitialState());
  SharedPrefrencesConsumer sharedPrefrencesConsumer;
  bool isDark=false;
  bool ?systemDefault;



  void changeThemeMode({bool? fromShared,bool ?system,bool ?dark}) async{
    emit(ChangeAppThemeLoadingState());
    if(system==null){
      systemDefault==true;
      isDark=false;
      sharedPrefrencesConsumer.saveData(key: "systemTheme",value: true);
      AppTheme.setStatusBarAndNavigationBarColors(false);
      emit(ChangeAppThemeDoneState());
    }
    else if(system==true)
      {
        systemDefault=true;
        emit(ChangeAppThemeDoneState());
      }
    else if(system==false)
      {
        systemDefault=false;
        sharedPrefrencesConsumer.saveData(key: "systemTheme",value: systemDefault);
        if(fromShared!=null){
          if(fromShared=true)
            {
              isDark = fromShared;
              AppTheme.setStatusBarAndNavigationBarColors(isDark);
              emit(ChangeAppThemeDoneState());
            }
          else {
            isDark = dark!;
            AppTheme.setStatusBarAndNavigationBarColors(isDark);
            sharedPrefrencesConsumer.saveData(key: "dark",value: isDark);
            emit(ChangeAppThemeDoneState());
          }


        }
        else {
          isDark = dark!;
          AppTheme.setStatusBarAndNavigationBarColors(isDark);
          sharedPrefrencesConsumer.saveData(key: "dark",value: isDark);
          emit(ChangeAppThemeDoneState());
        }
      }

    // if(system!=null&&system==true)
    //   {
    //     systemDefault=true;
    //     isDark=false;
    //
    //     emit(ChangeAppThemeDoneState());
    //   }
    // else if(system!=null&&system==false)
    //   {
    //     systemDefault=false;
    //     if(fromShared!=null){
    //       isDark = fromShared;
    //       AppTheme.setStatusBarAndNavigationBarColors(isDark);
    //       emit(ChangeAppThemeDoneState());
    //     }
    //     else {
    //       isDark = !isDark;
    //       AppTheme.setStatusBarAndNavigationBarColors(isDark);
    //       emit(ChangeAppThemeDoneState());
    //
    //     }
    //   }
    // else if(system==null)
    //   {
    //     systemDefault=true;
    //     isDark=!isDark;
    //     emit(ChangeAppThemeDoneState());
    //   }

    // sharedPrefrencesConsumer.saveData(key: "systemTheme",value: systemDefault);
    // sharedPrefrencesConsumer.saveData(key: "dark",value: isDark);
    // AppTheme.setStatusBarAndNavigationBarColors(systemDefault);


  }
}
