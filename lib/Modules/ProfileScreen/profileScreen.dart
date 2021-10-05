import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/talabatak_bloc/cubit.dart';
import 'package:talabatak/talabatak_bloc/states.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
         builder: (context,state){

          var model=AppCubit.get(context).usermodel;

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text('الحساب الشخصي ',style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
                iconTheme: IconThemeData(
                  color: Colors.black
                ),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),


              ),
              body: Container(
                color: Colors.white,
                child: Stack(
                  children: [

                    Container(
                      padding: EdgeInsets.all(25),
                      margin: EdgeInsets.only(top: 150),
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.shade100,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft:  Radius.circular(30),
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 57,),
                          Text('البيانات الشخصيه',style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          Container(
                            height: 1,
                            color: Colors.black45,
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('الاسم :',style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(width: 5,),
                              Text((model!.name)!,style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('رقم التلفون :',style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(width: 5,),
                              Text((model!.phone)!,style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('العنوان :',style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(width: 5,),
                              Text((model!.address)!,style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                          SizedBox(height: 25,),
                          Text('الاعدادات العامه',style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ),),
                          Container(
                            height: 1,
                            color: Colors.black45,
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('خدمه العملاء :',style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(width: 5,),
                              Text('01277556432 ',style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),

                        ],

                      ),
                    ),

                    Positioned(
                      top: 85,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 35, 0),
                        child: CircleAvatar(
                          radius: 63,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('assets/images/login.jpg',),

                          ),
                        ),
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