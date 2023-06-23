import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialfy/core/shared/shared_prefrences_consumer.dart';
class SharedPrefrencesManager extends SharedPrefrencesConsumer{
   final  SharedPreferences _sharedPreferences;
  SharedPrefrencesManager(this._sharedPreferences);
  @override
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) return await _sharedPreferences.setString(key, value);
    if (value is int) return await _sharedPreferences.setInt(key, value);
    if (value is bool) return await _sharedPreferences.setBool(key, value);
    return await _sharedPreferences.setDouble(key, value);
  }
  @override
  dynamic getData({required String key}){
    return _sharedPreferences.get(key);
  }
  @override
  dynamic clear({required String key})
  {
    return _sharedPreferences.remove(key);
  }
   @override
   bool containsKey({required String key}){
     return _sharedPreferences.containsKey(key);
   }
   @override
   Future<bool> clearSharedPrefrences()async{
     return await _sharedPreferences.clear();
   }
}