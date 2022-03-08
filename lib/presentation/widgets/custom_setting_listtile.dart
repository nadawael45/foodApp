import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../constants/colors.dart';
class SettingListTile extends StatelessWidget {
  String? title;
  Widget? widget;
  var function;
  SettingListTile({this.title, this.widget,this.function});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsetsDirectional.only(start: 12.sp,end: 18.sp),
          child: InkWell(
            onTap: function,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: title,),
              widget==null?Icon(Icons.arrow_forward_ios,color: priGreen,):widget!,
            ],

            ),
          ),
        ),
        SizedBox(height: 5.sp,),
        Divider(color: Colors.grey.shade300,thickness: 1,),
        SizedBox(height: 5.sp,),

      ],
    );
  }
}
