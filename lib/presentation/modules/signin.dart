import 'package:device_preview/device_preview.dart';
import 'package:fitandfresh/data/local/cacheHelper.dart';
import 'package:fitandfresh/shared/validator.dart';
import '../../domain/cubit/auth/email_auth_cubit.dart';
import '../../domain/cubit/auth/email_auth_state.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/images.dart';

import 'package:fitandfresh/presentation/widgets/custom_button.dart';
import 'package:fitandfresh/presentation/widgets/custom_iconbutton.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:fitandfresh/presentation/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../shared/constants/screens.dart';
import '../widgets/custom_scaffold.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  IconData passIcon=Icons.visibility_off;
  bool value = false;
  bool obscure=true;

  TextEditingController controllerPass=TextEditingController();
  TextEditingController controllerEmail=TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

   GlobalKey<FormState> formKey =  GlobalKey<FormState>();

Validator validator=Validator();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return CustomScaffold(
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
                            child: CustomText(text: 'Sign In To Continue',)),
                      ),

                    ],

                  )),

              BlocConsumer<EmailAuthCubit,EmailAuthStates>(
                listener: (BuildContext context, state) {
                  if(state is SignInSuccess){
                    Navigator.of(context).popAndPushNamed(homepath);

                    print('SigninSuccess');
                  }
                },
                builder: (BuildContext context, Object? state) =>

                    Form(
                      key: formKey,
                      child:
                      Column(
                        children: [
                          Padding(padding:  EdgeInsets.only(bottom:24.sp),),
                          CustomTextFormField(text: 'E-mail'.tr(),controller: controllerEmail,
                            validate:
                              Validator.validateEmail,

                            hintText: 'Enter Your Email'.tr(),prefixIcon:Icons.mail,obscureTxt: false,keyBoardType: TextInputType.emailAddress,),

                          Padding(padding:  EdgeInsets.only(bottom:13.sp),),
                          CustomTextFormField(text: 'Password'.tr(),controller: controllerPass,
                          validate:
                            Validator.validatePassword,

                  hintText: 'Enter Your Password'.tr(),prefixIcon: Icons.lock,obscureTxt: obscure,suffixIcon: obscure?Icons.visibility_off:Icons.remove_red_eye,keyBoardType: TextInputType.visiblePassword,
                  function: (){
                  setState(() {
                          obscure=!obscure;
                  }

                  );
                //  passIcon==Icons.visibility_off?Icons.remove_red_eye:Icons.visibility_off;

                  },),
                        ],
                      ),
                    ),
              ),

              Padding(padding:  EdgeInsets.only(bottom:8.sp),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Checkbox(
                      fillColor: MaterialStateProperty.all(priGrey),
                      focusColor: priGreen,
                        value: value, onChanged: (bool){setState(() {

                      value=bool!;
                    });}),
                    CustomText(text: 'Remember me'.tr(),color: Colors.grey,)

                  ],),
                  InkWell(onTap: (){
                    Navigator.of(context).pushNamed(forgotpass);
                  },
                      child: CustomText(text: 'Forgot Password?',fontWeight: FontWeight.bold,color: priGreen,))
              ],),

              Padding(padding:  EdgeInsets.only(bottom:10.sp),),
              CustomButton('Login'.tr(), (){
                if(formKey.currentState!.validate()){
                  print(value);
                  if(value==true){
                    CacheHelper.putBool('rememberMe', true);
                  }
                  EmailAuthCubit.get(context).signInAuth(controllerEmail.text, controllerPass.text);

                }

              }),
              Padding(padding:  EdgeInsets.only(bottom:13.sp),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CustomText(text: 'Don\'t Have An Account ?  ',),
                InkWell(onTap: (){
                  Navigator.pushNamed(context, signuppath);

                },
                    child: CustomText(text: ' Sign Up'.tr(),color: priGreen,)),
              ],),
              Padding(padding:  EdgeInsets.only(bottom:14.sp),),
              AnotherAuth(),





            ],
          ),
        ),
      ), scaffKey: scaffoldKey,
    );
  }
}

class AnotherAuth extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(line,width: w*0.3,),
          Padding(
            padding:  EdgeInsets.only(right: 8.sp,left: 8.sp),
            child: CustomText(text: 'OR'.tr(),fontWeight: FontWeight.bold,color: priGrey,),
          ),
          SvgPicture.asset(line,width: w*0.3,),


        ],
      ),
      Padding(padding:  EdgeInsets.only(bottom:18.sp),),
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(right: 16.sp),
            child: CustomBtnIcon(
              width: 40.sp,
              height: 40.sp,
              icon:Padding(
                padding:  EdgeInsets.all(8.0),
                child: SvgPicture.asset(google,color: Colors.white),
              ) ,color: Colors.red,),
          ),
          Padding(
            padding:  EdgeInsets.only(right: 16.sp),
            child: CustomBtnIcon(
              width: 40.sp,
              height: 40.sp,
              icon:Icon(Icons.facebook,color: Colors.white,size: 35.sp,) ,color: Colors.blue,),
          ),
          Padding(
            padding:  EdgeInsets.only(right: 16.sp),
            child: CustomBtnIcon(
              width: 40.sp,
              height: 40.sp,
              icon:Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(apple,color: Colors.white,),
              ) ,color: Colors.black,),
          ),
          CustomBtnIcon(
            width: 40.sp,
            height: 40.sp,
            icon:Icon(Icons.call,color: Colors.white,size: 30.sp,) ,color: Colors.green,function: (){
            Navigator.pushNamed(context, callpath);
          },),

        ],),


      SizedBox(height: 20.sp,)
    ],);
  }
}
