import 'package:fitandfresh/shared/validator.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_button.dart';
import 'custom_textformfield.dart';
class AddressInfo extends StatelessWidget {
  String? txtBtn;
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerLocation = TextEditingController();
  TextEditingController controllerStreet = TextEditingController();
  TextEditingController controllerMark = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  AddressInfo({this.txtBtn});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsetsDirectional.only(start: 28.sp,end: 28.sp),
        child: Column(
          children: [
            Padding(padding:  EdgeInsets.only(bottom:24.sp),),
            CustomTextFormField(text: 'Name',validate: Validator.validateName(controllerName.text),controller: controllerName,
              hintText: 'Full Name',prefixIcon:Icons.person,obscureTxt: false,keyBoardType: TextInputType.name,),

            Padding(padding:  EdgeInsets.only(bottom:13.sp),),
            CustomTextFormField(hintText: 'Enter Your Phone',
              text: 'Phone',
              validate: Validator.validatePhone(controllerPhone.text),controller: controllerPhone,
              countrycode:true,
              obscureTxt: false,keyBoardType: TextInputType.phone,),

            Padding(padding:  EdgeInsets.only(bottom:13.sp),),
            CustomTextFormField(text: 'location',
              validate: Validator.validateEmpty(controllerLocation.text),controller: controllerLocation,
              hintText: 'Search For Location',prefixIcon:Icons.location_on,obscureTxt: false,
            ),

            Padding(padding:  EdgeInsets.only(bottom:13.sp),),
            CustomTextFormField(text: 'Street',controller: controllerStreet,validate: Validator.validateEmpty(controllerStreet.text),
              hintText: 'Street Name',prefixIcon:Icons.location_city,obscureTxt: false,keyBoardType: TextInputType.name,),

            Padding(padding:  EdgeInsets.only(bottom:13.sp),),
            CustomTextFormField(text: 'Special Mark',validate: Validator.validateEmpty(controllerMark.text),controller: controllerMark,
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
