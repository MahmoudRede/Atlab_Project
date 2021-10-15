import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Models/adminModel.dart';
import 'package:talabatak/Models/itemModel.dart';
import 'package:talabatak/Models/orderModel.dart';
import 'package:talabatak/talabatak_bloc/cubit.dart';
import 'package:talabatak/talabatak_bloc/states.dart';

class adminScreen extends StatelessWidget {
  const adminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
        builder: (context,state){
          var order=AppCubit.get(context).items;

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
             appBar: AppBar(
               title: Text('الطلب',style: TextStyle(
                   color: Colors.white,
                   fontSize: 25,
                   fontWeight: FontWeight.bold,
               )),
             ),

             body: order.length>0?Column(
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
                 Container(
                   width: double.infinity,
                   height: 190,
                   padding: EdgeInsets.fromLTRB(15,20, 15, 20),
                   child: Material(
                     borderRadius: BorderRadius.circular(20),
                     elevation: 20,
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
                               Text((AppCubit.get(context).adminModel!.name)!,style: TextStyle(
                                 fontSize: 17,
                               ))
                             ],

                           ),
                         ),
                         SizedBox(height: 5,),
                         Container(
                           height: 2,
                           margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                           color:  Color.fromRGBO(58, 86, 156,1),
                         ),
                         SizedBox(height: 5,),

                         Padding(
                           padding: const EdgeInsets.fromLTRB(0, 8, 12, 0),
                           child: Row(
                             children: [
                               Text('رقم الهاتف : ',style: TextStyle(
                                   fontSize: 17,
                                   fontWeight: FontWeight.bold
                               )),
                               Text((AppCubit.get(context).adminModel!.number)!,style: TextStyle(
                                 fontSize: 17,
                               ))
                             ],

                           ),
                         ),
                         SizedBox(height: 5,),
                         Container(
                           height: 2,
                           margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                           color:  Color.fromRGBO(58, 86, 156,1),
                         ),
                         SizedBox(height: 5,),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(0, 8, 12, 0),
                           child: Row(
                             children: [
                               Text('العنوان : ',style: TextStyle(
                                   fontSize: 19,
                                   fontWeight: FontWeight.bold
                               )),
                               Text((AppCubit.get(context).adminModel!.address)!,style: TextStyle(
                                 fontSize: 17,
                               ))
                             ],

                           ),
                         ),
                         SizedBox(height: 5,),

                       ],
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                   child: Text('الطلب',style: TextStyle(
                       color: Colors.black,
                       fontSize: 22,
                       fontWeight: FontWeight.bold,
                       fontFamily: 'Lemonada'
                   )),
                 ),
                 Expanded(
                   child: ListView.separated(
                       itemBuilder: (context,index)=> listItem(order[index]!),
                       separatorBuilder: (context,index){
                         return SizedBox(height: 5,);
                       },
                       itemCount: AppCubit.get(context).items!.length
                   ),
                 ),
               ],
             ):Center(child: Text('لا توجد طلبات'),),
         ),
          );
        }
    );
  }
}

Widget listItem (OrderModel orderModel)
{
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
    child: Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
        height: 150,
        width: 300,
        child: Column(
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage('assets/images/burger.png',),
                  height: 100,
                  width: 80,
                ),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      child: Row(
                        children: [
                          Text(
                            '${orderModel.name}',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),

                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'السعر :',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),),
                        SizedBox(width: 7,),
                        Text(
                          '${orderModel.price}',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),),


                      ],
                 ),
                    Row(
                      children: [
                        Text(
                          'العدد :',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),),
                        SizedBox(width: 7,),
                        Text('${orderModel.number}',style: TextStyle(
                            fontSize: 17,
                        ),
                        ),

                      ],
                    ),
                  ],
                ),
              ],
            ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 85, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('الحجم :',style: TextStyle(
                            fontSize: 18,
                        ),),
                        SizedBox(width: 20,),
                        Text(
                          'نص',
                          style: TextStyle(
                              fontSize: 17,
                          ),)
                      ],
                    ),
                  ),

          ],
        ),
      ),
    ),
  );
}
