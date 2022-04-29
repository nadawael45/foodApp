import 'package:fitandfresh/shared/validator.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_button.dart';
import 'custom_textformfield.dart';
class AddressInfo extends StatelessWidget {
  String? txtBtn;
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  TextEditingController? controllerPhone ;
  TextEditingController? controllerLocation  ;
  TextEditingController? controllerStreet ;
  TextEditingController? controllerMark ;
  TextEditingController? controllerName ;
  var function;

  AddressInfo({ this.txtBtn,  this.controllerPhone, this.controllerLocation,
       this.controllerStreet, this.controllerMark, this.controllerName, this.function});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsetsDirectional.only(start: 28.sp,end: 28.sp),
        child: Form(
          key: formKey,
          child:


          Column(
            children: [
              Padding(padding:  EdgeInsets.only(bottom:24.sp),),
              CustomTextFormField(text: 'Name',
                validate: Validator.validateName,
                controller: controllerName,
                hintText: 'Full Name',prefixIcon:Icons.person,obscureTxt: false,keyBoardType: TextInputType.name,),

              Padding(padding:  EdgeInsets.only(bottom:13.sp),),
              CustomTextFormField(hintText: 'Enter Your Phone',
                text: 'Phone',
                validate: Validator.validatePhone,controller: controllerPhone,
                countrycode:true,
                obscureTxt: false,keyBoardType: TextInputType.phone,),

              Padding(padding:  EdgeInsets.only(bottom:13.sp),),
              CustomTextFormField(text: 'location',
                validate: Validator.validateEmpty,controller: controllerLocation,
                hintText: 'Search For Location',prefixIcon:Icons.location_on,obscureTxt: false,
              ),

              Padding(padding:  EdgeInsets.only(bottom:13.sp),),
              CustomTextFormField(text: 'Street',controller: controllerStreet,validate: Validator.validateEmpty,
                hintText: 'Street Name',prefixIcon:Icons.location_city,obscureTxt: false,keyBoardType: TextInputType.name,),

              Padding(padding:  EdgeInsets.only(bottom:13.sp),),
              CustomTextFormField(text: 'Special Mark',validate: Validator.validateEmpty,controller: controllerMark,
                hintText: 'Something Close To You',prefixIcon:Icons.flag,obscureTxt: false,keyBoardType: TextInputType.name,),

              Padding(padding:  EdgeInsets.only(bottom:30.sp),),
              CustomButton(txtBtn, function
//                      (){
//                if(formKey.currentState!.validate()){}
             // }
              ),
              Padding(padding:  EdgeInsets.only(bottom:30.sp),),

            ],
          ),
        ),
      ),
    );
  }
}
