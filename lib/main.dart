import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talabatak/home_page/HomePageScreen.dart';
import 'package:talabatak/splash/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
                ),
          ),
      ),

      debugShowCheckedModeBanner: false,
      home: MainSplashScreen(),
    );
  }
}

