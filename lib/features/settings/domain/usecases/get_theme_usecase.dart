import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/settings/domain/repositories/theme_repository.dart';
class GetThemeUseCase{
  final ThemeRepository _themeRepository;
  GetThemeUseCase(this._themeRepository);
  Future<Either<Failure, String>> call()async {
    return await _themeRepository.getTheme();
  }
}