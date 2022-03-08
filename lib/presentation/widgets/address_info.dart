import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_button.dart';
import 'custom_textformfield.dart';
class AddressInfo extends StatelessWidget {
  String? txtBtn;

  AddressInfo({this.txtBtn});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsetsDirectional.only(start: 28.sp,end: 28.sp),
        child: Column(
          children: [
            Padding(padding:  EdgeInsets.only(bottom:24.sp),),
            CustomTextFormField(text: 'Name',
              hintText: 'Full Name',prefixIcon:Icons.person,obscureTxt: false,keyBoardType: TextInputType.name,),
            Padding(padding:  EdgeInsets.only(bottom:13.sp),),
            CustomTextFormField(hintText: 'Enter Your Phone',
              text: 'Phone',

              countrycode:true,
              obscureTxt: false,keyBoardType: TextInputType.phone,),

            Padding(padding:  EdgeInsets.only(bottom:13.sp),),
            CustomTextFormField(text: 'location',
              hintText: 'Search For Location',prefixIcon:Icons.location_on,obscureTxt: false,
            ),

            Padding(padding:  EdgeInsets.only(bottom:13.sp),),
            CustomTextFormField(text: 'Street',
              hintText: 'Street Name',prefixIcon:Icons.location_city,obscureTxt: false,keyBoardType: TextInputType.name,),

            Padding(padding:  EdgeInsets.only(bottom:13.sp),),
            CustomTextFormField(text: 'Special Mark',
              hintText: 'Something Close To You',prefixIcon:Icons.flag,obscureTxt: false,keyBoardType: TextInputType.name,),

            Padding(padding:  EdgeInsets.only(bottom:30.sp),),
            CustomButton(txtBtn, (){
            }),
            Padding(padding:  EdgeInsets.only(bottom:30.sp),),

          ],
        ),
      ),
    );
  }
}
