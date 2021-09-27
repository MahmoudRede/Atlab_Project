// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Modules/home_page/HomePageScreen.dart';
import 'SharedPreference/CacheHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  CacheHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.amber,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.amber,
        statusBarIconBrightness: Brightness.light,
        ),
          ),
      ),
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.ltr,
          child: HomePageScreen(),
      ),
    );
  }
}

