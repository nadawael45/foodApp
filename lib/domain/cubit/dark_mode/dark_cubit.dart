import 'package:bloc/bloc.dart';
import 'package:fitandfresh/data/local/cacheHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dark_state.dart';

class DarkModeCubit extends Cubit<DarkModeState> {
  bool isDark = false;

  DarkModeCubit() : super(InitialMode());

  static DarkModeCubit get(context) => BlocProvider.of(context);


  changeMode() {
    isDark =! isDark;
    CacheHelper.putBool('isDark', isDark);
    changeToDark();
  }


  changeToDark() {
    if (isDark) {
      emit(DarkMode());
    }
    if (isDark == false) {
      emit(LightMode());
    }
  }
}
