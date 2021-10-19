import 'dart:ui';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/Models/adminModel.dart';
import 'package:talabatak/Models/itemModel.dart';
import 'package:talabatak/Models/orderModel.dart';
import 'package:talabatak/Modules/ShowOrders/ShowOrders.dart';
import 'package:talabatak/SharedPreference/CacheHelper.dart';
import 'package:talabatak/talabatak_bloc/cubit.dart';
import 'package:talabatak/talabatak_bloc/states.dart';


  int count=0;

List<String> isSelected=[];

class adminScreen extends StatelessWidget {



  List<Color> cardColor=[];



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
         var order = AppCubit.get(context).items;
         var lenght=  order.length;
         for(int i=0;i<=lenght;i++){
           cardColor.add(Colors.white);
         }
         for(int i=0;i<=lenght;i++){
           isSelected.add('0');
         }

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
             appBar: AppBar(
               title: Text('الطلبات',style: TextStyle(
                   color: Colors.white,
                   fontSize: 25,
                   fontWeight: FontWeight.bold,
               )),
             ),

             body: ConditionalBuilder(
               condition: order.length > 0,
               builder:(context)=> Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: const EdgeInsets.fromLTRB(0,10, 20, 0),
                     child: Text('بيانات العميل',style: TextStyle(
                         color: Colors.black,
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'Lemonada'
                     )),
                   ),
                   Expanded(
                       child: ListView.separated(
                           itemBuilder: (context , index) => clientItem(order[index].userData! , order[index].orderData! , context,cardColor,index),
                           separatorBuilder: (context , index) => SizedBox(
                             height: 0,
                           ),
                           itemCount: order.length,
                       ),
                   ),
                   // Padding(
                   //   padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                   //   child: Text('الطلب',style: TextStyle(
                   //       color: Colors.black,
                   //       fontSize: 22,
                   //       fontWeight: FontWeight.bold,
                   //       fontFamily: 'Lemonada'
                   //   )),
                   // ),
                   // Expanded(
                   //   child: ListView.separated(
                   //       itemBuilder: (context,index)=> listItem(order[index]),
                   //       separatorBuilder: (context,index){
                   //         return SizedBox(height: 5,);
                   //       },
                   //       itemCount: AppCubit.get(context).items.length
                   //   ),
                   // ),
                 ],
               ),
               fallback: (context) => Center(child: Text('لا توجد طلبات'),),
             ),
         ),
          );
        }
    );
  }
}

Widget clientItem (Map model , List <dynamic> orders , context,List<Color> colors,index)
{

  bool done=false;
  return GestureDetector(
    onTap: (){
      count=index;
      navigateTo(context: context, widget: ShowOrders(orders));
    },
    child: Container(
      width: double.infinity,
      height: 270,
      padding: EdgeInsets.fromLTRB(15,20, 15, 20),
      child: Stack(
        children: [
          Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 20,
            color: colors[index],
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 12, 0),
                  child: Row(
                    children: [
                      Text('اسم العميل : ',style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      )),
                      Text('${model['name']}',style: TextStyle(
                        fontSize: 17,
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 2,
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  color:  Color.fromRGBO(58, 86, 156,1),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 12, 0),
                  child: Row(
                    children: [
                      Text('رقم الهاتف : ',style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      )),
                      Text('${model['number']}',style: TextStyle(
                        fontSize: 17,
                      ))
                    ],

                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 2,
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  color:  Color.fromRGBO(58, 86, 156,1),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 12, 0),
                  child: Row(
                    children: [
                      Text('العنوان : ',style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold
                      )),
                      Text('${model['address']}',style: TextStyle(
                        fontSize: 17,
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 0,),
                Row(
                  children: [
                    Spacer(),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      color:  Color.fromRGBO(58, 86, 156,1),
                      onPressed: (){



                        AppCubit.get(context).changeItemColor(index, colors);
                        AppCubit.get(context).saveIsDone(isSelected, index,colors);


                      },
                      child: Text('تم الطلب',style: TextStyle(
                        color: Colors.white,

                      ),),
                    ),
                    SizedBox(width: 7,),
                    IconButton(onPressed: (){
                      print('Hi');
                      AppCubit.get(context).deleteOrder(index);

                    }, icon: Icon(
                      Icons.delete,
                    )),
                    SizedBox(width: 10,),

                  ],
                ),
                // IconButton(onPressed: (){
                // }, icon:
                // Icon(
                //     Icons.cloud_done_rounded
                // )
                // ),
              ],
            ),
          ),
          if(colors[index]==Colors.greenAccent)
          Positioned(
              top: 60,
              right: 80,
              child: Text('Done',style: TextStyle(
                color: Colors.black54,
                fontSize: 70
              ),),
          ),
        ],
      ),

    ),
  );
}

