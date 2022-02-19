import 'package:flutter/material.dart';
import 'package:fitandfresh/constants/colors.dart';
import 'package:fitandfresh/constants/screens.dart';
import 'package:fitandfresh/presentation/widgets/button.dart';
import 'package:fitandfresh/presentation/widgets/iconbutton.dart';
import 'package:fitandfresh/presentation/widgets/text.dart';
import 'package:fitandfresh/presentation/widgets/textformfield.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/images.dart';
import '../../provider/countryProv.dart';
class CallScreen extends StatelessWidget {
  TextEditingController? countryNameText;

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
                            child: CustomText(text: 'Continue With Phone Number',)),
                      ),

                    ],

                  )),
              Padding(padding:  EdgeInsets.only(bottom:24.sp),),
              Form(

                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                CustomText(text:Provider.of<CountryProv>(context).countryName==null?'Country': '${Provider.of<CountryProv>(context).countryName}',),
                Padding(padding:  EdgeInsets.only(bottom:8.sp),),
                CustomTextFormField(

                  countrycode:true,

//                  onTap: (){
//
//                    countryNameText!.text=
//                    Provider.of<CountryProv>(context).countryName==null?'':
//                    '${Provider.of<CountryProv>(context).countryName}';
//                    print(countryNameText!.text);
//                    print('${Provider.of<CountryProv>(context).countryName}');
//
//                  }  ,
                 controller:countryNameText ,
                  obscureTxt: false,keyBoardType: TextInputType.phone,), Padding(padding:  EdgeInsets.only(bottom:13.sp),),
                CustomText(text: 'Phone Number',),
                Padding(padding:  EdgeInsets.only(bottom:8.sp),),
                CustomTextFormField(
                  hintText: 'Enter Your Phone Nummber',prefixIcon: Icons.call,obscureTxt: false,autoFocus: true,keyBoardType: TextInputType.phone,),
              ],)),

              Padding(padding:  EdgeInsets.only(bottom:10.sp),),
              CustomButton('Continue', (){
                Navigator.pushNamed(context, otppath);
              }),

                ],),










          ),
        ),

    );
  }
}
