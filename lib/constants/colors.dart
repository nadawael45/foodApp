
import 'package:flutter/material.dart';
import '../domain/cubit/dark_mode/dark_cubit.dart';

 Color priGrey=Colors.grey.shade500;
Color priGreen=Colors.lightGreen;
Color backgroungd=Color(0xFFF3F3F3);

change(BuildContext context){
 DarkModeCubit.get(context).isDark
     ? Colors.black
     : Color(0xFFF3F3F3);
}
