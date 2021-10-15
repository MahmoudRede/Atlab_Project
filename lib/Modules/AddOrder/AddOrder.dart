import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/Componants/constants.dart';
import 'package:talabatak/Models/itemModel.dart';
import 'package:talabatak/Modules/FinishOrder/FinishOrder.dart';
import 'package:talabatak/Modules/home_page/HomePageScreen.dart';
import 'package:talabatak/talabatak_bloc/cubit.dart';
import 'package:talabatak/talabatak_bloc/states.dart';

class AddOrder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Builder(
        builder: (BuildContext context){
          AppCubit.get(context).getTotalPrice();
          return BlocConsumer<AppCubit,AppStates>(
            listener: (context,state){},
            builder: (context,state){
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text('اتمام الطلب',style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  body: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context , index) => listItem(userOrders[index] , itemNumber[index] ,context , index),
                              separatorBuilder: (context , index) => SizedBox(
                                height: 5.0,
                              ),
                              itemCount: userOrders.length,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              MaterialButton(
                                elevation: 7,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Color.fromRGBO(58, 86, 156,1),
                                onPressed: (){
                                  navigateTo(context: context, widget: FinishOrder());
                                },
                                child: Text('تأكيد الطلب',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                ),),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              MaterialButton(
                                elevation: 7,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Color.fromRGBO(58, 86, 156,1),
                                onPressed: (){
                                  navigateTo(context: context, widget: HomePageScreen());
                                },
                                child: Text('اضافة اخر',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                ),),
                              ),
                              SizedBox(
                                width: 25.0,
                              ),
                              Row(
                                children: [
                                  Text('السعر :',style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(width: 10,),
                                  Text(
                                    'L.E ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text('${AppCubit.get(context).totalPrice}',style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],

                    ),

                  ),
                ),
              );
            },
          );
        });
  }

  Widget listItem (ItemModel model  , itemNum , context , index)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 20, 20),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 5,
        child: Container(
          height: 240,
          width: 330,
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: IconButton(
                  onPressed: (){
                    AppCubit.get(context).removeItemFromUserOrders(index);
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                    size: 30,
                    color: Color.fromRGBO(58, 86, 156,1),
                  ),
                ),
              ),
              Row(
                children: [
                  Image(
                    image: AssetImage('assets/images/burger.png',),
                    height: 80,
                    width: 110,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        width: 220,
                        child: Text(
                          '${model.name}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Text(
                        '${model.category}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),),
                      Container(
                        width: 200,
                        child: Text(
                          '${model.details}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0 ,0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('العدد :',style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 20,),
                        Text('${itemNum}',style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Row(
                      children: [
                        Text('الحجم :',style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 20,),
                        Text(
                          'نص',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),)
                      ],
                    ),
                  ],
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }

}
