import 'package:easy_localization/easy_localization.dart';
class Validator{


  static String? validateName(String? value) {
    if (value!.isEmpty ) {
      return 'Enter Name';
    }else {
      return null;
    }
  }

  static String? validatePhone(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp =RegExp(pattern);
    if (value.isEmpty) {
      return 'Enter Phone'.tr();
    }else if(!regExp.hasMatch(pattern)){
      return 'Phone Must be digits';

    }
    else {
    return null;
    }
  }

  static String? validateEmail(String value) {
    String pattern=
   r' /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Enter Email';
    }else if (!regExp.hasMatch(value)) {
      return 'Invalid Email';
    }else {
      return null;
    }
  }

  static String? validatePassword(String value){
 if(value.isEmpty){
   return 'Enter Passsword'.tr();
 }else if(value.length<6){
   return 'Enter Passsword';

 }else {
   return null;
 }
  }

  static String? validateEmpty(String? value) {
    if(value!.isEmpty) {
      return "It Can't be empty";
    }else {
  return null;
  }
}}