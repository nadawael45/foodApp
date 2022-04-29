import 'package:fitandfresh/shared/constants/images.dart';
import 'package:fitandfresh/domain/cubit/auth/phone_auth_cubit.dart';
import 'package:fitandfresh/domain/cubit/auth/phone_auth_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fitandfresh/presentation/modules/otp.dart';
import 'package:fitandfresh/domain/provider/countryProv.dart';
import 'package:flutter/material.dart';
import 'package:fitandfresh/presentation/widgets/custom_button.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:fitandfresh/presentation/widgets/custom_textformfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../shared/validator.dart';
import '../widgets/custom_scaffold.dart';

class CallScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

  GlobalKey<FormState> keyform = GlobalKey<FormState>();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerCountry = TextEditingController();

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

            child:
          SingleChildScrollView(
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
                        height:h* 0.3,
                        width: w* 0.5,
                      ),

                    Positioned(
                      top: h * 0.25,
                      child: Container(
                          child: CustomText(
                        text: 'Continue With Phone Number'.tr(),
                      )),
                    ),
                  ],
                )),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.sp),
                ),
                BlocConsumer<PhoneAuthCubit, PhoneAuthStates>(
                  listener: (BuildContext context, Object? state) {
                    if(state is PhoneAuthSuccess){
                      print('done');
                      Fluttertoast.showToast(msg: 'done');
                    //  Navigator.pushNamed(context, otppath);
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>OtpScreen(getFullNumber(context, controllerPhone.text))));

                          }
                    if(state is OtpLoading){
                      print('otpload');
                    }
                    if(state is PhoneAuthLoading){
                      print('phoneload');
                    }
                  },
                  builder: (BuildContext context, state) => Form(
                      key: keyform,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CustomTextFormField(
                              text: 'Country'.tr(),
                              readonly: true,

                              hintText:'|  '+'${Provider.of<CountryProv>(context).countryName==null?'مصر':Provider.of<CountryProv>(context).countryName
                              }',
                            countrycode: true,
                            controller: controllerCountry,
                            obscureTxt: false,
                            keyBoardType: TextInputType.phone,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 13.sp),
                          ),

                          CustomTextFormField(
                            validate: Validator.validatePhone,
                            text: 'Phone Number'.tr(),
                            hintText: 'Enter Your Phone Number'.tr(),
                            prefixIcon: Icons.call,
                            obscureTxt: false,
                            controller: controllerPhone,
                            autoFocus: true,
                            keyBoardType: TextInputType.phone,
                          ),


                        ],
                      )
                  ),

                ),
                Padding(
                  padding:  EdgeInsets.only(top: 20.sp,bottom: 10.sp),
                  child: CustomButton('Continue'.tr(), () {
                //    Navigator.push(context, MaterialPageRoute(builder: (_)=>OtpScreen(getFullNumber(context, controllerPhone.text))));
                    if(keyform.currentState!.validate()){
                      PhoneAuthCubit.get(context).phoneAuth(
                          getFullNumber(context, controllerPhone.text));
                    }




                  }),
                ),
              ],
            ),
          ),

      ), scaffKey: scaffoldKey,
    );
  }
}
  getFullNumber(BuildContext context,String phone){
  String code=
  Provider.of<CountryProv>(context,listen: false).countryCode==null?'+20':Provider.of<CountryProv>(context,listen: false).countryCode!;

  return code+phone;

}