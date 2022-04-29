import 'package:fitandfresh/presentation/widgets/bmr_custom.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'custom_button.dart';
import 'custom_scaffold.dart';
import '../../shared/constants/colors.dart';
class BMR extends StatefulWidget {
  @override
  State<BMR> createState() => _BMRState();
}

class _BMRState extends State<BMR> {
  var grRadio;
  bool visible=false;
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

  var bmr;
bool isMale=false;
  TextEditingController controllerKG=TextEditingController();
  TextEditingController controllerAGE=TextEditingController();
  TextEditingController controllerCM=TextEditingController();

  GlobalKey<FormState> keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
        boolAppBar: true,
        text: 'BMR',
        prefixIcon: Icons.arrow_back,
        prefixFunction: () {
          Navigator.of(context).pop();
        },


        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(18.sp),
            child: Column(
              children: [
                CustomBmr(
                  text:('Gender:').tr() ,
                  icon: Icons.transgender,
                  widget: Column(children: [
                    Row(
                      children: [
                        Radio(
                          materialTapTargetSize:  MaterialTapTargetSize.shrinkWrap,
                            activeColor: priGreen,
                            value: 1, groupValue: grRadio, onChanged: (v){
                          setState(() {
                            grRadio=v;
                            isMale=true;
                          });
                          bmr='';


                        }),
                        Padding(
                          padding:  EdgeInsetsDirectional.only(end: 7.sp),
                          child: CustomText(text: 'Male',fontWeight: FontWeight.bold,),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(activeColor: priGreen,materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            value: 2, groupValue: grRadio, onChanged: (v){
                          setState(() {
                            grRadio=v;
                            isMale=false;
                          });
                          bmr='';


                            }),
                        CustomText(text: 'Female',fontWeight: FontWeight.bold,)
                      ],
                    ),
                  ],),
                ),
                CustomBmr(
                  text:('Height:').tr() ,
                  icon: Icons.height,
                  widget: TextFieldBMR(
                    textUnit: 'cm',
                    controller: controllerCM,

                  ),
                ),
                CustomBmr(
                  text:('Weight:').tr() ,
                  icon: Icons.monitor_weight,
                  widget: TextFieldBMR(
                    textUnit: 'kg',
                    controller: controllerKG,

                  ),
                ),
                CustomBmr(
                  text:('Age:').tr() ,
                  icon: Icons.calendar_today,
                  widget: TextFieldBMR(
                    textUnit: 'Year',
                    controller: controllerAGE,

                  ),
                ),
                Visibility(
                  visible: visible,
                  child: Column(
                    children: [
                      CustomText(text: 'your daily need of calories is :',),
                      SizedBox(height: 8.sp,),
                      CustomText(text: bmr.toString()==null?'':bmr.toString(),fontWeight: FontWeight.bold,color: priGreen,),
                      SizedBox(height: 18.sp,),


                    ],
                  ),
                ),

                CustomButton('Calculate', (){
                  setState(() {
                    visible=true;
                  });
                  isMale?
                  bmr=88.362 + (13.397 * double.parse(controllerKG.text)) + (4.799 * int.parse(controllerCM.text)) - (5.677 * int.parse(controllerAGE.text))
                          :
                  bmr= 447.593 + (9.247 * double.parse(controllerKG.text)) + (3.098 * int.parse(controllerCM.text)) - (4.330 * int.parse(controllerAGE.text));

                }),
              ],
            ),
          ),
        ), scaffKey: scaffoldKey,
      ),
    );
  }
}
