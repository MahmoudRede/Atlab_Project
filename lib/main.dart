// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Modules/ItemScreen/itemScreen.dart';
import 'package:talabatak/Modules/ProfileScreen/profileScreen.dart';
import 'package:talabatak/Modules/RegisterScreen/RegisterCubit/cubit.dart';
import 'package:talabatak/Modules/splash/SplashScreen.dart';
import 'package:talabatak/talabatak_bloc/cubit.dart';
import 'package:talabatak/talabatak_bloc/states.dart';
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
    return
        BlocProvider(
        create: (BuildContext context) =>AppCubit()..getItemKafrShaben(resName: 'كل المطاعم')..getItemKafrShobak(resName: 'كل المطاعم'),
          child: BlocConsumer<AppCubit,AppStates>(
            listener: (context,state){},
            builder: (context,state)=>MaterialApp(
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
          ),
        ),

    );
  }
}

