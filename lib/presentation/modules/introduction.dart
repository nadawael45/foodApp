import 'package:fitandfresh/presentation/widgets/custom_iconbutton.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../data/models/pageview.dart';
import '../../domain/cubit/check_language/lang_cubit.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/screens.dart';

import '../widgets/custom_text.dart';



class IntroScreen extends StatelessWidget {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  bool isArabic = false;
  String? lang;

  @override
  Widget build(BuildContext context) {
    print(context.locale.toString());

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Sizer(
      builder: (context, orientation, deviceType) =>
          Scaffold(
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                children: [

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.jumpToPage(2);
                        },
                        child: CustomText(
                          text: 'Skip',
                          txtSize: 13.sp,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      InkWell(
                        onTap: () {

                          CheckLanguageCubit.get(context).changeLangBool(context);

                        },
                        child: CustomText(
                          text: 'English',
                          txtSize: 13.sp,
                          color: Colors.lightGreen,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: h * 0.5,
                          width: w,
                          child: Center(
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return Container(
                                  height: constraints.maxHeight * 0.9,
                                  width: constraints.maxWidth,
                                  child: PageView.builder(
                                    itemCount: boardList.length,
                                    controller: controller,
                                    itemBuilder: (_, index) {
                                      return Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Container(


                                                child: Image.asset(
                                                  boardList[index].img!,
                                                  fit: BoxFit.fill,
                                                  height: orientation ==
                                                      Orientation.landscape
                                                      ? constraints.maxHeight * 0.4
                                                      : constraints.maxHeight * 0.5,
                                                  width: orientation ==
                                                      Orientation.landscape
                                                      ? constraints.maxWidth * 0.3
                                                      : constraints.maxWidth * 0.7,
                                                )),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: h * 0.08,
                                                  bottom: h * 0.025),
                                              child: CustomText(
                                                text: boardList[index].text1!,
                                                txtSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: h * 0.01),
                                              child: CustomText(
                                                text: boardList[index].text2!,
                                                txtSize: 10.sp,
                                              ),
                                            ),
                                          ]);
                                    },
                                  ),
                                );
                              },
                            ),
                          )),
                      SmoothPageIndicator(
                        controller: controller,
                        count: boardList.length,
                        effect: ExpandingDotsEffect(
                            dotHeight: 8.sp,
                            dotWidth: 8.sp,
                            activeDotColor: Colors.lightGreen
                          // strokeWidth: 5,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: h * 0.08),
                      ),
                      CustomBtnIcon(
                        width: 32.sp,
                        height: 32.sp,
                        function: () {
                          Navigator.pushNamed(context, signinpath);
                        },
                        icon: Icon(

                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        color: priGreen,
                      ),
                    ],
                  ),
                  Spacer(),

                ],
              ),
            )),
          ),
    );
  }
}
//child: Column(
//children: [
//
//Expanded(
//flex:3,
//child: Column(
//children: [
//Row(
//crossAxisAlignment: CrossAxisAlignment.start,
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
//children: [
//InkWell(
//onTap: () {
//controller.jumpToPage(2);
//},
//child: CustomText(
//text: 'Skip',
//txtSize: 13.sp,
//color: Colors.grey.shade400,
//),
//),
//InkWell(
//onTap: () {
//
//CheckLanguageCubit.get(context).changeLangBool(context);
//
//},
//child: CustomText(
//text: 'English',
//txtSize: 13.sp,
//color: Colors.lightGreen,
//),
//),
//],
//),
//Container(
//color: Colors.green,
//height: 60.h,
//width: 100.w,
//child: Center(
//child: LayoutBuilder(
//builder: (BuildContext context,
//    BoxConstraints constraints) {
//return PageView.builder(
//itemCount: boardList.length,
//controller: controller,
//itemBuilder: (_, index) {
//return Column(
//mainAxisAlignment: MainAxisAlignment.center,
//children: [
//Container(
////                                              width: 100.w,
////                                                height: 25.h,
//decoration: BoxDecoration(
//
//borderRadius: BorderRadius.circular(20),
//
//
//),
//child:CircleAvatar(
//
//backgroundImage:AssetImage(
//boardList[index].img!,
//
//
//) ,
//radius: 110,
//) ),
//Padding(
//padding: EdgeInsets.only(
//top: h * 0.08,
//bottom: h * 0.025),
//child: CustomText(
//text: boardList[index].text1!,
//txtSize: 16.sp,
//fontWeight: FontWeight.bold,
//),
//),
//CustomText(
//text: boardList[index].text2!,
//txtSize: 10.sp,
//),
//]);
//},
//);
//},
//),
//)),
//],
//),
//),
//Expanded(
//child: Container(
//width: 100.w,
//color: Colors.red,
//child: Column(
//mainAxisAlignment: MainAxisAlignment.start,
//crossAxisAlignment: CrossAxisAlignment.center,
//children: [
//
//SmoothPageIndicator(
//controller: controller,
//count: boardList.length,
//effect: ExpandingDotsEffect(
//dotHeight: 8.sp,
//dotWidth: 8.sp,
//activeDotColor: Colors.lightGreen
//// strokeWidth: 5,
//),
//),
//Padding(
//padding: EdgeInsets.only(bottom: h * 0.08),
//),
//CustomBtnIcon(
//width:32.sp ,
//height:32.sp ,
//function: () {
//Navigator.pushNamed(context, signinpath);
//},
//icon: Icon(
//Icons.arrow_forward,
//color: Colors.white,
//),
//color: priGreen,
//),
//],
//),
//),
//),
//
//],
//),

