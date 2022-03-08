import 'dart:ui';

import 'package:fitandfresh/data/repository/lang.dart';
import 'package:fitandfresh/domain/cubit/check_language/lang_state.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../constants/colors.dart';
import '../../domain/cubit/check_language/lang_cubit.dart';
class LangDialoge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckLanguageCubit,CheckLanguageState>(
      listener: (BuildContext context, state) {
        if(state is ArabicLanguage){
          CheckLanguageCubit.get(context).isArabic = true;
        }else{
          CheckLanguageCubit.get(context).isArabic = false;

        }
      },
      builder: (BuildContext context, Object? state)=>
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
         child: SimpleDialog(
          title: CustomText(text: ('Language').tr(),),
          children: [
            SimpleDialogOption(
              onPressed: (){
                  CheckLanguageCubit.get(context).changeLangBool(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  CustomText(text: ('English').tr(),),

                  CheckLanguageCubit.get(context).isArabic==false?Icon(Icons.done,color: priGreen,):SizedBox(),
                ],
              ),
            ),
            Divider(color: Colors.grey.shade400,indent: 15.sp,endIndent: 15.sp,thickness: 1,),
            SimpleDialogOption(
              onPressed: (){
                CheckLanguageCubit.get(context).changeLangBool(context);
              },
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: ('Arabic').tr(),),
                  CheckLanguageCubit.get(context).isArabic?Icon(Icons.done,color: priGreen,):SizedBox(),

                ],
              ),
            ),

          ],

          ),
       ),
    );


  }
}
showDialoge(BuildContext context){
  showDialog(context:context,builder: (builder)=> LangDialoge() );
}

