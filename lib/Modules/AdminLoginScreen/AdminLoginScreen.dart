import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/Modules/AdminScreen/adminScreen.dart';
import 'package:talabatak/talabatak_bloc/cubit.dart';
import 'package:talabatak/talabatak_bloc/states.dart';

class AdminLoginScreen extends StatelessWidget {

  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
     listener: (context,state){

     },
    builder:(context,state){
       return Directionality(
         textDirection: TextDirection.rtl,
         child: Scaffold(
           appBar: AppBar(
             title: Text('ادمن'),
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
                         height: 70.0,
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
                             textDirection: TextDirection.rtl,
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
                               if(phoneController.text=='01277556432'){
                                 // AppCubit.get(context).getOrder();
                                 AppCubit.get(context).getInf(context);
                                 navigateTo(context: context, widget: adminScreen());

                               }
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

         ),
       );
    }
    );
  }
}
