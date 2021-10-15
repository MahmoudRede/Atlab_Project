import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoneOrder extends StatelessWidget {
  const DoneOrder({Key? key}) : super(key: key);

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
