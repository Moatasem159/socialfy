abstract class SharedPrefrencesConsumer {
   Future<bool> saveData({required String key, required dynamic value});
   getData({required String key});
   dynamic clear({required String key});
   bool containsKey({required String key});
   Future<bool> clearSharedPrefrences();
}