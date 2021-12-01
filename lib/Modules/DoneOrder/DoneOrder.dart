import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talabatak/Componants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class DoneOrder extends StatefulWidget {
  const DoneOrder({Key? key}) : super(key: key);

  @override
  _DoneOrderState createState() => _DoneOrderState();
}

class _DoneOrderState extends State<DoneOrder> {


  // Set Time Of Splash Screen
  @override
  void initState(){

    Future.delayed(Duration(seconds: 2),(){
      void launchWhatsapp(
          String ?number,
          String ?message,
          )async{

        String url= "whatsapp://send?phone=$number&text=$message";

        await canLaunch(url) ? launch(url) : print('Can\'t open whatsapp');


      }
      if(valueOfOrder=='1')
      {
        launchWhatsapp("+201016257980", "شكرا لختيارك طلباتك (سوبر ماركت) ,اضغط ارسال لاتمام الطلب");

      }
      else if(valueOfOrder=='2')
      {
        launchWhatsapp("+201016257980", "شكرا لختيارك طلباتك (صيدليات) ,اضغط ارسال لاتمام الطلب");

      }
      else if(valueOfOrder=='3')
      {
        launchWhatsapp("+201016257980", "شكرا لختيارك طلباتك (طلبات سوق) ,اضغط ارسال لاتمام الطلب");

      }
      else if(valueOfOrder=='4')
      {
        launchWhatsapp("+201016257980", "شكرا لختيارك طلباتك (طلب اخر) ,اضغط ارسال لاتمام الطلب");

      }
      else if(valueOfOrder=='5')
      {
        launchWhatsapp("+201016257980", "شكرا لختيارك طلباتك (مطاعم) ,اضغط ارسال لاتمام الطلب");

      }
      else if(valueOfOrder=='6')
      {
        launchWhatsapp("+201016257980", "شكرا لختيارك طلباتك (توصيل طلبات) ,اضغط ارسال لاتمام الطلب");

      }
      // navigateAndRemove(context: context, widget: screen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:Colors.orange,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Image(
              image: AssetImage('assets/images/newImage.jpeg'),
            ),
          ],
        )
      ),
    );
  }
}
