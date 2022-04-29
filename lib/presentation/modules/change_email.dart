import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitandfresh/data/local/cacheHelper.dart';
import 'package:fitandfresh/domain/cubit/auth/email_auth_cubit.dart';
import 'package:fitandfresh/domain/cubit/pregress_hud/progress_cubit.dart';
import 'package:fitandfresh/domain/cubit/pregress_hud/progress_states.dart';
import 'package:fitandfresh/presentation/widgets/custom_button.dart';
import 'package:fitandfresh/presentation/widgets/custom_change_txtfield.dart';
import 'package:fitandfresh/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../domain/cubit/auth/email_auth_state.dart';
import '../../shared/constants/screens.dart';
import '../../shared/validator.dart';
class ChangeEmail extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  TextEditingController controllerCurrentPass=TextEditingController();
  TextEditingController controllerConfirmNewPass=TextEditingController();
  TextEditingController controllerNewPass=TextEditingController();
  TextEditingController controllerNewEmail=TextEditingController();
var loading=false;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    print('nnnnnnnnnnnnnnnnnnnnnnnnnn');
    auth.currentUser!.reload();
    print(auth.currentUser!.uid.toString());
    return BlocBuilder<EmailAuthCubit,EmailAuthStates>(

      builder: (BuildContext context, state) {
        if(state is ChangeAuthLoading){
         loading= ProgressHudCubit.get(context).showProgress();

        }else{
          loading= ProgressHudCubit.get(context).dismissProgress();

        }

        if(state is ChangeAuthSuccess){
          CacheHelper.putString('Email', controllerNewEmail.text);
          // Navigator.of(context).pushNamed(signinpath);


        }

       return  CustomScaffold(
          progressHud: loading,
          boolAppBar:true ,
          prefixFunction: ()=>Navigator.of(context).pop(),
          text: 'Change Email'.tr(),prefixIcon: Icons.arrow_back,

          body: SingleChildScrollView(
            child: Form(
              key:formKey ,
              child: Column(
                children: [
                  SizedBox(height: 40.sp,),
                  CustomChangeInfo(
                    hint: 'New Email'.tr(),
                    controller: controllerNewEmail,
                    validate: Validator.validateEmail,

                  ),
                  CustomChangeInfo(
                    hint: 'New Password'.tr(),
                    controller: controllerNewPass,
                    validate: Validator.validatePassword,

                  ),
                  CustomChangeInfo(
                    hint: 'Confirm New Password'.tr(),
                    controller: controllerConfirmNewPass,
                    validate: Validator.validatePassword,

                  ),
                  CustomChangeInfo(
                    hint: 'Current Password'.tr(),
                    controller: controllerCurrentPass,
                    validate: Validator.validatePassword,

                  ),
                  SizedBox(height: 50.sp,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                    child: CustomButton('Submit'.tr(), (){
                      if(formKey.currentState!.validate()&&controllerNewPass.text==controllerConfirmNewPass.text){

                        var currentEmail=CacheHelper.getString('Email');
                        EmailAuthCubit.get(context).changeEmailAndPass(
                          currentEmail:currentEmail ,
                          currentPassword: controllerCurrentPass.text,
                          newEmail:controllerNewEmail.text ,
                          newPassword: controllerNewPass.text,

                        );
                      }

               // Navigator.of(context).pushNamed(signinpath);

                    }),
                  ),


                ],
              ),
            ),
          ), scaffKey: scaffoldKey,
        );

      },
    );
  }
}