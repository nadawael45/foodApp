import 'package:fitandfresh/constants/colors.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class CustomButton extends StatelessWidget {
  String? text;
  var function;

  CustomButton(this.text, this.function);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: MediaQuery.of(context).size.width,
           height: 35.sp,
           decoration: BoxDecoration(
             color: priGreen,
             borderRadius: BorderRadius.circular(10),

           ),
          child: Center(
            child: CustomText(text: text,fontWeight: FontWeight.bold,color: Colors.white,
            ),
          )),
    );
  }
}
