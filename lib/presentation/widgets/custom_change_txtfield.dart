import 'package:fitandfresh/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
class CustomChangeInfo extends StatelessWidget {
  String? hint;
  TextEditingController? controller;

  CustomChangeInfo({this.hint, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint!.tr(),
        hintStyle: TextStyle(color: priGrey,fontSize: 10.sp),

        contentPadding: EdgeInsets.all(20.0),
        disabledBorder : OutlineInputBorder(
    borderSide: BorderSide(color: priGrey),),

      ),

    );
  }
}
