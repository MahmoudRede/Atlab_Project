import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talabatak/Models/orderModel.dart';

class ShowOrders extends StatelessWidget {
  List <dynamic> orders ;
  ShowOrders(this.orders);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context , index) => listItem(orders[index]),
                separatorBuilder: (context , index) => SizedBox(
                  height: 10.0,
                ),
                itemCount: orders.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem (Map model)
  {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 20, 10),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 5,
        child: Container(
          height: 240,
          width: 330,
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Container(
                alignment: AlignmentDirectional.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'المطعم : ',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${model['restaurantName']}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0, 30, 0),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/burger.png',),
                      height: 100,
                      width: 80,
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            '${model['name']}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          '${model['category']}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
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
                        SizedBox(width: 12,),
                        Text('${model['number']}',style: TextStyle(
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
                        SizedBox(width: 12,),
                        Text(
                          'نص',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),)
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'السعر : ',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                          maxLines: 3,
                        ),
                        Text(
                          '${model['price']}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                          maxLines: 3,
                        ),
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
