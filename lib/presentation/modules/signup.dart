import 'package:device_preview/device_preview.dart';
import 'package:fitandfresh/app_routes.dart';
import 'package:fitandfresh/constants/colors.dart';
import 'package:fitandfresh/constants/screens.dart';
import 'package:fitandfresh/presentation/widgets/button.dart';
import 'package:fitandfresh/presentation/widgets/iconbutton.dart';
import 'package:fitandfresh/presentation/widgets/text.dart';
import 'package:fitandfresh/presentation/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/images.dart';
import 'package:country_code_picker/country_code_picker.dart';
class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  IconData passIcon=Icons.visibility_off;
  bool value = false;

  bool obscure=true;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.only(right:28.sp,left: 28.sp,top: 10.sp,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(

                        imgLogo,
                        height: h * 0.3,
                        width: w * 0.5,
                      ),

                      Positioned(
                        top: h*0.25,
                        child: Container(
                            child: CustomText(text: 'Create New Account',)),
                      ),

                    ],

                  )),
              Padding(padding:  EdgeInsets.only(bottom:24.sp),),
              CustomText(text: 'Name',),
              Padding(padding:  EdgeInsets.only(bottom:8.sp),),
              CustomTextFormField(hintText: 'Enter Your Name',prefixIcon:Icons.person,obscureTxt: false,keyBoardType: TextInputType.name,),
              Padding(padding:  EdgeInsets.only(bottom:13.sp),),
              CustomText(text: 'Email',),
              Padding(padding:  EdgeInsets.only(bottom:8.sp),),
              CustomTextFormField(hintText: 'Enter Your Email',prefixIcon:Icons.mail,obscureTxt: false,keyBoardType: TextInputType.emailAddress,),
              Padding(padding:  EdgeInsets.only(bottom:13.sp),),
              CustomText(text: 'Phone',),
              Padding(padding:  EdgeInsets.only(bottom:8.sp),),
              CustomTextFormField(hintText: 'Enter Your Phone',

                countrycode:true,
                obscureTxt: false,keyBoardType: TextInputType.phone,),
              Padding(padding:  EdgeInsets.only(bottom:13.sp),),
              Row(

                children: [
                  CustomText(text: 'Password',),
                  Spacer(),
                  Icon(Icons.help,color: Colors.grey.shade700,)
                ],
              ),
              Padding(padding:  EdgeInsets.only(bottom:8.sp),),
              CustomTextFormField(hintText: 'Enter Your Password',prefixIcon: Icons.lock,obscureTxt: obscure,suffixIcon: obscure?Icons.visibility_off:Icons.remove_red_eye,keyBoardType: TextInputType.visiblePassword,
                function: (){
                  setState(() {
                    obscure=!obscure;
                  }

                  );
                  //  passIcon==Icons.visibility_off?Icons.remove_red_eye:Icons.visibility_off;

                },),
              Padding(padding:  EdgeInsets.only(bottom:30.sp),),
              CustomButton('Sign up', (){}),
              Padding(padding:  EdgeInsets.only(bottom:10.sp),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: 'Have An Account ?  ',color: Colors.black,),
                  InkWell(onTap: (){
                    Navigator.pushNamed(context, signinpath);
                  },
                      child: CustomText(text: ' Sign In',color: priGreen,)),
                ],),
              Padding(padding:  EdgeInsets.only(bottom:14.sp),),








            ],
          ),
        ),
      ),
    );
  }
}