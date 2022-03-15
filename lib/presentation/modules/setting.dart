import 'package:fitandfresh/domain/cubit/dark_mode/dark_cubit.dart';
import 'package:fitandfresh/domain/cubit/dark_mode/dark_state.dart';
import 'package:fitandfresh/presentation/dialoges/langDialogue.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../shared/constants/colors.dart';
import '../../shared/constants/images.dart';
import '../../shared/constants/screens.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/custom_setting_listtile.dart';
class Setting extends StatefulWidget {
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool status= false;

  @override
  Widget build(BuildContext context) {


    return CustomScaffold(
      boolAppBar:true ,
        text: 'Settings',prefixIcon: Icons.arrow_back,
        prefixFunction: ()=>Navigator.of(context).pop(),

      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 18.sp,),

          CircleAvatar(radius: 50,backgroundImage: AssetImage(imgLogo,),backgroundColor: Theme.of(context).backgroundColor,),
          SizedBox(height: 18.sp,),
          CustomText(text: 'Nada wael',fontWeight: FontWeight.bold,),
          CustomText(text: 'Nsdawael45@gmail.com',color: Colors.grey,txtSize: 9.sp,),
          SizedBox(height: 20.sp,),

          SettingListTile(title: 'Account Information',function: ()=>Navigator.pushNamed(context, accountInfo),),
          SettingListTile(title: 'Address Information ',function: ()=>Navigator.pushNamed(context, addressInfo),),
          SettingListTile(title: 'Language',function:()=> showDialoge(context),),
          SettingListTile(title: 'Recalculate Bmr ',function: ()=>Navigator.pushNamed(context, bmr),),

             SettingListTile(title: 'Dark Mode ',widget:
            FlutterSwitch(
                width: 50.sp,
                height: 22.sp,
                toggleSize: 22.0,
                value: status,
                borderRadius: 30.0,
               activeColor: priGreen,
                onToggle: (val) {
                  DarkModeCubit.get(context).changeMode();
                  //status = DarkModeCubit.get(context).isDark;
                 // print(status);
                  setState(() {
                    status = val;
                  });

                }
              ,),),

          Row
            (
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsetsDirectional.only(start: 12.sp),
                child: CustomText(text: 'Log Out',),
              ),
            ],
          ),

        ],),
      ),
      //Spacer()
    );
  }
}
