import 'dart:ui';

import 'package:fitandfresh/constants/colors.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class DoneDialoge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Center(
        child: Container(
          height: 27.h,
          width: 70.w,
          child: AlertDialog(

            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35.sp,
                  width: 35.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 2,color: priGreen),
                  ),
                  child: Icon(Icons.done,color: priGreen,size: 30,),),
                SizedBox(height: 15.sp,),
                CustomText(color: priGreen,text: 'Done',txtSize: 15.sp,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
showDoneDialoge(BuildContext context){
  showDialog(context:context,builder: (builder)=> DoneDialoge() );
}