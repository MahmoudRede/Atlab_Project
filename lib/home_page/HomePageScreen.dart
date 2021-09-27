
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/LoginScreen/login_screen.dart';
import 'package:talabatak/talabatak_bloc/cubit.dart';
import 'package:talabatak/talabatak_bloc/states.dart';

class Items_Drawer{
  String ?text;
  IconData ?icon;
  Function ?function;

  Items_Drawer(this.text, this.icon, this.function);
}


class HomePageScreen extends StatelessWidget {

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
                print('الحساب الشخصي');
          }
      ),

      Items_Drawer(
          'السله',
          Icons.add_shopping_cart,
              (){
                print('السله');
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

    return BlocProvider(
      create: (BuildContext context) =>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return  Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.amber,
              title: Row(
                children: [
                  Spacer(),
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
                     child: Column(
                       children: [
                         SizedBox(height: 10,),
                         Row(
                           children: [
                             SizedBox(width: 55,),
                             Expanded(
                               child: Text('نوع المنطقه',style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 20,
                                   color: Colors.black
                               ),),
                             ),
                             Expanded(
                               child: Text('نوع المطعم',style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 20,
                                   color: Colors.black
                               ),),
                             )
                           ],
                         ),
                         Row(
                           children: [
                             SizedBox(width: 50,),
                             Expanded(
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
                                     );
                                   }).toList(),
                                   onChanged: (val){
                                     AppCubit.get(context).SelectedArea(val);
                                   },
                                   onTap: (){
                                     // Set logic of item
                                   },
                                 )
                             ),
                             SizedBox(width: 20,),
                             Expanded(
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
                                     );
                                   }).toList(),
                                   onChanged: (val){
                                     AppCubit.get(context).SelectedPlace(val);
                                   },
                                   onTap: (){
                                     // Set logic of item
                                   },
                                 )
                             ),

                           ],
                         ),
                       ],
                     ),
                   ),
                   Expanded(
                     child: Container(
                       color: Colors.grey[200],
                       child: GridView.count(
                           crossAxisCount: 2,
                           mainAxisSpacing: 3,
                           crossAxisSpacing: 3,
                           childAspectRatio: 1/1.3,
                           children: List.generate(8, (index)=> Block_Item()) ,
                       ),
                     ),
                   ),
                ],
              ),
            ),
            endDrawer: Drawer(
              child: Column(
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
          );
        },
      )
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('${model.text}',style: TextStyle(
            fontSize: 13,
            fontFamily: 'Lemonada',
          ),),
          SizedBox(width: 12,),
          Icon(model.icon),
          SizedBox(width: 10,),


        ],
      ),
    ),
  );
}


Widget Block_Item(){
  return Padding(
    padding: const EdgeInsets.fromLTRB(3, 5, 2, 0),
    child: Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image(
              fit: BoxFit.cover,
              image: NetworkImage('https://image.freepik.com/free-photo/kebab-platter-with-lamb-chicken-lula-tikka-kebabs-grilled-vegetables-with-red-onion-salad_141793-2251.jpg')
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Text('مشويات الريس',style: TextStyle(fontSize: 20),),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('مفتوح',style: TextStyle(color: Colors.white,backgroundColor: Colors.green,fontWeight: FontWeight.bold),),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text('مشويات',style: TextStyle(fontSize: 17),),
              ),
            ],
          ),

          Row(
            children: [

              Text('10Km',style: TextStyle(fontSize: 17,color: Colors.red)),
              Spacer(),

              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Text(
                  'المسافه',style: TextStyle(fontSize: 17),
                ),
              ),
            ],
          )


        ],
      ),
    ),
  );
}
