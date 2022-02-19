import 'package:fitandfresh/constants/colors.dart';
import 'package:fitandfresh/presentation/widgets/iconbutton.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../constants/screens.dart';
import '../../data/models/pageview.dart';
import '../widgets/text.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);


  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
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
                    onTap: (){
                      controller.jumpToPage(2);
                    },
                    child: CustomText(
                      text: 'Skip',
                      txtSize: 13.sp,
                      color: Colors.grey.shade400,
                    ),
                  ),CustomText(
                    text: 'عربي',
                    txtSize: 13.sp,
                    color: Colors.lightGreen,
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    height:h*0.5,
                    width: w,
                    child: Center(
                      child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints) {
                          return Container(
                            height:constraints.maxHeight*0.9,
                            width: constraints.maxWidth,
                                          child: PageView.builder(
                      itemCount: boardList.length,
                      controller: controller,
                      itemBuilder: (_, index) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              ClipOval(
                                  child: Image.asset(boardList[index].img!,
                                      fit: BoxFit.fill,
                                    height: orientation == Orientation.landscape?constraints.maxHeight*0.3:constraints.maxHeight*0.5,
                                    width: orientation == Orientation.landscape?constraints.maxWidth*0.1:constraints.maxWidth*0.6,

                                  )),
                              Padding(
                                padding: EdgeInsets.only(top:h*0.08,bottom: h*0.025),
                                child: CustomText(
                                  text: boardList[index].text1!,
                                  txtSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom:h*0.01),
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
                    )

                  ),

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
                    padding: EdgeInsets.only( bottom: h*0.08),
                  ),
                  CustomBtnIcon(function:(){
                    Navigator.pushNamed(context, signinpath);
                  } ,
                    icon: Icon(Icons.arrow_forward,color: Colors.white,) ,color: priGreen,),


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
