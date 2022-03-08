import 'package:fitandfresh/constants/colors.dart';
import 'package:fitandfresh/constants/screens.dart';
import 'package:fitandfresh/data/models/drawer_model.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../constants/images.dart';
import 'feedbackDialoge.dart';
class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<DrawerModel>drawerList=[
      DrawerModel(icon: Icons.home, title: 'Home', function: ()=>Navigator.of(context).pop() ),
      DrawerModel(icon: Icons.shopping_cart, title: 'My Orders', function: (){
        //Navigator.of(context).pop();
        Navigator.of(context).popAndPushNamed(myOrder);
    }
          ),
      DrawerModel(icon: Icons.call, title: 'About Us', function: ()=>Navigator.pop ),
      DrawerModel(icon: Icons.feedback, title: 'Send FeedBack', function: ()=>showFeedbackDialoge(context) ),
      DrawerModel(icon: Icons.share, title: 'Share this app', function: ()=>Navigator.pop ),

    ];
    return Container(
      width: 50.w,
      child: Drawer(

        child:
        Padding(
          padding:  EdgeInsetsDirectional.only(start: 8.sp),
          child: Column(children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 5.sp),
              child: CircleAvatar(radius: 45,backgroundImage: AssetImage(imgLogo,),backgroundColor: Theme.of(context).backgroundColor,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(bottom: 20.sp),
                  child: CustomText(text: 'Hello\nNada Wael',fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,txtSize: 14.sp,),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: drawerList.length,
                itemBuilder: (BuildContext context, int index)=>
                    Padding(
                      padding: EdgeInsetsDirectional.only(bottom: 13.sp),
                      child: InkWell(
                        onTap:
                          drawerList[index].function,

                        child: Row(children: [
                  Icon(drawerList[index].icon,color: priGreen,),
                  SizedBox(width: 7.sp,),
                  CustomText(
                        text: drawerList[index].title
                        ,txtSize: 12.sp
                  ),


                ],),
                      ),
                    ),
              ),
            )
          ],),
        ),


      ),
    );
  }
}
