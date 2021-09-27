import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talabatak/Modules/LoginScreen/login_screen.dart';


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
      Future.delayed(Duration(seconds: 3),(){
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return LoginScreen();
        }));
      });
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.02,),
              Text('طلباتك',
                style: TextStyle(
                fontSize: 45,
                fontFamily: 'Lemonada',
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: MediaQuery.of(context).size.height*.02,),
              Image(
                height: MediaQuery.of(context).size.height*.35,
                width: MediaQuery.of(context).size.height*.35,
                image: AssetImage('assets/images/delivery.jpg'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.05,),
              Text('أسرع و أمن دليفري مع طلباتك بنقربك للي يهمك',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Lemonada',
                    fontWeight: FontWeight.bold
                ),
                  textAlign: TextAlign.center,
                ),
              SizedBox(height: MediaQuery.of(context).size.height*.13,),
              Text('يتم تسجيل بيناتك لمره واحده فقط*',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Lemonada',
                  fontWeight: FontWeight.bold

              ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ),
      ),
    );
  }
}
