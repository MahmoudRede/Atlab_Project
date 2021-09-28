import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen1.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen2.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen3.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
             toolbarHeight: MediaQuery.of(context).size.height*.30,
            title: Container(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/delivery.jpg'),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'مشويات الريس',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                  onTap : (){},
                  child : Image(
                    height: 35.0,
                    width: 35.0,
                    image: AssetImage('assets/images/shopping.png'),
                  ),
                ),
              ),
            ],
            bottom: TabBar(
              labelStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
              ),
              tabs: [
                Tab(text: 'مشويات',),
                Tab(text: 'سندوتشات',),
                Tab(text: 'وجبات',),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Screen1(),
              Screen1(),
              Screen1(),
            ],
          ),
        ),
      ),
    );
  }
}
