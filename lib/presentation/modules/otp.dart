import 'package:fitandfresh/domain/cubit/auth/phone_auth_cubit.dart';
import 'package:flutter/material.dart';

import 'package:fitandfresh/presentation/widgets/custom_button.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import '../../domain/cubit/auth/phone_auth_state.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/images.dart';
import '../../shared/constants/screens.dart';
import '../widgets/custom_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';

class OtpScreen extends StatelessWidget {

  String? userPhone;

  OtpScreen(this.userPhone);
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

  TextEditingController controllerOtp=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.only(
          right: 28.sp,
          left: 28.sp,
          top: 10.sp,
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child:
            BlocConsumer<PhoneAuthCubit, PhoneAuthStates>(
              listener: (BuildContext context, Object? state) {
                if(state is OtpSuccess){
                  print('done');
                  Fluttertoast.showToast(msg: 'done'.tr());
                  Navigator.popAndPushNamed(context, homepath);

                }


              },
              builder: (BuildContext context, state) =>
                  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackButton(color: Colors.black,),
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
                        top: h * 0.25,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Container(
                                child: CustomText(
                              text: 'Verify Phone'.tr(),
                            )),
                          ),
                        ),
                      ),
                    ],
                  )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 11.sp),
                  ),
                  Center(
                      child: CustomText(
                        text: 'Code Is Sent To'.tr()+userPhone!,color: Colors.grey,
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 21.sp),
                  ),

                  PinCodeTextField(
                    length: 6,
                   mainAxisAlignment: MainAxisAlignment.center,
                   controller: controllerOtp,

                   animationType: AnimationType.none,
                    cursorColor: priGreen,
                    keyboardType: TextInputType.number,
                    autoFocus: true,
                    textStyle: GoogleFonts.tajawal(fontWeight: FontWeight.normal,fontSize: 15.sp),
                    pinTheme: PinTheme(
                      fieldOuterPadding: EdgeInsets.all(2.sp),
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 37.sp,
                      fieldWidth: 30.sp,


                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      errorBorderColor: priGreen,
                      selectedColor: priGreen,
                      disabledColor: priGreen,
                      inactiveColor: priGreen,


                    ),
                    animationDuration: Duration(milliseconds: 500),
                    backgroundColor: Colors.white,
                    enableActiveFill: true,
                    //errorAnimationController: errorController,
                   // controller: textEditingController,

                    onChanged: (value) {
                      print(value);
//                  setState(() {
//                    currentText = value;
//                  });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste".tr()+ " $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    }, appContext: context,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 21.sp),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: 'Don\'t Receive Code ?'.tr(),color: Colors.grey,),
                      InkWell(onTap: (){
                        PhoneAuthCubit.get(context).phoneAuth(userPhone!);


                      },
                          child: CustomText(text: ' Resend Code'.tr(),color: Colors.black,)),
                    ],),
                  Padding(
                    padding: EdgeInsets.only(bottom: h*0.125),
                  ),
                  CustomButton('Verify And Create Account'.tr(), () {
                    PhoneAuthCubit.get(context).submitCode(controllerOtp.text);
                  }),
                ],
              ),
            ),
          ),
        ),
      ), scaffKey: scaffoldKey,
    );
  }
}
