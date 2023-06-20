import 'package:dartz/dartz.dart';
import 'package:socialfy/core/error/failures.dart';
abstract class ThemeRepository {
  Future<Either<Failure,bool>> changeTheme({required String theme});
  Future<Either<Failure,String>> getTheme();
}