import 'dart:ui';
import 'package:sizer/sizer.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/constants/colors.dart';
class FeedBackDialoge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        width: double.infinity,
        child: SimpleDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 8.sp),
          alignment: AlignmentDirectional.bottomStart,
          backgroundColor: Color(0xFFF5F5F5).withOpacity(0.86),
          title: Column(
            children: [
              CustomText(text: '+201095553356',txtSize: 12.sp,),
              Divider(),

            ],
          ),
          children: [
            SimpleDialogOption(
              onPressed: ()=>makeSms(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                CustomText(text: 'Send Message',color: priGreen,),
                Divider()
              ],),
            ),
            SimpleDialogOption(
              onPressed: ()=>makePhoneCall(),
              child: Column(children: [
                CustomText(text: 'Start Voice Call',color: priGreen),
                Divider()
              ],),
            ),
            SimpleDialogOption(
              onPressed: ()=>Navigator.of(context).pop(),

              child:
              CustomText(text: 'Cancel',color: priGreen),

            ),

          ],

        ),
      ),
    );
  }
}
showFeedbackDialoge(BuildContext context){
  showDialog(context:context,builder: (builder)=> FeedBackDialoge() );
}

Future<void> makePhoneCall() async {
   Uri launchUri = Uri(
    scheme: 'tel',
    path: '+201095553356',
  );
  await launch(launchUri.toString());
}

Future<void> makeSms() async {
  Uri launchUri = Uri(
    scheme: 'smsto',
    path: '+201095553356',
  );
  await launch(launchUri.toString());
}