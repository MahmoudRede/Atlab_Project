import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/Componants/constants.dart';
import 'package:talabatak/Modules/LoginScreen/login_screen.dart';
import 'package:talabatak/Modules/antherOrder/AntherOrder.dart';
import 'package:talabatak/Modules/antherOrder/DriveOrder.dart';
import 'package:talabatak/Modules/home_page/HomePageScreen.dart';
import 'package:talabatak/talabatak_bloc/cubit.dart';
import 'package:talabatak/talabatak_bloc/states.dart';

class StartScreen extends StatelessWidget {

  List <String> imagesCategory=[
    'https://media-cdn.tripadvisor.com/media/photo-s/18/20/62/8d/papy-s-fast-food.jpg',
    'https://image.freepik.com/free-vector/shop-cart-shop-building-cartoon_138676-2085.jpg',
    'https://image.freepik.com/free-psd/medical-capsules-mock-up-top-view_23-2148478002.jpg',
    'https://image.freepik.com/free-vector/vegetables-fruits-market-eggplant-peppers-onions-potatoes-healthy-tomato-banana-apple-pear-pumpkin-vector-illustration_1284-46286.jpg',
    'https://matrixclouds.com/uploads/blog/1604394498.png',
    'https://img.freepik.com/free-vector/thinking-face-emoji_1319-430.jpg'

  ];
  List <String> titleCategory=[
    'مطاعم',
    'سوبر ماركت',
    'صيدليات',
    'طلبات سوق',
    'توصيل طلبات',
    'طلب اخر'
  ];
  @override
  Widget build(BuildContext context) {
    List <Function> functionCategory=[
          (){
        valueOfOrder='5';
        navigateAndRemove(context: context, widget: HomePageScreen());
      },
          (){
        navigateAndRemove(context: context, widget: AntherOrder(imageCategory: 'https://image.freepik.com/free-vector/shop-cart-shop-building-cartoon_138676-2085.jpg',titleCategory: 'سوبر ماركت',));
      },
          (){
        navigateAndRemove(context: context, widget:AntherOrder(imageCategory: 'https://image.freepik.com/free-psd/medical-capsules-mock-up-top-view_23-2148478002.jpg',titleCategory: 'صيدليات',));
      },
          (){
        navigateAndRemove(context: context, widget: AntherOrder(imageCategory: 'https://image.freepik.com/free-vector/vegetables-fruits-market-eggplant-peppers-onions-potatoes-healthy-tomato-banana-apple-pear-pumpkin-vector-illustration_1284-46286.jpg',titleCategory: 'طلبات سوق',));
      },
          (){
            valueOfOrder='6';
            navigateAndRemove(context: context, widget: DriveOrder(imageCategory: 'https://matrixclouds.com/uploads/blog/1604394498.png',titleCategory: 'توصيل طلبات',));
      },
          (){
        navigateAndRemove(context: context, widget: AntherOrder(imageCategory: 'https://img.freepik.com/free-vector/thinking-face-emoji_1319-430.jpg',titleCategory: 'طلب اخر',));
      },
    ];
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              toolbarHeight: 140,
              title:  Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: Stack(
                  children: [
                    Column(
                      children: [
                         Container(
                           alignment: Alignment.topLeft,
                           child: RaisedButton(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(15),
                             ),
                             color: Colors.red,
                                onPressed: (){
                                  navigateAndRemove(context: context, widget: LoginScreen());
                                },
                              child: Text('خروج',style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17
                              ),),

                        ),
                         ),
                        SizedBox(height: 2,),
                        Text('اهلا معاك طلباتك',textAlign: TextAlign.center
                          ,style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Lemonada',
                            fontWeight: FontWeight.bold,
                            color:  Color.fromRGBO(58, 86, 156,1),
                          ),),
                        Text('حابب تطلب اي النهارده',textAlign: TextAlign.center
                          ,style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Lemonada',
                            fontWeight: FontWeight.bold,
                            color:  Color.fromRGBO(58, 86, 156,1),
                          ),),

                      ],
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            body: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height*.05,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*.05,
                  ),
                  Expanded(
                    child: GridView.count(

                      physics: BouncingScrollPhysics(),
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      childAspectRatio: 1/1.3,
                      crossAxisCount: 2,
                      children: List.generate(6, (index) => orderBlock(imagesCategory[index],titleCategory[index],functionCategory[index])),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


  Widget orderBlock( String images, String titles,Function function){
  return InkWell(
    onTap: (){
      function();
    },
    child: Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 10.0,
              child: Column(
                children: [
                  Container(
                    height: 130,
                    width: double.infinity,
                    child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(images)
                    ),
                  ),
                  SizedBox(height: 17,),
                  Text(titles,style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),

                ],
              ),
            ),
          )
        ],
      ),


    ),
  );
  }
