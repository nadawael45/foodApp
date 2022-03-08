import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../domain/cubit/dark_mode/dark_cubit.dart';

class CustomText extends StatelessWidget {
  String? text;
  double?txtSize;
  FontWeight?fontWeight;
  Color? color;
  TextAlign textAlign;

  CustomText({this.text, this.txtSize, this.fontWeight,
    this.color ,
    this.textAlign=TextAlign.center});

  @override
  Widget build(BuildContext context) {

    return Text((text!).tr(),
        textAlign: textAlign,

        style:  GoogleFonts.tajawal(
          color: color,
          fontSize: txtSize,
          fontWeight: fontWeight,




        ));
  }
}
