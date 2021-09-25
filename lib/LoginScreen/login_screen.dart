import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/LoginScreen/LoginCubit/cubit.dart';
import 'package:talabatak/LoginScreen/LoginCubit/state.dart';
import 'package:talabatak/RegisterScreen/register_Screen.dart';
import 'package:talabatak/SharedPreference/CacheHelper.dart';
import 'package:talabatak/home_page/HomePageScreen.dart';

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
            appBar: AppBar(),
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
                            image: AssetImage('assets/images/login.jpg'),
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
                            color: Color(0xFF341f97),
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
                                color: Colors.orange,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
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
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                        Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.orange,
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
