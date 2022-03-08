import 'package:bloc/bloc.dart';
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
    changeLang();
  }

  changeLang(){
    if(isArabic){

      emit(ArabicLanguage());
    }
    if(isArabic==false){

      emit(EnglishLanguage());
    }
  }
}

