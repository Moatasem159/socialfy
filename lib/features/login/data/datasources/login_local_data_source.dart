import 'package:socialfy/core/shared/shared_prefrences_consumer.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/profile/domain/entities/user.dart';
abstract class LoginLocalDataSource{
  Future<void> saveUserData(User user);
}
class LoginLocalDataSourceImpl implements LoginLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesConsumer;
  LoginLocalDataSourceImpl(this._sharedPrefrencesConsumer);
  @override
  Future<void> saveUserData(User user) async{
    AppStrings.userLoggedInId= user.uId;
    await _sharedPrefrencesConsumer.saveData(key: AppStrings.userLoggedIn, value:user.uId);
    AppStrings.profilePic= user.profilePic;
    await _sharedPrefrencesConsumer.saveData(key: AppStrings.userProfilePic,value:user.profilePic);
    AppStrings.userName=user.name;
    await _sharedPrefrencesConsumer.saveData(key: AppStrings.userProfileUsername, value:user.name);
  }
}