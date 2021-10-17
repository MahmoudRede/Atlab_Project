import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
 static SharedPreferences? sharedPreferences;

 static void init () async {
   sharedPreferences = await SharedPreferences.getInstance();
 }


 static Future<bool> saveData ({
  required String key ,
  dynamic value ,
 }) async
 {
  return sharedPreferences!.setString(key, value);
 }

 static dynamic getData ({
  required String key,
 })
 {
  return sharedPreferences!.get(key);
 }

 static Future<bool> removeData({
  required String key,
 }) async
 {
  return await sharedPreferences!.remove(key);
 }



}