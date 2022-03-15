import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../shared/constants/colors.dart';
import 'custom_iconbutton.dart';
import 'custom_text.dart';
class CustomBmr extends StatelessWidget {
  IconData? icon;
  String? text;

  Widget? widget;
  CustomBmr({this.icon, this.text, this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 25.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
          children: [
            CustomBtnIcon(
              icon: Icon(icon,color: Colors.white,size: 38,),
              color: priGreen,
              width: 43.sp,
              height: 43.sp,

            ),
            SizedBox(width: 6.sp,),
            CustomText(text: text,txtSize: 14.sp,fontWeight: FontWeight.bold,),

          ],
        ),
        widget!

      ],),
    );
  }

}
class TextFieldBMR extends StatelessWidget {
  String? textUnit;
 TextEditingController? controller;

  TextFieldBMR({this.textUnit,this.controller});

  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          Container(
            width: 40.sp,
            child: TextFormField(
            controller: controller,
              keyboardType: TextInputType.number,



            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 25.sp,right: 7.sp,left: 7.sp),
            child: CustomText(text: textUnit,),
          ),


        ],
      );
  }
}
