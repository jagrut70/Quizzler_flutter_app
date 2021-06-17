import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'screen/welcomeScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
void main() {
  runApp(
    Myapp(),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Center(
          child: AnimatedSplashScreen(
            duration: 3000,
            splash: Image.asset('images/splash.png',
            height: 100,
            width: 100,),
            splashTransition: SplashTransition.fadeTransition,
            nextScreen: welcomeScreen(),
          ),
        ),
    );
  }
}