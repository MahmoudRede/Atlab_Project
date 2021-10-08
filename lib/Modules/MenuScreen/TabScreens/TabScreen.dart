import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/Models/itemModel.dart';
import 'package:talabatak/Modules/ItemScreen/itemScreen.dart';
import 'package:talabatak/talabatak_bloc/cubit.dart';
import 'package:talabatak/talabatak_bloc/states.dart';

class TabScreen extends StatelessWidget {
   final List<ItemModel> menu ;

   TabScreen({required this.menu});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        builder: (context,state){
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context , index) => menuListItem(context,menu[index]),
                separatorBuilder: (context , index) => SizedBox(
                  height: 1.0,
                ),
                itemCount: menu.length,
              ),
            ),
          );
        },
        listener: (context,state){}
    );
  }

  Widget menuListItem (context,ItemModel foods)
  {
    return GestureDetector(
      onTap: (){
        navigateTo(context: context, widget: ItemScreen());
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          elevation: 1.0,
          color: Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(15.0),
          shadowColor: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 45.0,
                  backgroundImage: AssetImage('assets/images/burger.png'),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Text(foods.name!,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'LE',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(foods.price!,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}