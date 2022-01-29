import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/Componants/constants.dart';
import 'package:talabatak/Modules/LoginScreen/login_screen.dart';
import 'package:talabatak/Modules/RegisterScreen/RegisterVistorScreen.dart';
import 'package:talabatak/Modules/home_page/HomePageScreen.dart';
import 'package:talabatak/SharedPreference/CacheHelper.dart';
import 'package:talabatak/talabatak_bloc/cubit.dart';

class Items_Drawer {
  String? text;
  IconData? icon;
  Function? function;

  Items_Drawer(this.text, this.icon, this.function);
}

class DrawerScreen extends StatefulWidget {
  DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    bool chosse = true;

    List<Items_Drawer> Items = [
      Items_Drawer('المطاعم', Icons.home, () {
        navigateAndRemove(context: context, widget: HomePageScreen());
      }),
      Items_Drawer('الحساب الشخصي', Icons.person, () {
        if (vistorLogin == false) {
          AppCubit.get(context).getUser(context);
        } else {
          setState(() {
            chosse = !chosse;
            if (chosse == false) {
              showToast(
                  text: 'يرجاء تسجيل الدخول اضغط مره اخر لانتقال لتسجيل الدخول',
                  state: ToastState.WARNING);
            } else {
              navigateAndRemove(
                  context: context, widget: RegisterVistorScreen());
            }
          });
        }
      }),
      Items_Drawer('السله', Icons.add_shopping_cart, () {
        // navigateTo(context: context, widget: UserBasket());
        showToast(text: 'سيتم أضافتها قريبا...', state: ToastState.WARNING);
      }),
      Items_Drawer('عنواني', Icons.location_on, () {
        showToast(text: 'سيتم أضافتها قريبا...', state: ToastState.WARNING);
      }),
      Items_Drawer(
        'الرسائل',
        Icons.chat,
        () {
          launchWhatsapp("+201016257980", "");
        },
      ),
      Items_Drawer('الاعدادات', Icons.settings, () {
        showToast(text: 'سيتم أضافتها قريبا...', state: ToastState.WARNING);
      }),
      Items_Drawer(
        'الخصوصيه والامان',
        Icons.security,
        () {
          showToast(text: 'سيتم أضافتها قريبا...', state: ToastState.WARNING);
        },
      ),

    ];

    return Container(
      color: Color.fromRGBO(58, 86, 156,1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
               SizedBox(height: MediaQuery.of(context).size.height*.08,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 50.0,
                        child: CircleAvatar(
                          radius: 48.0,
                          backgroundImage: NetworkImage(
                              'https://image.freepik.com/free-vector/delivery-service-with-mask-concept_23-2148505104.jpg'
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4,),
                    // Text('اطلب',style: TextStyle(
                    //   fontSize: 20,
                    //   fontFamily: 'Lemonada',
                    //
                    // ))
                  ],
                ),
                SizedBox(height: 30,),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          Block_Line_Drawer(Items[index]),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                      itemCount: Items.length),
                ),
                Container(
                  child: InkWell(
                      onTap: () {
                            CacheHelper.removeData(key: 'uId');
                            uId = '';
                            navigateAndRemove(context: context, widget: LoginScreen());
                            },
                      child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                              SizedBox(
                              width: 15,
                              ),
                              Icon(
                                Icons.logout,
                                color: Colors.black,
                              ),
                              SizedBox(
                              width: 12,
                              ),
                              Text('تسجيل الخروج',
                              style: TextStyle(fontSize: 15, fontFamily: 'OpenSans')),
                              ],
                      ),
                  ),
                 ),
                SizedBox(height: 70,),

        ],

      ),
    );
  }
}

Widget Block_Line_Drawer(Items_Drawer model) {
  return Container(
    child: InkWell(
      onTap: () {
        model.function!();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 15,
          ),
          Icon(model.icon),
          SizedBox(
            width: 12,
          ),
          Text('${model.text}',
              style: TextStyle(fontSize: 15, fontFamily: 'OpenSans')),
        ],
      ),
    ),
  );
}