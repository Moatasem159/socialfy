import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/settings/domain/repositories/theme_repository.dart';
class ChangeThemeUseCase{
  final ThemeRepository _themeRepository;
  ChangeThemeUseCase(this._themeRepository);
  Future<Either<Failure, bool>> call({String ?theme})async {
    return await _themeRepository.changeTheme(theme:theme!);
  }
}