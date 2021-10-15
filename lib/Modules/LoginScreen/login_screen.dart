import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/Modules/AdminLoginScreen/AdminLoginScreen.dart';
import 'package:talabatak/Modules/RegisterScreen/register_Screen.dart';
import 'package:talabatak/Modules/home_page/HomePageScreen.dart';
import 'package:talabatak/SharedPreference/CacheHelper.dart';
import 'LoginCubit/cubit.dart';
import 'LoginCubit/state.dart';

class LoginScreen extends StatelessWidget {
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit ,LoginStates>(
        listener: (context , state){
          if(state is AppLoginErrorState){
            showToast(text: state.error, state: ToastState.ERROR);
          }
          if(state is AppLoginSuccessState) {
            CacheHelper.saveData(
                key:'uId',
                value: state.uId).then((value)
            {
              navigateAndRemove(
                context: context,
                widget: HomePageScreen(),
              );
            });
          }
        },
        builder: (context , state){
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.0,
                        ),
                        CircleAvatar(
                          radius: 75.0,
                          child: Image(
                            image: AssetImage('assets/images/login.jpeg'),
                          ),
                        ),
                        SizedBox(
                          height: 70.0,
                        ),
                        TextFormField(
                          controller: phoneController,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(58, 86, 156,1),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value){
                            if(value!.isEmpty)
                            {
                              return 'برجاء أدخال رقم الموبيل الصحيح';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'أدخل رقم الهاتف',

                            hintTextDirection: TextDirection.rtl,
                            suffixIcon: Icon(
                              Icons.phone,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(58, 86, 156,1),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueAccent,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return RegisterScreen();
                              }));
                            },
                            child: Text(
                              'أنشاء حساب جديد',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(58, 86, 156,1),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return AdminLoginScreen();
                              }));
                            },
                            child: Text(
                              'تسجيل الدخول كادمن',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(58, 86, 156,1),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(15.0),
                          color: Color.fromRGBO(58, 86, 156,1),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            height: 50.0,
                            onPressed: (){
                              if(formKey.currentState!.validate())
                                {
                                  LoginCubit.get(context).userLogin(phone: phoneController.text);
                                }
                            },
                            child: Text(
                              'دخول',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
