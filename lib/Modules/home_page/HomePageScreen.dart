import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/Models/itemModel.dart';
import 'package:talabatak/Modules/ItemScreen/itemScreen.dart';
import 'package:talabatak/Modules/LoginScreen/login_screen.dart';
import 'package:talabatak/Modules/MenuScreen/MenuScreen.dart';
import 'package:talabatak/Modules/ProfileScreen/profileScreen.dart';
import 'package:talabatak/talabatak_bloc/cubit.dart';
import 'package:talabatak/talabatak_bloc/states.dart';

class Items_Drawer{
  String ?text;
  IconData ?icon;
  Function ?function;

  Items_Drawer(this.text, this.icon, this.function);
}


class HomePageScreen extends StatelessWidget {

  String ?areaName;


  @override
  Widget build(BuildContext context) {

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
                navigateTo(context: context, widget: ProfileScreen());
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
            print('الرسائل');
          }
      ),
      Items_Drawer(
          'الاعدادات',
          Icons.settings,
              (){
            print('الاعدادات');
          }
      ),
      Items_Drawer(
          'الخصوصيه والامان',
          Icons.security,
              (){
            print('الخصوصيه والامان');
          }
      ),
      Items_Drawer(
          'تسجيل الخروج',
          Icons.logout,
              (){
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
                body: Container(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.amber,
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
                                          color: Colors.black
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'نوع المطعم',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Center(
                                        child: DropdownButton(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17
                                          ),
                                          icon: Icon(Icons.arrow_drop_down_sharp,color: Colors.black,),
                                          underline: Container(
                                            color: Colors.white,
                                          ),
                                          value: AppCubit.get(context).selectedarea,
                                          items: AppCubit.get(context).Areas.map((item) {
                                            return DropdownMenuItem(
                                              child: Text(item),
                                              value: item,
                                              onTap: (){

                                              },


                                            );
                                          }).toList(),
                                          onChanged: (val){
                                            AppCubit.get(context).SelectedArea(val);
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

                                          underline: Container(
                                            color: Colors.white,
                                          ),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17

                                          ),
                                          icon: Icon(Icons.arrow_drop_down_sharp,color: Colors.black,),
                                          value: AppCubit.get(context).selectedplace,
                                          items: AppCubit.get(context).Places.map((item) {
                                            return DropdownMenuItem(
                                                child: Text(item),
                                                value: item,
                                                onTap: (){
                                                  if(item=='اسماك' ){
                                                    AppCubit.get(context).getItemKafrShaben(resName: 'اسماك');
                                                  }

                                                  if(item=='مشويات'){
                                                    AppCubit.get(context).getItemKafrShaben(resName: 'مشويات');
                                                  }

                                                  if(item=='كل الفئات'){
                                                    AppCubit.get(context).getItemKafrShaben(resName: 'كل الفئات');
                                                  }

                                                  if(item=='كشري و طواجن'){
                                                    AppCubit.get(context).getItemKafrShaben(resName: 'كشري و طواجن');
                                                  }

                                                  if(item=='كل المطاعم'){
                                                    AppCubit.get(context).getItemKafrShaben(resName: 'كل المطاعم');
                                                  }

                                                  if(item=='بيتزا'){
                                                    AppCubit.get(context).getItemKafrShaben(resName: 'بيتزا');
                                                  }

                                                  if(item=='Restaurant'){
                                                    AppCubit.get(context).detail=[];
                                                  }

                                                  if(item=='لحوم و خضروات'){
                                                    AppCubit.get(context).detail=[];
                                                  }

                                                  if(item=='كريب/سوري'){
                                                    AppCubit.get(context).detail=[];
                                                  }


                                                  if(item=='بيتزا'){
                                                    AppCubit.get(context).getItemKafrShobak(resName: 'بيتزا');
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
                            childAspectRatio: 1/1.4,
                            children: List.generate(AppCubit.get(context).detail.length, (index)=> Block_Item(context,(AppCubit.get(context).detail[index]))) ,
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
                            color: Colors.amber
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
                                    image: AssetImage('assets/images/login.jpg'),
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
            fontSize: 13,
            fontFamily: 'Lemonada',
            ),
          ),


        ],
      ),
    ),
  );
}


Widget Block_Item(context,ItemModel model){
  return GestureDetector(
    onTap: (){
      navigateTo(context: context, widget: MenuScreen());
    },
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Material(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10.0,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image(
                fit: BoxFit.fill,
                image: NetworkImage('https://image.freepik.com/free-photo/kebab-platter-with-lamb-chicken-lula-tikka-kebabs-grilled-vegetables-with-red-onion-salad_141793-2251.jpg')
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
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
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
                      (model.title)!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text('مفتوح',style: TextStyle(color: Colors.white,backgroundColor: Colors.green,fontWeight: FontWeight.bold),),


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
                Text((model.street)!,style: TextStyle(fontSize: 15,color: Colors.red)),
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
