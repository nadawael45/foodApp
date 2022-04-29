import 'package:fitandfresh/presentation/dialoges/doneDialoge.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_change_txtfield.dart';
import '../widgets/custom_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangePass extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      boolAppBar:true ,
      text: 'Change Email'.tr(),prefixIcon: Icons.arrow_back,prefixFunction: ()=>Navigator.of(context).pop(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40.sp,),
            CustomChangeInfo(
              hint: 'Current Password'.tr(),
            ),
            CustomChangeInfo(
              hint: 'New Password'.tr(),
            ),
            CustomChangeInfo(
              hint: 'Confirm New Password'.tr(),
            ),
            SizedBox(height: 50.sp,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.sp),
              child: CustomButton('Submit'.tr(), (){
                showDoneDialoge(context);

              }),
            ),


          ],
        ),
      ), scaffKey: scaffoldKey,
    );
  }
}
