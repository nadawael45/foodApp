import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../shared/constants/colors.dart';
class CustomChangeInfo extends StatelessWidget {
  String? hint;
  TextEditingController? controller;
  var validate;

  CustomChangeInfo({this.hint, this.controller,this.validate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validate,
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
