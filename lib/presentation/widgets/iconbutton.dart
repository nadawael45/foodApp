import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomBtnIcon extends StatelessWidget {
  Widget? icon;
  var function;
  Color? color;


  CustomBtnIcon({this.icon, this.function,this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: color),
        width: 35.sp,
        height: 35.sp,
        child: icon,




          ),
    );
  }
}
