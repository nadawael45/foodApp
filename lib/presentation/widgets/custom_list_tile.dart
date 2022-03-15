import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../shared/constants/colors.dart';
import 'custom_text.dart';
class CustomListTile extends StatelessWidget {
  String? text;
  IconData? icon;

  CustomListTile({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(icon,color: priGreen,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.sp,vertical: 15),
            child: CustomText(text: text,txtSize: 10.sp,)

          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios,color: Colors.grey,),



        ],
      ),

     

    );
  }
}
