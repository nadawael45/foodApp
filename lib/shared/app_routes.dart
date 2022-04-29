import 'package:fitandfresh/data/local/cacheHelper.dart';
import 'package:fitandfresh/presentation/modules/acount_info.dart';
import 'package:fitandfresh/presentation/modules/addressInfoScreen.dart';
import 'package:fitandfresh/presentation/modules/call.dart';
import 'package:fitandfresh/presentation/modules/change_email.dart';
import 'package:fitandfresh/presentation/modules/change_password.dart';
import 'package:fitandfresh/presentation/modules/forgot_pass.dart';
import 'package:fitandfresh/presentation/modules/home.dart';
import 'package:fitandfresh/presentation/modules/home_page.dart';
import 'package:fitandfresh/presentation/modules/introduction.dart';
import 'package:fitandfresh/presentation/modules/location_screen.dart';
import 'package:fitandfresh/presentation/modules/myorders.dart';
import 'package:fitandfresh/presentation/modules/confirm_order.dart';
import 'package:fitandfresh/presentation/modules/signin.dart';
import 'package:fitandfresh/presentation/modules/signup.dart';
import 'package:fitandfresh/presentation/modules/splash.dart';
import 'package:fitandfresh/presentation/widgets/bmr.dart';
import 'package:fitandfresh/shared/constants/screens.dart';
import 'package:flutter/material.dart';
import '../presentation/modules/see_all.dart';



class AppRoutes{
var a;
var b;
  Route? onGenerateRoutes(RouteSettings routeSettings){
    switch(routeSettings.name){
      case splashpath:
      return MaterialPageRoute(builder: (_){
       bool onBoard=CacheHelper.getBool('onBoard');
       bool remember=CacheHelper.getBool('rememberMe');

       if(onBoard){
      if(remember){
        return SplashScreen(nextScreen:HomeScreen() ,);

      }else {
        return SplashScreen(nextScreen: SignIn(),);
      }
    }else{
      return SplashScreen(nextScreen:IntroScreen() ,);

    }
      });

      case intropath:

          return MaterialPageRoute(builder: (_)=>IntroScreen());

      case signinpath:
        return MaterialPageRoute(builder: (_)=>SignIn());
      case signuppath:
        return MaterialPageRoute(builder: (_)=>SignUp());
      case callpath:
        return MaterialPageRoute(builder: (_)=>CallScreen());
      case homepath:
        return MaterialPageRoute(builder: (_)=>HomeScreen());
//      case orderDetails:
//        return MaterialPageRoute(builder: (_)=>ConfermOrder());
      case addressInfo:
        return MaterialPageRoute(builder: (_)=>AddressInfoScreen());
      case bmr:
        return MaterialPageRoute(builder: (_)=>BMR());

      case accountInfo:
        return MaterialPageRoute(builder: (_)=>AcountInfoScreen());
      case changeEmail:
        return MaterialPageRoute(builder: (_)=>ChangeEmail());
      case changePass:
        return MaterialPageRoute(builder: (_)=>ChangePass());
      case myOrder:
        return MaterialPageRoute(builder: (_)=>MyOrders());
      case location:
        return MaterialPageRoute(builder: (_)=>LocationScreen());
      case forgotpass:
        return MaterialPageRoute(builder: (_)=>ForgotPass());
      case forgotpass:
        return MaterialPageRoute(builder: (_)=>ForgotPass());
      case seeAll:
        return MaterialPageRoute(builder: (_)=>SeeAll());
    }
  }
}
