import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fitandfresh/constants/images.dart';
import 'package:fitandfresh/constants/screens.dart';
import 'package:fitandfresh/presentation/modules/introduction.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
   final Widget? nextScreen;

  const SplashScreen({Key? key, this.nextScreen}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  AnimatedSplashScreen(
          duration: 4000,
          splashIconSize:250 ,
          splash: Image.asset(imgLogo),
          nextScreen: nextScreen!,
          splashTransition: SplashTransition.fadeTransition,
         // pageTransitionType: PageTransitionType.scale,
          backgroundColor: Colors.white));
  }


}


