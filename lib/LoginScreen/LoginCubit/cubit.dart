import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/LoginScreen/LoginCubit/state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(AppLoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  var loginModel;

  void userLogin({
    required String phone,
  }) {
    emit(AppLoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: '$phone@talabat.com',
      password: phone,
    ).then((value){
      emit(AppLoginSuccessState(value.user!.uid));
      showToast(text: 'تم التسجيل بنجاح', state: ToastState.SUCCESS);
    }).catchError((error){
      print('Error when login : ${error.toString()}');
      emit(AppLoginErrorState(error.toString()));
    });
  }

}
