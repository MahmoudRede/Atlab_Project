import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView.separated(
          physics: BouncingScrollPhysics(),
            itemBuilder: (context , index) => menuListItem(),
            separatorBuilder: (context , index) => SizedBox(
              height: 1.0,
            ),
            itemCount: 10,
        ),
      ),
    );
  }

  Widget menuListItem ()
  {
    return GestureDetector(
      onTap: (){},
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
                  child: Text(
                    'فراخ شوايا فحم',
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
                Text(
                  '20',
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
