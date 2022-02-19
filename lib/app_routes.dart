import 'package:fitandfresh/constants/screens.dart';
import 'package:fitandfresh/presentation/modules/call.dart';
import 'package:fitandfresh/presentation/modules/introduction.dart';
import 'package:fitandfresh/presentation/modules/otp.dart';
import 'package:fitandfresh/presentation/modules/signin.dart';
import 'package:fitandfresh/presentation/modules/signup.dart';
import 'package:fitandfresh/presentation/modules/splash.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  Route? onGenerateRoutes(RouteSettings routeSettings){
    switch(routeSettings.name){
      case splashpath:
      return MaterialPageRoute(builder: (_)=>SplashScreen(nextScreen: IntroScreen(),));
      case intropath:
        return MaterialPageRoute(builder: (_)=>IntroScreen());
      case signinpath:
        return MaterialPageRoute(builder: (_)=>SignIn());
      case signuppath:
        return MaterialPageRoute(builder: (_)=>SignUp());
      case callpath:
        return MaterialPageRoute(builder: (_)=>CallScreen());
      case otppath:
        return MaterialPageRoute(builder: (_)=>OtpScreen());
    }
  }
}