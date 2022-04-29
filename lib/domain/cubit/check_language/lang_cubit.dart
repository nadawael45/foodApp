import 'package:bloc/bloc.dart';
import 'package:fitandfresh/data/local/cacheHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'lang_state.dart';

class CheckLanguageCubit extends Cubit<CheckLanguageState>{

  CheckLanguageCubit() : super(InitialLanguage());
  bool isArabic=false;


  static CheckLanguageCubit get(context) => BlocProvider.of(context);

  changeLangBool(BuildContext context){
    isArabic=!isArabic;
    context.locale.toString()=='en'?context.setLocale(Locale('ar')):context.setLocale(Locale('en'));
    CacheHelper.putBool('isArab', isArabic);
    changeLang(context);
  }

  changeLang(BuildContext context){
    if(isArabic){
      context.setLocale(Locale('ar'));
      CacheHelper.putBool('isArab', true);

      emit(ArabicLanguage());
    }
    if(isArabic==false){
      context.setLocale(Locale('en'));
      CacheHelper.putBool('isArab', false);

      emit(EnglishLanguage());
    }
  }
}

