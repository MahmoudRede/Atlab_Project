
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/Componants/constants.dart';
import 'package:talabatak/Models/UserModel.dart';
import 'package:talabatak/Modules/ProfileScreen/profileScreen.dart';
import 'package:talabatak/SharedPreference/CacheHelper.dart';
import 'package:talabatak/talabatak_bloc/states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(intailstate());

  static AppCubit get(context)=> BlocProvider.of(context);

  UserModel ?usermodel;


  List <String>Places=['كل المطاعم','كشري','مشويات','بيتزا'];

  String ?selectedplace='كل المطاعم';

  void SelectedPlace(newvalue){

    selectedplace=newvalue;
    emit(SelectedPlaceState());
  }

  List <String>Areas=['كل المناطق','شبين','طوخ','منوف'];

  String ?selectedarea='كل المناطق';

  void SelectedArea(newvalue){

    selectedarea=newvalue;
    emit(SelectedAreaState());
  }

  var numberOfItem=1;

  void plusNumberOfItem(){

    numberOfItem+=1;
    emit(PlusNumberOfItemState());
  }

  void minesNumberOfItem(){

    numberOfItem>1?numberOfItem-=1:numberOfItem=1;
    emit(MinesNumberOfItemState());
  }


  void getUser(context) {
    emit(AppGetUserLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(CacheHelper.getData(key: 'uId'))
        .get()
        .then((value) {
         print(value.data());
         usermodel=UserModel.fromFire(value.data()!);
         navigateTo(context: context, widget: ProfileScreen());
         emit(AppGetUserSuccessState());
    }).catchError((error) {
      print('Error when Register : ${error.toString()}');
      emit(AppGetUserErrorState(error.toString()));
    });
  }



}