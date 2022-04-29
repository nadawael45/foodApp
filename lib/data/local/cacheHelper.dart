
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
 static late SharedPreferences sharedPreferences ;


 //بدل ما استدعيها كذا مره لا انا هحطها ف المين
 // هنا هحقق السنجلتون  عشان هو كود واحد هستخدمه ف كل الابلكيشن مره واحده
 
 static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
 }
 
static putBool(key,value){
   sharedPreferences.setBool(key, value);
 }
 static getBool(key){
  return sharedPreferences.getBool(key)??false;
 }

 static putString(key,value){
   sharedPreferences.setString(key, value);
 }
 static getString(key){
   return sharedPreferences.getString(key)??"UserName";
 }
}