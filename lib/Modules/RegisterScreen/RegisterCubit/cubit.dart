import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Models/UserModel.dart';
import 'package:talabatak/Modules/RegisterScreen/RegisterCubit/state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(AppRegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);


  void userRegister({
    required String name,
    required String phone,
    required String address,
  }) {
    emit(AppRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: '$phone@talabat.com',
      password: phone,
    )
        .then((value) {
      createUser(
        email: '$phone@talabat.com',
        name: name,
        phone: phone,
        uId: value.user!.uid,
        address: address,
      );
      emit(AppRegisterSuccessState());
    }).catchError((error) {
      print('Error when Register : ${error.toString()}');
      emit(AppRegisterErrorState(error));
    });
  }

  void createUser({
    required String email,
    required String name,
    required String phone,
    required String uId,
    required String address,
  }) {
    emit(AppRegisterLoadingState());

    UserModel model = UserModel(
      name: name,
      email: '$phone@talabat.com',
      phone: phone,
      uId: uId,
      address: address,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(AppCreateUserSuccessState());
    }).catchError((error) {
      print('Error when Register : ${error.toString()}');
      emit(AppCreateUserErrorState(error.toString()));
    });
  }


}
