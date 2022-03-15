
import 'package:fitandfresh/domain/cubit/auth/email_auth_state.dart';
import 'package:fitandfresh/presentation/widgets/custom_button.dart';
import 'package:fitandfresh/presentation/widgets/custom_text.dart';
import 'package:fitandfresh/presentation/widgets/custom_textformfield.dart';
import 'package:fitandfresh/shared/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/user_model.dart';
import '../../data/repository/user_data.dart';
import '../../domain/cubit/auth/email_auth_cubit.dart';
import '../../shared/constants/colors.dart';
import '../../shared/constants/images.dart';
import '../../shared/constants/screens.dart';
import '../widgets/custom_scaffold.dart';
class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  IconData passIcon=Icons.visibility_off;
  bool value = false;
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

  bool obscure=true;
  TextEditingController controllerPhone=TextEditingController();
  TextEditingController controllerName=TextEditingController();
  TextEditingController controllerPass=TextEditingController();
  TextEditingController controllerEmail=TextEditingController();

  UserData userData=UserData();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return CustomScaffold(
      body: Padding(
        padding:  EdgeInsets.only(right:28.sp,left: 28.sp,top: 10.sp,),
        child: SingleChildScrollView(
          child:
          BlocConsumer<EmailAuthCubit,EmailAuthStates>(
            listener: (BuildContext context, Object? state)async {
              if(state is SignUpSuccess){
               await userData.setUserData(UserModel(
                    email: controllerEmail.text,
                    location:location,
                    phone: controllerPhone.text,
                    name: controllerName.text



                ));

                Navigator.of(context).pushNamed(homepath);
                print('SignUpSuccess');
              }


            },
            builder: (BuildContext context, state) =>

             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(

                          imgLogo,
                          height: h * 0.3,
                          width: w * 0.5,
                        ),

                        Positioned(
                          top: h*0.25,
                          child: Container(
                              child: CustomText(text: 'Create New Account',)),
                        ),

                      ],

                    )),

                Padding(padding:  EdgeInsets.only(bottom:24.sp),),
                CustomTextFormField(text: 'Name',controller: controllerName,
                  //validate: Validator.validateName(controllerName.text),
                  hintText: 'Enter Your Name',prefixIcon:Icons.person,obscureTxt: false,keyBoardType: TextInputType.name,),

                Padding(padding:  EdgeInsets.only(bottom:13.sp),),
                CustomTextFormField(text: 'Email',
                  controller: controllerEmail,
                 // validate: Validator.validateEmail(controllerEmail.text),
                  hintText: 'Enter Your Email',prefixIcon:Icons.mail,obscureTxt: false,keyBoardType: TextInputType.emailAddress,),

                Padding(padding:  EdgeInsets.only(bottom:13.sp),),
                CustomTextFormField(hintText: 'Enter Your Phone',
                  text: 'Phone',
                  controller: controllerPhone,
                //  validate: Validator.validatePhone(controllerPhone.text),

                  countrycode:true,
                  obscureTxt: false,keyBoardType: TextInputType.phone,),

                Padding(padding:  EdgeInsets.only(bottom:13.sp),),
                CustomTextFormField(
                  text: 'Password',
                  //validate: Validator.validatePassword(controllerPass.text),
                  rowWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      Icon(Icons.help,color: Colors.grey.shade700,)
                    ],
                  ),
                  controller: controllerPass,
                  hintText: 'Enter Your Password',prefixIcon: Icons.lock,obscureTxt: obscure,suffixIcon: obscure?Icons.visibility_off:Icons.remove_red_eye,keyBoardType: TextInputType.visiblePassword,
                  function: (){
                    setState(() {
                      obscure=!obscure;
                    }

                    );
                    //  passIcon==Icons.visibility_off?Icons.remove_red_eye:Icons.visibility_off;

                  },),

                Padding(padding:  EdgeInsets.only(bottom:30.sp),),
                CustomButton('Sign up', (){
                  EmailAuthCubit.get(context).SignUpAuth(email: controllerEmail.text,
                     password: controllerPass.text,
                     phone: controllerPhone.text,
                    name: controllerName.text



                  );
                }),
                Padding(padding:  EdgeInsets.only(bottom:10.sp),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'Have An Account ?  ',color: Colors.black,),
                    InkWell(onTap: (){
                      Navigator.pushNamed(context, signinpath);
                    },
                        child: CustomText(text: ' Sign In',color: priGreen,)),
                  ],),
                Padding(padding:  EdgeInsets.only(bottom:30.sp),),








              ],
            ),
          ),
        ),
      ),
    );
  }
}