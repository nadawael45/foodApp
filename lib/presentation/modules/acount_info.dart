import 'package:fitandfresh/data/local/cacheHelper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../shared/constants/images.dart';
import '../../shared/constants/screens.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/custom_setting_listtile.dart';
import '../widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';

class AcountInfoScreen extends StatefulWidget {
  @override
  State<AcountInfoScreen> createState() => _AcountInfoScreenState();
}

class _AcountInfoScreenState extends State<AcountInfoScreen> {
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

  bool isMale = true;
  var btnColor;
  var name=CacheHelper.getString('Name');
  var email=CacheHelper.getString('Email');
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      boolAppBar: true,
      text: 'Account Info'.tr(),
      prefixFunction: ()=>Navigator.of(context).pop(),
      prefixIcon: Icons.arrow_back,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 18.sp,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                imgLogo,
              ),
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            SizedBox(
              height: 15.sp,
            ),
            CustomText(
              text: 'Change profile picture'.tr(),
              color: Colors.grey,
              txtSize: 10.sp,
            ),
            SizedBox(

              height: 20.sp,

            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 10.sp),
                  child: CustomText(
                    text: 'E-mail'.tr(),
                    color: Colors.grey,
                    txtSize: 8.sp,
                  ),
                ),
                SettingListTile(
                  title: email,
                  widget: SizedBox(),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 10.sp),
                  child: CustomText(
                    text: 'First Name'.tr(),
                    color: Colors.grey,
                    txtSize: 8.sp,
                  ),
                ),
                SettingListTile(
                  title: name,
                  widget: SizedBox(),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 10.sp),
                  child: CustomText(
                    text: 'Last Name'.tr(),
                    color: Colors.grey,
                    txtSize: 8.sp,
                  ),
                ),
                SettingListTile(
                  title: name,
                  widget: SizedBox(),
                ),
              ],
            ),
            SettingListTile(
              title: 'Change E-mail'.tr(),
              function: () => Navigator.pushNamed(context, changeEmail),
            ),
            SettingListTile(
              title: 'Change Password'.tr(),
              function: () => Navigator.pushNamed(context, changePass),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: 18.sp, left: 18.sp, top: 13.sp, bottom: 13.sp),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.sp),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                isMale = !isMale;
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor: isMale
                                    ? MaterialStateProperty.all(
                                        Theme.of(context).backgroundColor)
                                    : MaterialStateProperty.all(
                                        Colors.grey[400]),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            child: CustomText(
                              text: ("Male").tr(),
                              color: Colors.black,
                            )),
                      ),
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                isMale = !isMale;
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor: isMale == false
                                    ? MaterialStateProperty.all(
                                        Theme.of(context).backgroundColor)
                                    : MaterialStateProperty.all(
                                        Colors.grey[400]),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            child: CustomText(
                                text: 'Female'.tr(), color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ), scaffKey: scaffoldKey,
    );
  }
}
