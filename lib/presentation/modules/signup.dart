
import 'package:fitandfresh/data/local/cacheHelper.dart';
import 'package:fitandfresh/domain/cubit/auth/email_auth_state.dart';
import 'package:fitandfresh/presentation/widgets/custom_button.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:fitandfresh/presentation/widgets/custom_textformfield.dart';
import 'package:fitandfresh/shared/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/user_model.dart';
import '../../domain/cubit/auth/email_auth_cubit.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/images.dart';
import '../../shared/constants/screens.dart';
import '../widgets/custom_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  IconData passIcon=Icons.visibility_off;
  bool value = false;
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();

  bool obscure=true;
  TextEditingController controllerPhone=TextEditingController();
  TextEditingController controllerName=TextEditingController();
  TextEditingController controllerPass=TextEditingController();
  TextEditingController controllerEmail=TextEditingController();


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return CustomScaffold(
      body: Padding(
        padding:  EdgeInsets.only(right:28.sp,left: 28.sp,top: 10.sp,),
        child: SingleChildScrollView(
          child:
          BlocConsumer<EmailAuthCubit,EmailAuthStates>(
            listener: (BuildContext context, Object? state)async {
              if(state is SignUpSuccess){
                CacheHelper.putString('Name', controllerName.text);
                CacheHelper.putString('Email', controllerEmail.text);

               await Navigator.of(context).popAndPushNamed(homepath);
                print('SignUpSuccess');
              }


            },
            builder: (BuildContext context, state) =>

             Form(
               key: formKey,
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
                                child: CustomText(text: 'Create New Account'.tr(),)),
                          ),

                        ],

                      )),

                  Padding(padding:  EdgeInsets.only(bottom:24.sp),),
                  CustomTextFormField(text: 'Name'.tr(),controller: controllerName,
                    validate: Validator.validateName,
                    hintText: 'Enter Your Name',prefixIcon:Icons.person,obscureTxt: false,keyBoardType: TextInputType.name,),

                  Padding(padding:  EdgeInsets.only(bottom:13.sp),),
                  CustomTextFormField(text: 'E-mail'.tr(),
                    controller: controllerEmail,
                    validate: Validator.validateEmail,
                    hintText: 'Enter Your Email'.tr(),prefixIcon:Icons.mail,obscureTxt: false,keyBoardType: TextInputType.emailAddress,),

                  Padding(padding:  EdgeInsets.only(bottom:13.sp),),
                  CustomTextFormField(hintText: 'Enter Your Phone'.tr(),
                    text: 'Phone'.tr(),
                    controller: controllerPhone,
                    validate: Validator.validatePhone,

                    countrycode:true,
                    obscureTxt: false,keyBoardType: TextInputType.phone,),

                  Padding(padding:  EdgeInsets.only(bottom:13.sp),),
                  CustomTextFormField(
                    text: 'Password'.tr(),
                    validate: Validator.validatePassword,
                    rowWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Icon(Icons.help,color: Colors.grey.shade700,)
                      ],
                    ),
                    controller: controllerPass,

                    hintText: 'Enter Your Password'.tr(),prefixIcon: Icons.lock,obscureTxt: obscure,suffixIcon: obscure?Icons.visibility_off:Icons.remove_red_eye,keyBoardType: TextInputType.visiblePassword,
                    function: (){
                      setState(() {
                        obscure=!obscure;
                      }

                      );
                      //  passIcon==Icons.visibility_off?Icons.remove_red_eye:Icons.visibility_off;

                    },),

                  Padding(padding:  EdgeInsets.only(bottom:30.sp),),
                  CustomButton('Sign up'.tr(), (){
                    if(formKey.currentState!.validate()){
                      EmailAuthCubit.get(context).signUpAuth(

                          UserModel(
                              password: controllerPass.text,

                              email: controllerEmail.text,
                              phone: controllerPhone.text,
                              name: controllerName.text



                          ),context);
//                          email: controllerEmail.text,
//                          phone: controllerPhone.text,
//                          name: controllerName.text



                    }


                  }),
                  Padding(padding:  EdgeInsets.only(bottom:10.sp),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: 'Have An Account ?  ',),
                      InkWell(onTap: (){
                        Navigator.pushNamed(context, signinpath);
                      },
                          child: CustomText(text: ' Sign In',color: priGreen,)),
                    ],),
                  Padding(padding:  EdgeInsets.only(bottom:30.sp),),








                ],
            ),
             ),
          ),
        ),
      ), scaffKey: scaffoldKey,
    );
  }
}