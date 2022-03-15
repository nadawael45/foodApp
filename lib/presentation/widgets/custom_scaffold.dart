import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../domain/cubit/dark_mode/dark_cubit.dart';
import '../../shared/constants/colors.dart';
import '../dialoges/drawer.dart';

class CustomScaffold extends StatelessWidget {

  var body;
  bool boolAppBar;
  IconData? prefixIcon;
  IconData? suffixIcon;
  String? text;
  var prefixFunction;
  var suffixFunction;
  var scaffKey;
  CustomScaffold({
    this.boolAppBar=false,
    this.prefixIcon, this.suffixIcon, this.text, this.prefixFunction,
    this.suffixFunction,
    this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: DarkModeCubit.get(context).isDark
            ? Colors.black
            : backgroungd,
        appBar: boolAppBar==false?PreferredSize(child: SizedBox(), preferredSize: Size(0,0)):PreferredSize(
          preferredSize: Size(100.h, 17.h,),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 8.sp),
            child: Container(
              color:  DarkModeCubit.get(context).isDark
                  ? Colors.grey.shade800
                  : Colors.white,
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: prefixFunction,
                      icon: Icon(
                        prefixIcon,
                        color: Colors.black,
                      )),
                  CustomText(
                    fontWeight: FontWeight.bold,
                    text: text,
                    txtSize: 13.sp,
                  ),
                  IconButton(
                      onPressed: suffixFunction,
                      icon: Icon(
                        suffixIcon,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ),
        ),

        body: body,

      ),
    );
  }
}
//class CustomAppBar extends StatelessWidget {
//  IconData? prefixIcon;
//  IconData? suffixIcon;
//  String? text;
//  var prefixFunction;
//  var suffixFunction;
//
//  CustomAppBar({this.prefixIcon, this.suffixIcon, this.text, this.prefixFunction,
//      this.suffixFunction});
//
//  @override
//  Widget build(BuildContext context) {
//    return PreferredSize(
//      preferredSize: Size(100.h, 17.h,),
//      child: Padding(
//        padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 8.sp),
//        child: Container(
//          color: Colors.white,
//          child:
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [
//              IconButton(
//                  onPressed: prefixFunction,
//                  icon: Icon(
//                    prefixIcon,
//                    color: Colors.black,
//                  )),
//              CustomText(
//                color: Colors.black,
//                fontWeight: FontWeight.bold,
//                text: text,
//                txtSize: 13.sp,
//              ),
//              IconButton(
//                  onPressed: suffixFunction,
//                  icon: Icon(
//                    suffixIcon,
//                    color: Colors.black,
//                  )),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
