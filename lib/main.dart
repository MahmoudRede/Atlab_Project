// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/constants.dart';
import 'package:talabatak/Modules/DoneOrder/DoneOrder.dart';
import 'package:talabatak/Modules/ItemScreen/itemScreen.dart';
import 'package:talabatak/Modules/LoginScreen/login_screen.dart';
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
  Widget widget;

  // if(CacheHelper.getData(key: 'uId') != null)
  //   {
  //     uId = CacheHelper.getData(key: 'uId');
  //   }
  // else
  //   widget = LoginScreen();

  widget = LoginScreen();

  // if (uId != null) {
  //   widget = HomePageScreen();
  // } else {
  //   widget = LoginScreen();
  // }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
        BlocProvider(
        create: (BuildContext context) =>AppCubit()..getItemKafrShaben(resName: 'كل المطاعم')..getItemKafrShobak(resName: 'كل المطاعم')..getShbinRestaurantDetails(resName: 'كل المطاعم')..getTahaRestaurantDetails(resName: 'كل المطاعم')..createDatabase()..getPizzaBola()..getHatyeEltakya()..getFishAbuMarim()..getKoshryHamada()..getWings()..getOrder(),
          child: BlocConsumer<AppCubit,AppStates>(
            listener: (context,state){},
            builder: (context,state)=>MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                elevation: 0.0,
                backgroundColor: Color.fromRGBO(58, 86, 156,1),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor:Color.fromRGBO(58, 86, 156,1),
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: Directionality(
              textDirection: TextDirection.ltr,
              child: MainSplashScreen(),
            ),
          ),
        ),

    );
  }
}

