import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/Modules/home_page/HomePageScreen.dart';

class DoneOrder extends StatefulWidget {
  const DoneOrder({Key? key}) : super(key: key);

  @override
  State<DoneOrder> createState() => _DoneOrderState();
}

class _DoneOrderState extends State<DoneOrder> {

  @override
  void initState(){
    Future.delayed(Duration(seconds: 2),(){
      navigateAndRemove(context: context, widget: HomePageScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/orderdone.jpg'),
            )
        ),
      ),
    );
  }
}
