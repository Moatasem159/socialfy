import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/settings/domain/usecases/change_theme_usecase.dart';
import 'package:socialfy/features/settings/domain/usecases/get_theme_usecase.dart';
import 'package:socialfy/features/settings/presentation/cubit/theme_cubit/theme_state.dart';
class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit(this._changeThemeUseCase, this._getThemeUseCase) : super(const ChangeThemeState(ThemeMode.system));
  final ChangeThemeUseCase _changeThemeUseCase;
  final GetThemeUseCase _getThemeUseCase;
  static ThemeCubit get(context)=>BlocProvider.of(context);
  Future<void> _changeTheme({required String theme}) async {
    final response = await _changeThemeUseCase.call(theme: theme);
    response.fold(
      (_) => debugPrint("cache Failure"),
      (_) => getTheme());
  }
  Future<void> getTheme() async {
    final response = await _getThemeUseCase.call();
    response.fold(
      (failure) => debugPrint("cache Failure"),
      (theme) {
        if (theme == "system") {
          emit(const ChangeThemeState(ThemeMode.system));
        } else if (theme == "dark") {
          emit(const ChangeThemeState(ThemeMode.dark));
        } else {
          emit(const ChangeThemeState(ThemeMode.light));
        }
      },
    );
  }
  void lightTheme() => _changeTheme(theme: "light");
  void darkTheme() => _changeTheme(theme: "dark");
  void systemTheme() => _changeTheme(theme: "system");
}
