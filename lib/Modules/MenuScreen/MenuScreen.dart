import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/Models/RestaurantModel.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen1.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen2.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen3.dart';
import 'package:talabatak/Modules/UserBasket/UserBasket.dart';
import 'package:talabatak/talabatak_bloc/cubit.dart';
import 'package:talabatak/talabatak_bloc/states.dart';

class MenuScreen extends StatelessWidget {

  final RestaurantModel model ;

  MenuScreen(this.model);


  @override
  Widget build(BuildContext context) {
    return  Builder(
      builder: (context) {

        AppCubit.get(context).getCurrentRestaurant(model);

        return BlocConsumer <AppCubit , AppStates>(
            listener: (context , state){},
            builder: (context , state){
              return Directionality(
                textDirection: TextDirection.rtl,
                child: DefaultTabController(
                  length: AppCubit.get(context).tabs.length,
                  child: Scaffold(
                    appBar: AppBar(
                      toolbarHeight: MediaQuery.of(context).size.height*.31,
                      title: Container(
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.0,
                              ),
                              CircleAvatar(
                                radius: 50.0,
                                backgroundImage: NetworkImage('${model.image}'
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                model.name!,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                              SizedBox(height: 10,),
                            ],

                          ),
                        ),
                      ),
                      leading: Container(
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(
                          top: 15.0,
                        ),
                        child: IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 32.0,
                          ),
                        ),
                      ),
                      actions: [
                        Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(
                              left: 13.0,
                              top: 25.0
                          ),
                          child: GestureDetector(
                            onTap : (){
                              navigateTo(context: context, widget: UserBasket());
                            },
                            child : Image(
                              height: 35.0,
                              width: 35.0,
                              image: AssetImage('assets/images/shopping.png'),
                            ),
                          ),
                        ),
                      ],
                      bottom: TabBar(
                        isScrollable: true,
                        labelStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                        ),
                        tabs: [
                          ...(AppCubit.get(context).tabs).map((tab){
                            return Text(tab);
                          }).toList(),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: AppCubit.get(context).tabsScreens,
                    ),
                  ),
                ),
              );
            },
          );
      }
    );
  }
}
