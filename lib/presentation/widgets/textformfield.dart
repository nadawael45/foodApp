import 'package:fitandfresh/constants/colors.dart';
import 'package:fitandfresh/domain/countrycode.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class CustomTextFormField extends StatefulWidget {
  var prefixIcon;
  var suffixIcon;
  String? hintText;
  bool? obscureTxt;
  bool autoFocus;
  var keyBoardType;
  var onSaved;
  var controller;
  var validate;
  var function;
  var onTap;
  bool countrycode;

  CustomTextFormField({this.prefixIcon, this.suffixIcon, this.hintText,this.controller,this.onTap,
      this.obscureTxt, this.onSaved, this.validate,this.function,this.keyBoardType,this.countrycode=false,this.autoFocus=false});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureTxt!,
      //validator: widget.validate,
      onTap: widget.countrycode?widget.onTap:(){},
      onSaved:widget.onSaved ,
      controller: widget.controller,
//    focusNode: FocusScope.of(context).unfocus();,
      autofocus:widget.autoFocus ,
      readOnly:  widget.countrycode?true:false,
      keyboardType: widget.keyBoardType,
      decoration: InputDecoration(
       // labelText: widget.countrycode?widget.countryName!:'',

        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 3.0,),
          borderRadius: BorderRadius.circular(10),


        ) ,
        prefixIcon:widget.countrycode? CountryCode(): Icon(widget.prefixIcon,),
       suffixIcon: InkWell(onTap: widget.function,
           child: Icon(widget.suffixIcon,color: Colors.grey.shade400,)),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.tajawal(
          color: priGrey,
          fontSize: 11.sp,





        )),



    );
  }
}
