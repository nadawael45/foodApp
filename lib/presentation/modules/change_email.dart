import 'package:fitandfresh/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_change_txtfield.dart';
class ChangeEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      boolAppBar:true ,
        prefixFunction: ()=>Navigator.of(context).pop(),
      text: 'Change Email',prefixIcon: Icons.arrow_back,

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40.sp,),
            CustomChangeInfo(
              hint: 'New Email',
            ),
            CustomChangeInfo(
              hint: 'New Password ',
            ),
            CustomChangeInfo(
              hint: 'Confirm New Password ',
            ),
            CustomChangeInfo(
              hint: 'Current Password',
            ),
            SizedBox(height: 50.sp,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.sp),
              child: CustomButton('Submit', (){

              }),
            ),


          ],
        ),
      ),
    );
  }
}