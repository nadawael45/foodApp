import 'package:fitandfresh/domain/cubit/auth/email_auth_cubit.dart';
import 'package:fitandfresh/domain/cubit/auth/email_auth_state.dart';
import 'package:fitandfresh/domain/cubit/dark_mode/dark_cubit.dart';
import 'package:fitandfresh/domain/cubit/dark_mode/dark_state.dart';
import 'package:fitandfresh/presentation/dialoges/langDialogue.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../data/local/cacheHelper.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/images.dart';
import '../../shared/constants/screens.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/custom_setting_listtile.dart';


class Setting extends StatelessWidget {
  //bool status= false;
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {


    return CustomScaffold(
      boolAppBar:true ,
        text: 'Settings'.tr(),prefixIcon: Icons.arrow_back,
        prefixFunction: ()=>Navigator.of(context).popAndPushNamed(homepath),

      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 18.sp,),

          CircleAvatar(radius: 50,backgroundImage: AssetImage(imgLogo,),backgroundColor: Theme.of(context).backgroundColor,),
          SizedBox(height: 18.sp,),
          CustomText(text: 'Nada wael',fontWeight: FontWeight.bold,),
          CustomText(text: 'Nsdawael45@gmail.com',color: Colors.grey,txtSize: 9.sp,),
          SizedBox(height: 20.sp,),

          SettingListTile(title: 'Account Information'.tr(),function: ()=>Navigator.pushNamed(context, accountInfo),),
          SettingListTile(title: 'Address Information'.tr(),function: ()=>Navigator.pushNamed(context, addressInfo),),
          SettingListTile(title: 'Language'.tr(),function:()=> showDialoge(context),),
          SettingListTile(title: 'Recalculate Bmr'.tr(),function: ()=>Navigator.pushNamed(context, bmr),),

             SettingListTile(title: 'Dark Mode'.tr(),widget:

             BlocConsumer<DarkModeCubit,DarkModeState>(
              listener: (BuildContext context, state) {

              },
              builder: (BuildContext context, Object? state) {

                return FlutterSwitch(
                  width: 50.sp,
                  height: 22.sp,
                  toggleSize: 22.0,
                  value: CacheHelper.getBool('isDark')
                  ,
                  borderRadius: 30.0,
                  activeColor: priGreen,
                  onToggle: (val) {
                    DarkModeCubit.get(context).changeMode();
                     CacheHelper.putBool('isDark',val);

                      //DarkModeCubit.get(context).isDark = val;


                  }
                  ,);
              },

            ),),

          BlocListener<EmailAuthCubit,EmailAuthStates>(
            listener: (BuildContext context, state) {
              if(state is SignOut){
                Navigator.pushNamedAndRemoveUntil(context, signuppath, (route) => false);
              }
            },
            child: Row
              (
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsetsDirectional.only(start: 12.sp),
                  child: InkWell(onTap: (){
                    EmailAuthCubit.get(context).signOut();

                  },
                      child: CustomText(text: 'Log Out'.tr(),)),
                ),
              ],
            ),
          ),

        ],),
      ), scaffKey: scaffoldKey,
      //Spacer()
    );
  }
}
