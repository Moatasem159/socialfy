import 'package:socialfy/core/shared/shared_prefrences_consumer.dart';
abstract class ThemeLocalDataSource {
  Future<bool> changeTheme({required String theme});
  Future<String> getTheme();
}
class ThemeLocalDataSourceImpl implements ThemeLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesConsumer;
  ThemeLocalDataSourceImpl(this._sharedPrefrencesConsumer);
  @override
  Future<bool> changeTheme({required String theme})async {
    return await _sharedPrefrencesConsumer.saveData(key:"appTheme",value: theme);
  }
  @override
  Future<String> getTheme()async {
    return _sharedPrefrencesConsumer.containsKey(key: "appTheme")?
    _sharedPrefrencesConsumer.getData(key: "appTheme"):"light";
  }
}