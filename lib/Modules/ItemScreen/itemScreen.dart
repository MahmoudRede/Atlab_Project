import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/talabatak_bloc/cubit.dart';
import 'package:talabatak/talabatak_bloc/states.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Text('تفاصيل المنتج',style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),),
            ),

            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 20, 20),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5,
                      child: Container(
                        height: 335,
                        width: 300,
                        child: Column(
                          children: [
                            SizedBox(height: 30,),
                            Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/burger.png',),
                                  height: 95,
                                  width: 120,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('نص فرخه',style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    Text('مشويات',style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 110, 10),
                              child: Row(
                                children: [
                                  Text('الحجم :',style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(width: 35,),
                                  Text('نص',style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),)

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 110, 10),
                              child: Row(
                                children: [
                                  Text('السعر :',style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(width: 35,),
                                  Text('L.E',style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  Text(' 40',style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 110, 0),
                              child: Row(
                                children: [
                                  Text('العدد :',style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(width: 10,),
                                  FloatingActionButton(
                                    backgroundColor: Colors.grey[50],
                                    elevation: 0,
                                    onPressed: (){
                                      AppCubit.get(context).plusNumberOfItem();
                                    },
                                    mini:true ,
                                    child:Icon(
                                      Icons.add_circle_outline,
                                      color: Color.fromRGBO(58, 86, 156,1),
                                      size: 30,
                                    ) ,
                                  ),
                                  Text('${AppCubit.get(context).numberOfItem}',style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  FloatingActionButton(
                                    backgroundColor: Colors.grey[50],
                                    elevation: 0,
                                    onPressed: (){
                                      AppCubit.get(context).minesNumberOfItem();

                                    },
                                    mini:true ,
                                    child:Icon(
                                      Icons.remove_circle_outline,
                                      color: Color.fromRGBO(58, 86, 156,1),
                                      size: 30,
                                    ) ,
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(height: 5,),
                            MaterialButton(
                              elevation: 7,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                              color: Color.fromRGBO(58, 86, 156,1),
                              onPressed: (){

                              },
                              child: Text('اضف الي طلباتك',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),),
                            ),
                          ],
                        ),
                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
                    child: InkWell(
                      onTap: (){
                        print('1');
                      },
                      child: Image(image: AssetImage('assets/images/cart.png',),
                        height: 125,
                        width: 125,
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
