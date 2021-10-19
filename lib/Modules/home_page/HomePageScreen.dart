import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/Componants/constants.dart';
import 'package:talabatak/Models/RestaurantModel.dart';
import 'package:talabatak/Models/itemModel.dart';
import 'package:talabatak/Modules/ItemScreen/itemScreen.dart';
import 'package:talabatak/Modules/LoginScreen/login_screen.dart';
import 'package:talabatak/Modules/MenuScreen/MenuScreen.dart';
import 'package:talabatak/Modules/ProfileScreen/profileScreen.dart';
import 'package:talabatak/Modules/UserBasket/UserBasket.dart';
import 'package:talabatak/SharedPreference/CacheHelper.dart';
import 'package:talabatak/talabatak_bloc/cubit.dart';
import 'package:talabatak/talabatak_bloc/states.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';



String ?areaName='كل المناطق';
String ?restaurantName='كل المطاعم';

class Items_Drawer{
  String ?text;
  IconData ?icon;
  Function ?function;


  Items_Drawer(this.text, this.icon, this.function);
}

void launchWhatsapp(
    String ?number,
    String ?message,
    )async{

  String url= "whatsapp://send?phone=$number&text=$message";

  await canLaunch(url) ? launch(url) : print('Can\'t open whatsapp');

}


class HomePageScreen extends StatefulWidget {


  // This function is triggered when the floating button is pressed



  // This will check the connection at the beginning


  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {


    @override
    void initState() {
      AppCubit.get(context).checkInternetConnection();
      super.initState();
    }
    List <Items_Drawer> Items=[
      Items_Drawer(
          'المطاعم',
          Icons.home,
          (){
            navigateAndRemove(context: context, widget:HomePageScreen());
          }
      ),
      Items_Drawer(
          'الحساب الشخصي',
          Icons.person,
              (){
                AppCubit.get(context).getUser(context);
              }
      ),
      Items_Drawer(
          'السله',
          Icons.add_shopping_cart,
              (){
                navigateTo(context: context, widget: UserBasket());
           }
      ),
      Items_Drawer(
          'عنواني',
          Icons.location_on,
              (){
                print('عنواني');
          }
      ),
      Items_Drawer(
          'الرسائل',
          Icons.chat,
              (){
                launchWhatsapp("+201123780390", "");
                },
      ),
      Items_Drawer(
          'الاعدادات',
          Icons.settings,
              (){
                showToast(text: 'سيتم أضافتها قريبا...', state: ToastState.WARNING);
          }
      ),
      Items_Drawer(
          'الخصوصيه والامان',
          Icons.security,
              (){
            showToast(text: 'سيتم أضافتها قريبا...', state: ToastState.WARNING);
            },
      ),
      Items_Drawer(
          'تسجيل الخروج',
          Icons.logout,
              (){
            CacheHelper.removeData(key: 'uId');
            uId = '';
            navigateAndRemove(context: context, widget:LoginScreen());
          }
      ),
    ];

    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return  Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                backgroundColor: Colors.grey[200],
                appBar: AppBar(
                  title: Row(
                    children: [
                      Text('طلباتك',style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Lemonada',

                      ),)
                    ],
                  ),
                ),
                body:   AppCubit.get(context).isConnected==false? Container(
                  color: Colors.white,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Image(
                         fit: BoxFit.cover,
                         image: AssetImage( "assets/images/noInternet.jpg",
                     )),
                   ],
                 ),
                ):Container(
                  child: Column(
                    children: [
                      Container(
                        color: Color.fromRGBO(58, 86, 156,1),
                        margin: EdgeInsets.only(
                          bottom: 5.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10.0,
                            top: 10.0,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'نوع المنطقه',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                  Expanded(
                                    child: Text(
                                      'نوع المطعم',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(width: 20,),

                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Center(
                                        child: DropdownButton(
                                          dropdownColor: Colors.black87,
                                          style: TextStyle(
                                              color: Colors.white,

                                              fontSize: 17
                                          ),
                                          icon: Icon(Icons.arrow_drop_down_sharp,color: Colors.white,),
                                          underline: Container(
                                            color: Colors.white,
                                          ),
                                          value: AppCubit.get(context).selectedarea,
                                          items: AppCubit.get(context).Areas.map((item) {
                                            return DropdownMenuItem(
                                              child: Text(item),
                                              value: item,
                                              onTap: (){
                                                areaName=item.toString();

                                                if(item=='كل المناطق' ){

                                                  if(restaurantName=='اسماك' ){

                                                    AppCubit.get(context).getItemKafrShaben(resName: 'اسماك');
                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'اسماك');
                                                    AppCubit.get(context).getItemKafrShobak(resName: 'اسماك');
                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'اسماك');

                                                  }

                                                  else if(restaurantName=='مشويات'){

                                                    AppCubit.get(context).getItemKafrShaben(resName: 'مشويات');
                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'مشويات');
                                                    AppCubit.get(context).getItemKafrShobak(resName: 'مشويات');
                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'مشويات');

                                                  }

                                                  else if(restaurantName=='كل الفئات'){



                                                    AppCubit.get(context).getItemKafrShaben(resName: 'كل الفئات');
                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'كل الفئات');
                                                    AppCubit.get(context).getItemKafrShobak(resName: 'كل الفئات');
                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'كل الفئات');

                                                  }

                                                  else if(restaurantName=='كشري و طواجن'){


                                                    AppCubit.get(context).getItemKafrShaben(resName: 'كشري و طواجن');
                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'كشري و طواجن');
                                                    AppCubit.get(context).getItemKafrShobak(resName: 'كشري و طواجن');
                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'كشري و طواجن');

                                                  }

                                                  else if(restaurantName=='كل المطاعم'){


                                                    AppCubit.get(context).getItemKafrShaben(resName: 'كل المطاعم');
                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'كل المطاعم');
                                                    AppCubit.get(context).getItemKafrShobak(resName: 'كل المطاعم');
                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'كل المطاعم');

                                                  }

                                                  else if(restaurantName=='بيتزا'){


                                                    AppCubit.get(context).getItemKafrShaben(resName: 'بيتزا');
                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'بيتزا');
                                                    AppCubit.get(context).getItemKafrShobak(resName: 'بيتزا');
                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'بيتزا');

                                                  }

                                                  else if(restaurantName=='Restaurant'){

                                                    AppCubit.get(context).getItemKafrShaben(resName: 'Restaurant');
                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'Restaurant');
                                                    AppCubit.get(context).getItemKafrShobak(resName: 'Restaurant');
                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'Restaurant');

                                                  }

                                                  else if(restaurantName=='لحوم و خضروات'){

                                                    AppCubit.get(context).getItemKafrShaben(resName: 'لحوم و خضروات');
                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'لحوم و خضروات');
                                                    AppCubit.get(context).getItemKafrShobak(resName: 'لحوم و خضروات');
                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'لحوم و خضروات');

                                                  }


                                                  else if(restaurantName=='كريب/سوري'){


                                                    AppCubit.get(context).getItemKafrShaben(resName: 'كريب/سوري');
                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'كريب/سوري');
                                                    AppCubit.get(context).getItemKafrShobak(resName: 'كريب/سوري');
                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'كريب/سوري');



                                                  }

                                                  else{
                                                    print('Error');
                                                  }


                                                }

                                                else if(item=='كفر شبين' ){

                                                  if(restaurantName=='اسماك' ){

                                                    AppCubit.get(context).getItemKafrShaben(resName: 'اسماك');

                                                  }

                                                  else if(restaurantName=='مشويات'){

                                                    AppCubit.get(context).getItemKafrShaben(resName: 'مشويات');

                                                  }

                                                  else if(restaurantName=='كل الفئات'){

                                                    AppCubit.get(context).getItemKafrShaben(resName: 'كل الفئات');

                                                  }

                                                  else if(restaurantName=='كشري و طواجن'){


                                                    AppCubit.get(context).getItemKafrShaben(resName: 'كشري و طواجن');


                                                  }

                                                  else if(restaurantName=='كل المطاعم'){


                                                    AppCubit.get(context).getItemKafrShaben(resName: 'كل المطاعم');


                                                  }

                                                  else if(restaurantName=='بيتزا'){


                                                    AppCubit.get(context).getItemKafrShaben(resName: 'بيتزا');


                                                  }

                                                  else if(restaurantName=='Restaurant'){

                                                    AppCubit.get(context).getItemKafrShaben(resName: 'Restaurant');


                                                  }

                                                  else if(restaurantName=='لحوم و خضروات'){

                                                    AppCubit.get(context).getItemKafrShaben(resName: 'لحوم و خضروات');


                                                  }

                                                  else if(restaurantName=='كريب/سوري'){


                                                    AppCubit.get(context).getItemKafrShaben(resName: 'كريب/سوري');



                                                  }

                                                  else{
                                                    print('Error');
                                                  }

                                                }

                                                else if(item=='شبين' ){

                                                  if(restaurantName=='اسماك' ){

                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'اسماك');


                                                  }

                                                  else if(restaurantName=='مشويات'){

                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'مشويات');

                                                  }

                                                  else if(restaurantName=='كل الفئات'){

                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'كل الفئات');

                                                  }

                                                  else if(restaurantName=='كشري و طواجن'){


                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'كشري و طواجن');

                                                  }

                                                  else if(restaurantName=='كل المطاعم'){


                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'كل المطاعم');


                                                  }

                                                  else if(restaurantName=='بيتزا'){


                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'بيتزا');

                                                  }

                                                  else if(restaurantName=='Restaurant'){

                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'Restaurant');


                                                  }

                                                  else if(restaurantName=='لحوم و خضروات'){

                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'لحوم و خضروات');


                                                  }

                                                  else if(restaurantName=='كريب/سوري'){


                                                    AppCubit.get(context).getShbinRestaurantDetails(resName: 'كريب/سوري');




                                                  }

                                                  else{
                                                    print('Error');
                                                  }


                                                }

                                                else if(item=='كفر الشوبك' ){

                                                  if(restaurantName=='اسماك' ){


                                                    AppCubit.get(context).getItemKafrShobak(resName: 'اسماك');

                                                  }

                                                  else if(restaurantName=='مشويات'){

                                                    AppCubit.get(context).getItemKafrShobak(resName: 'مشويات');

                                                  }

                                                  else if(restaurantName=='كل الفئات'){


                                                    AppCubit.get(context).getItemKafrShobak(resName: 'كل الفئات');

                                                  }

                                                  else if(restaurantName=='كشري و طواجن'){

                                                    AppCubit.get(context).getItemKafrShobak(resName: 'كشري و طواجن');

                                                  }

                                                  else if(restaurantName=='كل المطاعم'){


                                                    AppCubit.get(context).getItemKafrShobak(resName: 'كل المطاعم');

                                                  }

                                                  else if(restaurantName=='بيتزا'){


                                                    AppCubit.get(context).getItemKafrShobak(resName: 'بيتزا');

                                                  }

                                                  else if(restaurantName=='Restaurant'){

                                                    AppCubit.get(context).getItemKafrShobak(resName: 'Restaurant');

                                                  }

                                                  else if(restaurantName=='لحوم و خضروات'){

                                                    AppCubit.get(context).getItemKafrShobak(resName: 'لحوم و خضروات');

                                                  }

                                                  else if(restaurantName=='كريب/سوري'){


                                                    AppCubit.get(context).getItemKafrShobak(resName: 'كريب/سوري');



                                                  }

                                                  else{
                                                    print('Error');
                                                  }


                                                }

                                                else if(item=='طحا' ){

                                                  if(restaurantName=='اسماك' ){


                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'اسماك');

                                                  }

                                                  else if(restaurantName=='مشويات'){


                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'مشويات');

                                                  }

                                                  else if(restaurantName=='كل الفئات'){


                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'كل الفئات');

                                                  }

                                                  else if(restaurantName=='كشري و طواجن'){

                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'كشري و طواجن');

                                                  }

                                                  else if(restaurantName=='كل المطاعم'){


                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'كل المطاعم');

                                                  }

                                                  else if(restaurantName=='بيتزا'){


                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'بيتزا');

                                                  }

                                                  else if(restaurantName=='Restaurant'){


                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'Restaurant');

                                                  }

                                                  else if(restaurantName=='لحوم و خضروات'){


                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'لحوم و خضروات');

                                                  }


                                                  else if(restaurantName=='كريب/سوري'){


                                                    AppCubit.get(context).getTahaRestaurantDetails(resName: 'كريب/سوري');



                                                  }

                                                  else{
                                                    print('Error');
                                                  }

                                                }

                                                else{
                                                  print('error');
                                                }

                                              },



                                            );
                                          }).toList(),
                                          onChanged: (val){
                                            AppCubit.get(context).selectedArea(val);
                                          },
                                          onTap: (){
                                            // Set logic of item
                                          },
                                        ),
                                      )
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                      child: Center(
                                        child: DropdownButton(
                                          dropdownColor: Colors.black87,
                                          underline: Container(
                                            color: Colors.white,
                                          ),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17
                                          ),
                                          icon: Icon(Icons.arrow_drop_down_sharp,color: Colors.white,),
                                          value: AppCubit.get(context).selectedPlace,
                                          items: AppCubit.get(context).places.map((item) {
                                            return DropdownMenuItem(
                                                child: Text(item),
                                                value: item,
                                                onTap: (){
                                                  restaurantName=item.toString();
                                                  if(item=='اسماك' ){

                                                    if(areaName=='كل المناطق'){

                                                      AppCubit.get(context).getItemKafrShaben(resName: 'اسماك');
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'اسماك');
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'اسماك');
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'اسماك');

                                                    }

                                                    else if(areaName=='كفر شبين')
                                                    {
                                                      AppCubit.get(context).getItemKafrShaben(resName: 'اسماك');
                                                    }
                                                    else if(areaName=='شبين'){
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'اسماك');
                                                    }
                                                    else if(areaName=='كفر الشوبك'){
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'اسماك');
                                                    }
                                                    else{
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'اسماك');

                                                    }
                                                  }

                                                  else if(item=='مشويات'){
                                                    if(areaName=='كل المناطق'){

                                                      AppCubit.get(context).getItemKafrShaben(resName: 'مشويات');
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'مشويات');
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'مشويات');
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'مشويات');

                                                    }

                                                    else if(areaName=='كفر شبين')
                                                    {
                                                      AppCubit.get(context).getItemKafrShaben(resName: 'مشويات');
                                                    }
                                                    else if(areaName=='شبين'){
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'مشويات');
                                                    }
                                                    else if(areaName=='كفر الشوبك'){
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'مشويات');
                                                    }
                                                    else{
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'مشويات');

                                                    }
                                                  }

                                                  else if(item=='كل الفئات'){


                                                    if(areaName=='كل المناطق'){

                                                      AppCubit.get(context).getItemKafrShaben(resName: 'كل الفئات');
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'كل الفئات');
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'كل الفئات');
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'كل الفئات');

                                                    }

                                                    else if(areaName=='كفر شبين')
                                                    {
                                                      AppCubit.get(context).getItemKafrShaben(resName: 'كل الفئات');
                                                    }
                                                    else if(areaName=='شبين'){
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'كل الفئات');
                                                    }
                                                    else if(areaName=='كفر الشوبك'){
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'كل الفئات');
                                                    }
                                                    else{
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'كل الفئات');

                                                    }
                                                  }

                                                  else if(item=='كشري و طواجن'){

                                                    if(areaName=='كل المناطق'){

                                                      AppCubit.get(context).getItemKafrShaben(resName: 'كشري و طواجن');
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'كشري و طواجن');
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'كشري و طواجن');
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'كشري و طواجن');

                                                    }

                                                    else if(areaName=='كفر شبين')
                                                    {
                                                      AppCubit.get(context).getItemKafrShaben(resName: 'كشري و طواجن');
                                                    }
                                                    else if(areaName=='شبين'){
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'كشري و طواجن');
                                                    }
                                                    else if(areaName=='كفر الشوبك'){
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'كشري و طواجن');
                                                    }
                                                    else{
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'كشري و طواجن');

                                                    }

                                                  }

                                                  else if(item=='كل المطاعم'){

                                                    if(areaName=='كل المناطق'){

                                                      AppCubit.get(context).getItemKafrShaben(resName: 'كل المطاعم');
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'كل المطاعم');
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'كل المطاعم');
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'كل المطاعم');

                                                    }

                                                    else if(areaName=='كفر شبين')
                                                    {
                                                      AppCubit.get(context).getItemKafrShaben(resName: 'كل المطاعم');
                                                    }
                                                    else if(areaName=='شبين'){
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'كل المطاعم');
                                                    }
                                                    else if(areaName=='كفر الشوبك'){
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'كل المطاعم');
                                                    }
                                                    else{
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'كل المطاعم');

                                                    }
                                                  }

                                                  else if(item=='بيتزا'){

                                                    if(areaName=='كل المناطق'){

                                                      AppCubit.get(context).getItemKafrShaben(resName: 'بيتزا');
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'بيتزا');
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'بيتزا');
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'بيتزا');

                                                    }

                                                    else if(areaName=='كفر شبين')
                                                    {
                                                      AppCubit.get(context).getItemKafrShaben(resName: 'بيتزا');
                                                    }
                                                    else if(areaName=='شبين'){
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'بيتزا');
                                                    }
                                                    else if(areaName=='كفر الشوبك'){
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'بيتزا');
                                                    }
                                                    else{
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'بيتزا');

                                                    }
                                                  }

                                                  else if(item=='Restaurant'){

                                                    if(areaName=='كل المناطق'){

                                                      AppCubit.get(context).getItemKafrShaben(resName: 'Restaurant');
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'Restaurant');
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'Restaurant');
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'Restaurant');

                                                    }

                                                    else if(areaName=='كفر شبين')
                                                    {
                                                      AppCubit.get(context).getItemKafrShaben(resName: 'Restaurant');
                                                    }
                                                    else if(areaName=='شبين'){
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'Restaurant');
                                                    }
                                                    else if(areaName=='كفر الشوبك'){
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'Restaurant');
                                                    }
                                                    else{
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'Restaurant');

                                                    }
                                                  }

                                                  else if(item=='لحوم و خضروات'){

                                                    if(areaName=='كل المناطق'){

                                                      AppCubit.get(context).getItemKafrShaben(resName: 'لحوم و خضروات');
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'لحوم و خضروات');
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'لحوم و خضروات');
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'لحوم و خضروات');

                                                    }

                                                    else if(areaName=='كفر شبين')
                                                    {
                                                      AppCubit.get(context).getItemKafrShaben(resName: 'لحوم و خضروات');
                                                    }
                                                    else if(areaName=='شبين'){
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'لحوم و خضروات');
                                                    }
                                                    else if(areaName=='كفر الشوبك'){
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'لحوم و خضروات');
                                                    }
                                                    else{
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'لحوم و خضروات');

                                                    }                                                  }

                                                  else if(item=='كريب/سوري'){

                                                    if(areaName=='كل المناطق'){

                                                      AppCubit.get(context).getItemKafrShaben(resName: 'كريب/سوري');
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'كريب/سوري');
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'كريب/سوري');
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'كريب/سوري');

                                                    }

                                                    else if(areaName=='كفر شبين')
                                                    {
                                                      AppCubit.get(context).getItemKafrShaben(resName: 'كريب/سوري');
                                                    }
                                                    else if(areaName=='شبين'){
                                                      AppCubit.get(context).getShbinRestaurantDetails(resName: 'كريب/سوري');
                                                    }
                                                    else if(areaName=='كفر الشوبك'){
                                                      AppCubit.get(context).getItemKafrShobak(resName: 'كريب/سوري');
                                                    }
                                                    else{
                                                      AppCubit.get(context).getTahaRestaurantDetails(resName: 'كريب/سوري');

                                                    }

                                                  }

                                                  else{
                                                    print('Error');
                                                  }





                                                }
                                            );
                                          }).toList(),
                                          onChanged: (val){
                                            AppCubit.get(context).SelectedPlace(val);
                                          },
                                          onTap: (){
                                            // Set logic of item
                                          },
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: GridView.count(
                            physics: BouncingScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 4,
                            childAspectRatio: 1/1.5,
                            children: List.generate(AppCubit.get(context).restaurantsDetails.length, (index)=> Block_Item(context,(AppCubit.get(context).restaurantsDetails[index]))) ,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                drawer: Drawer(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(58, 86, 156,1),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 73,),
                            Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(63),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/login.jpeg'),
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context,index)=>Block_Line_Drawer(Items[index]),
                            separatorBuilder: (context,index)=> SizedBox(height: 10,),
                            itemCount: 8),
                      )
                    ],
                  ),
                ),
              ),
          );
        },
      );
  }
}

Widget Block_Line_Drawer(Items_Drawer model){
  return Container(

    child: InkWell(
      onTap: (){
        model.function!();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 15,),
          Icon(model.icon),
          SizedBox(width: 12,),
          Text(
            '${model.text}',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'OpenSans'
            )
          ),


        ],
      ),
    ),
  );
}


Widget Block_Item(context,RestaurantModel model){
  DateTime time ;
  time = new DateTime.now() ;


  return GestureDetector(
    onTap: (){
      AppCubit.get(context).changeTabs(restaurantName: model.name!);
      print(TimeOfDay.now());
      navigateTo(context: context, widget: MenuScreen(model));
    },
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Material(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10.0,
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
              child: Image(
                  height: 110,
                  width: 150,
                  fit: BoxFit.fill,
                  image: NetworkImage((model.image)!)
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
                alignment: Alignment.topRight,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      (model.name)!,
                      style: GoogleFonts.lato(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  )
              ),
            SizedBox(
                height: 8.0,
              ),
            Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      (model.category)!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Spacer(),
                   time.hour>=12 ? Text(
                    'مفتوح',
                    style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.green,
                        fontWeight: FontWeight.bold,
                    ),
                  ):Text(
                    'مغلق',
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.green,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    'المسافه',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Spacer(),
                Text('KM ',style: TextStyle(fontSize: 15,color: Colors.red)),
                Text((model.distance)!,style: TextStyle(fontSize: 15,color: Colors.red)),
                SizedBox(
                  width: 2.0,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

