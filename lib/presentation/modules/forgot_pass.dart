import 'package:fitandfresh/domain/cubit/auth/email_auth_cubit.dart';
import 'package:fitandfresh/domain/cubit/auth/email_auth_state.dart';
import 'package:fitandfresh/presentation/widgets/custom_scaffold.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:fitandfresh/presentation/widgets/custom_textformfield.dart';
import 'package:fitandfresh/shared/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/screens.dart';
import '../widgets/custom_button.dart';
class ForgotPass extends StatelessWidget {
  TextEditingController controllerCountry=TextEditingController();
  TextEditingController controllerEmail=TextEditingController();
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return
      BlocListener<EmailAuthCubit,EmailAuthStates>(
        listener: (BuildContext context, state) {
          if(state is CodePassSuccess){
            Navigator.of(context).popAndPushNamed(signinpath);
          }
        },
        child: CustomScaffold(

          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(16.sp),
              child: Column(
                children: [
                  SizedBox(height: 30.sp,),

                  Container(
                    height: 60.sp,
                    width: 60.sp,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.sp,

                      ),
                      borderRadius: BorderRadius.circular(60)
                    ),
                    child: Icon(Icons.lock_outline,size: 30.sp,),
                  ),
                  SizedBox(height: 12.sp,),

                  CustomText(text: 'Trouble Logging In ?'.tr(),fontWeight: FontWeight.bold,),
                  SizedBox(height: 12.sp,),
                  CustomText(text: 'enter your email or phone and we\'ll send \n'
                      'you a link to get get back into  your account'.tr(),),
                  SizedBox(height: 12.sp,),
                  Form(
                    key: formKey,
                    child: DefaultTabController(
                      length: 2,

                      child: Column(
                        children: [
                          TabBar(

                              labelColor: Colors.black,
                              indicatorPadding: EdgeInsets.symmetric(horizontal: 20.sp),
                              indicatorColor: Colors.black,
                              unselectedLabelColor: priGrey,
                              labelPadding: EdgeInsets.all(5.sp),
                              tabs: [
                            CustomText(text: 'E-mail'.tr(),fontWeight: FontWeight.bold),
                            CustomText(text: 'Phone'.tr(),fontWeight: FontWeight.bold),

                          ]),
                          Container(
                            width: 100.w,
                            height: 70.sp,
                            child: TabBarView(children: [
                              CustomTextFormField(text: '',controller: controllerEmail,
                                validate: Validator.validateEmail,

                                hintText: 'Enter Your Email'.tr(),prefixIcon:Icons.mail,keyBoardType: TextInputType.emailAddress,),

                              CustomTextFormField(
                                text: '',
                                readonly: false,
                                validate: Validator.validatePhone,

                                hintText:'Enter Your Phone Number'.tr(),
                                countrycode: true,

                                controller: controllerCountry,
                                keyBoardType: TextInputType.phone,
                              ),


                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.sp,),

                  CustomButton('Next'.tr(),(){
                    EmailAuthCubit.get(context).forgetPass(controllerEmail.text);
                  }),
                 SizedBox(height: 12.sp,),
                 CustomText(text: 'Need More Help ?'.tr(),fontWeight: FontWeight.bold,color: priGreen,)


    ],
              ),
            ),
          ), scaffKey: scaffoldKey,
        ),
      );
  }
}
