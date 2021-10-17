import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talabatak/Componants/constants.dart';
import 'package:talabatak/Modules/LoginScreen/login_screen.dart';
import 'package:talabatak/Modules/home_page/HomePageScreen.dart';
import 'package:talabatak/SharedPreference/CacheHelper.dart';


class MainSplashScreen extends StatefulWidget {


  @override
  _MainSplashScreenState createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {

  var height=200;
  var width=200;

  // Set Time Of Splash Screen
    @override
    void initState(){
      Widget screen = LoginScreen();


          uId = CacheHelper.getData(key: 'uId') ?? '';

          if (uId.isNotEmpty) {
            screen = HomePageScreen();
          } else {
            screen = LoginScreen();
          }


      Future.delayed(Duration(seconds: 3),(){
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return screen;
        }));
      });
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
        backgroundColor: Color.fromRGBO(58, 86, 156,1),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromRGBO(58, 86, 156,1),
            statusBarIconBrightness: Brightness.light,
          ),
      ),
      body:Container(
           color: Color.fromRGBO(58, 86, 156,1),
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.018,),
              Text('طلباتك',
                style: TextStyle(
                fontSize: 45,
                fontFamily: 'Lemonada',
                fontWeight: FontWeight.bold,
                color: Colors.white

                ),),
              SizedBox(height: MediaQuery.of(context).size.height*.02,),
              Image(
                height: MediaQuery.of(context).size.height*.35,
                width: MediaQuery.of(context).size.height*.35,
                image: AssetImage('assets/images/delvery.png'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.05,),
              Text('أسرع و أمن دليفري مع طلباتك بنقربك للي يهمك',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Lemonada',
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
                  textAlign: TextAlign.center,
                ),
              SizedBox(height: MediaQuery.of(context).size.height*.13,),
              Text('يتم تسجيل بيناتك لمره واحده فقط*',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Lemonada',
                  fontWeight: FontWeight.bold,
                  color: Colors.white


                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ),
    );
  }
}
