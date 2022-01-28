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

    Future.delayed(Duration(seconds: 1),(){
      void launchWhatsapp(
          String ?number,
          String ?message,
          )async{

        String url= "whatsapp://send?phone=$number&text=$message";

        await canLaunch(url) ? launch(url) : print('Can\'t open whatsapp');


      }
      if(valueOfOrder=='1')
      {
        launchWhatsapp("+201123780390", "شكرا لختيارك اطلب (سوبر ماركت) ,اضغط ارسال لاتمام الطلب");

      }
      else if(valueOfOrder=='2')
      {
        launchWhatsapp("+201123780390", "شكرا لختيارك اطلب (صيدليات) ,اضغط ارسال لاتمام الطلب");

      }
      else if(valueOfOrder=='3')
      {
        launchWhatsapp("+201123780390", "شكرا لختيارك اطلب (طلبات سوق) ,اضغط ارسال لاتمام الطلب");

      }
      else if(valueOfOrder=='4')
      {
        launchWhatsapp("+201123780390", "شكرا لختيارك اطلب (طلب اخر) ,اضغط ارسال لاتمام الطلب");

      }
      else if(valueOfOrder=='5')
      {
        launchWhatsapp("+201123780390", "شكرا لختيارك اطلب (مطاعم) ,اضغط ارسال لاتمام الطلب");

      }
      else if(valueOfOrder=='6')
      {
        launchWhatsapp("+201123780390", "شكرا لختيارك اطلب (توصيل طلبات) ,اضغط ارسال لاتمام الطلب");

      }
      // navigateAndRemove(context: context, widget: screen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:Colors.blueAccent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 150,),
            Image(
              image: NetworkImage('https://image.freepik.com/free-vector/delivery-service-with-masks-concept_52683-36955.jpg'),
            ),
          ],
        )
      ),
    );
  }
}
