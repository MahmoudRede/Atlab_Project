
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/Componants/constants.dart';
import 'package:talabatak/Models/RestaurantModel.dart';
import 'package:talabatak/Models/UserModel.dart';
import 'package:talabatak/Models/itemModel.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen1.dart';
import 'package:talabatak/Modules/ProfileScreen/profileScreen.dart';
import 'package:talabatak/SharedPreference/CacheHelper.dart';
import 'package:talabatak/talabatak_bloc/states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(intailstate());

  static AppCubit get(context)=> BlocProvider.of(context);

  UserModel ?userModel;


  List <String> places = ['كشري و طواجن','مشويات','اسماك','كل الفئات','لحوم و خضروات','كريب/سوري','بيتزا','Restaurant','كل المطاعم'];

  String ?selectedPlace='كل المطاعم';

  void SelectedPlace(newvalue){

    selectedPlace=newvalue;
    emit(SelectedPlaceState());
  }

  List <String>Areas = ['كفر الشوبك','كفر شبين','طحا','شبين','كل المناطق'];

  String? selectedarea = 'كل المناطق';

  void selectedArea(newValue){

    selectedarea = newValue;
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
         userModel=UserModel.fromFire(value.data()!);
         navigateTo(context: context, widget: ProfileScreen());
         emit(AppGetUserSuccessState());
    }).catchError((error) {
      print('Error when Register : ${error.toString()}');
      emit(AppGetUserErrorState(error.toString()));
    });
  }


  RestaurantModel ?itemModel;

  List <RestaurantModel> restaurantsDetails=[];

  void getItemKafrShaben({
    required String resName,
    // required String areaName
  })
  {


    if(resName=='كل المطاعم' ){

        emit(AppGetItemDetailLoadingState());


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('كل الفئات')
            .collection('الاصيل')
            .doc('details')
            .get()
            .then((value) {
          print(value.data());
          restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;
          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('كل الفئات')
            .collection('حضرموت المهندسين')
            .doc('details')
            .get()
            .then((value) {

          print(value.data());
          restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get  : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('كل الفئات')
            .collection('مطعم و كشري حماده المحطه')
            .doc('details')
            .get()
            .then((value) {

          print(value.data());
          restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });



        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('اسماك')
            .collection('اسماك ابو مريم')
            .doc('details')
            .get()
            .then((value) {

          print(value.data());
          restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('كشري و طواجن')
            .collection('كشري حماده')
            .doc('details')
            .get()
            .then((value) {

          print(value.data());
          restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('مشويات')
            .collection('حاتي التكيه')
            .doc('details')
            .get()
            .then((value) {

          print(value.data());
          restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        emit(AppGetItemDetailLoadingState());


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('بيتزا')
            .collection('بيتزا المهدي')
            .doc('details')
            .get()
            .then((value) {

          print(value.data());
          restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('بيتزا')
            .collection('بيتزا هم')
            .doc('details')
            .get()
            .then((value) {

          print(value.data());
          restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });

        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('بيتزا')
            .collection('بيتزا الاميره')
            .doc('details')
            .get()
            .then((value) {

          print(value.data());
          restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });

        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('بيتزا')
            .collection('بيتزا الحوت')
            .doc('details')
            .get()
            .then((value) {

          print(value.data());
          restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('بيتزا')
            .collection('بيتزا السفير')
            .doc('details')
            .get()
            .then((value) {

          print(value.data());
          restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('بيتزا')
            .collection('بيتزا البوله')
            .doc('details')
            .get()
            .then((value) {

          print(value.data());
          restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('بيتزا')
            .collection('بيتزا بوله')
            .doc('details')
            .get()
            .then((value) {

          print(value.data());
          restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('بيتزا')
            .collection('Crazy Pizza')
            .doc('details')
            .get()
            .then((value) {

          print(value.data());
          restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        restaurantsDetails=[];

    }

    else if(resName=='كشري و طواجن' ){

      emit(AppGetItemDetailLoadingState());

      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('كشري و طواجن')
          .collection('كشري حماده')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      restaurantsDetails=[];

    }

    else if(resName=='مشويات' ){

      emit(AppGetItemDetailLoadingState());

      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('مشويات')
          .collection('حاتي التكيه')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      restaurantsDetails=[];

    }

    else if(resName=='اسماك'){

      emit(AppGetItemDetailLoadingState());

      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('اسماك')
          .collection('اسماك ابو مريم')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      restaurantsDetails=[];

    }

    else if(resName=='كل الفئات' ){

      emit(AppGetItemDetailLoadingState());


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('كل الفئات')
          .collection('الاصيل')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('كل الفئات')
          .collection('حضرموت المهندسين')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get  : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('كل الفئات')
          .collection('مطعم و كشري حماده المحطه')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      restaurantsDetails=[];



    }

    else if(resName=='لحوم و خضروات' ){

      restaurantsDetails=[];
    }

    else if(resName=='كريب/سوري' ){

      restaurantsDetails=[];
    }

    else if(resName=='بيتزا' ){

      emit(AppGetItemDetailLoadingState());


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('بيتزا المهدي')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('بيتزا هم')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('بيتزا الاميره')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('بيتزا الحوت')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('بيتزا السفير')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('بيتزا البوله')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('بيتزا بوله')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('Crazy Pizza')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });



      restaurantsDetails=[];

    }

    else if(resName=='Restaurant' ){

      restaurantsDetails=[];
    }

    else{print('error');}

  }

  void getItemKafrShobak({
    required String resName,
  })
  {

    if(resName=='كل المطاعم'){

      emit(AppGetItemDetailLoadingState());


      FirebaseFirestore.instance
          .collection('كفر الشوبك')
          .doc('بينزا')
          .collection('بينزا العمده')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      restaurantsDetails=[];


    }

    else if(resName=='بيتزا'){

      emit(AppGetItemDetailLoadingState());


      FirebaseFirestore.instance
          .collection('كفر الشوبك')
          .doc('بينزا')
          .collection('بينزا العمده')
          .doc('details')
          .get()
          .then((value) {

        print(value.data());
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      restaurantsDetails=[];

    }

    else if(resName=='لحوم و خضروات' ){

      restaurantsDetails=[];
    }

    else if(resName=='Restaurant' ){

      restaurantsDetails=[];
    }

    else if(resName=='كريب/سوري' ){

      restaurantsDetails=[];
    }

    else if(resName=='كل الفئات' ){

      restaurantsDetails=[];
    }

    else if(resName=='اسماك' ){

      restaurantsDetails=[];
    }

    else if(resName=='مشويات' ){

      restaurantsDetails=[];
    }

    else if(resName=='كشري و طواجن' ){

      restaurantsDetails=[];
    }

    else{print('error');}

  }


  //List<RestaurantModel> restaurantsDetails = [];

  void getShbinRestaurantDetails (
  {
     required String resName,
  })
  {

    if(resName=='كل المطاعم'){


      FirebaseFirestore.instance
          .collection('شبين')
          .doc('Restaurant')
          .collection('Wings')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get Wings : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      FirebaseFirestore.instance
          .collection('شبين')
          .doc('Restaurant')
          .collection('البيك')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get البيك : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      FirebaseFirestore.instance
          .collection('شبين')
          .doc('مشويات')
          .collection('مطعم جوستو')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get مطعم جوستو : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('شبين')
          .doc('بيتزا')
          .collection('بيتزا بريمو')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get بيتزا بريمو : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('شبين')
          .doc('كريب')
          .collection('طبوش السورى')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get طبوش السورى  : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('شبين')
          .doc('كشرى')
          .collection('كشرى هند')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get كشرى هند  : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('شبين')
          .doc('كل الفئات')
          .collection('fresco')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get fresco  : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('شبين')
          .doc('كل الفئات')
          .collection('السلطان')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get السلطان  : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });



      FirebaseFirestore.instance
          .collection('شبين')
          .doc('كل الفئات')
          .collection('بيت الكنافة')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get بيت الكنافة  : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      FirebaseFirestore.instance
          .collection('شبين')
          .doc('كل الفئات')
          .collection('مطعم الأندلس')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get مطعم الأندلس  : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      restaurantsDetails=[];


    }

    else if(resName=='Restaurant'){

      FirebaseFirestore.instance
          .collection('شبين')
          .doc('Restaurant')
          .collection('Wings')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get Wings : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      FirebaseFirestore.instance
          .collection('شبين')
          .doc('Restaurant')
          .collection('البيك')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get البيك : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      restaurantsDetails=[];


    }

    else if( resName == 'بيتزا'){

      FirebaseFirestore.instance
          .collection('شبين')
          .doc('بيتزا')
          .collection('بيتزا بريمو')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get بيتزا بريمو : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      restaurantsDetails=[];

    }

    else if (resName == 'مشويات')
    {
      FirebaseFirestore.instance
          .collection('شبين')
          .doc('مشويات')
          .collection('مطعم جوستو')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get مطعم جوستو : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      restaurantsDetails=[];
    }

    else if(resName=='كريب/سوري'){

      FirebaseFirestore.instance
          .collection('شبين')
          .doc('كريب')
          .collection('طبوش السورى')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get طبوش السورى  : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });
      restaurantsDetails=[];

    }

    else if(resName=='لحوم و خضروات' ){

      restaurantsDetails=[];
    }

    else if(resName=='اسماك' ){

      restaurantsDetails=[];
    }

    else if(resName=='مشويات' ){

      restaurantsDetails=[];
    }

    else if(resName =='كشري و طواجن'){


      FirebaseFirestore.instance
          .collection('شبين')
          .doc('كشرى')
          .collection('كشرى هند')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get كشرى هند  : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });
      restaurantsDetails=[];

    }

   else if(resName=='كل الفئات'){


      FirebaseFirestore.instance
          .collection('شبين')
          .doc('كل الفئات')
          .collection('fresco')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get fresco  : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('شبين')
          .doc('كل الفئات')
          .collection('السلطان')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get السلطان  : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });



      FirebaseFirestore.instance
          .collection('شبين')
          .doc('كل الفئات')
          .collection('بيت الكنافة')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get بيت الكنافة  : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      FirebaseFirestore.instance
          .collection('شبين')
          .doc('كل الفئات')
          .collection('مطعم الأندلس')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get مطعم الأندلس  : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      restaurantsDetails=[];

    }

    else{
      print('error');
    }


  }


  void getTahaRestaurantDetails ({
  required String resName,
})
  {
    if(resName=='كل المطاعم'){

      FirebaseFirestore.instance
          .collection('طحا')
          .doc('Restaurant')
          .collection('مشويات حمزه')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get مشويات حمزه : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      restaurantsDetails=[];

    }

   else if(resName=='Restaurant'){

      FirebaseFirestore.instance
          .collection('طحا')
          .doc('Restaurant')
          .collection('مشويات حمزه')
          .doc('details')
          .get()
          .then((value) {
        restaurantsDetails.add(RestaurantModel.fromFire(value.data()!));
        print(value.data());
        emit(AppGetItemDetailSuccessState());
      }).catchError((error){
        print('Error when get مشويات حمزه : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      restaurantsDetails=[];

    }

    else if(resName=='لحوم و خضروات' ){

      restaurantsDetails=[];
    }

    else if(resName=='بيتزا' ){

      restaurantsDetails=[];
    }

    else if(resName=='كريب/سوري' ){

      restaurantsDetails=[];
    }

    else if(resName=='كل الفئات' ){

      restaurantsDetails=[];
    }

    else if(resName=='اسماك' ){

      restaurantsDetails=[];
    }

    else if(resName=='مشويات' ){

      restaurantsDetails=[];
    }

    else if(resName=='كشري و طواجن' ){

      restaurantsDetails=[];
    }


  }



  List<String> tabs = [];
  List<Widget> tabsScreens = [];
  List<ItemModel> foodsScreen1=[];
  List<ItemModel> foodsScreen2=[];
  List<ItemModel> foodsScreen3=[];
  List<ItemModel> foodsScreen4=[];
  List<ItemModel> foodsScreen5=[];
  List<ItemModel> foodsScreen6=[];
  List<ItemModel> foodsScreen7=[];
  List<ItemModel> foodsScreen8=[];


  Future <void> changeTabs (
      {
    required String restaurantName
  })
  async {
    if(restaurantName == 'بيتزا بؤله')
    {
      tabs = pizzaPoalaTabs;
      tabsScreens = pizzaPoalaScreens;
      getPizzaBola();

    }
    else if (restaurantName == 'حاتى التكيه')
    {
        tabs = hatyEltkehTabs;
        tabsScreens = hatyEltkehScreens;
        getHatyeEltakya();

      }
    else if (restaurantName == 'مشويات حمزة')
    {
      tabs = mashwatHamzaTabs;
      tabsScreens = mashwatHamzaScreens;
    }
    else if (restaurantName == 'بيتزا الحوت')
    {
      tabs = pizzaElhootTabs;
      tabsScreens = pizzaElhootScreens;


    }
    else if (restaurantName == 'السلطان')
    {
      tabs = elSoltanTabs;
      tabsScreens = elSoltanScreens;
    }
    else if (restaurantName == 'مطعم و كشرى حمادة المحطة')
    {
      tabs = hamdaElmahataTabs;
      tabsScreens = hamdaElmahataScreens;
    }
    else if (restaurantName == 'طبوش السورى')
    {
      tabs = taboshElsoryTabs;
      tabsScreens = taboshElsoryScreens;
    }
    else if (restaurantName == 'مطعم الأندلس')
    {
      tabs = elAndalosTabs;
      tabsScreens = elAndalosScreens;
    }
    else if (restaurantName == 'Crazy Pizza')
    {
      tabs = crazyPizzaTabs;
      tabsScreens = crazyPizzaScreens;
    }
    else if (restaurantName == 'بيت الكنافة')
    {
      tabs = batElknafaTabs;
      tabsScreens = batElknafaScreens;
    }
    else if (restaurantName == 'بيتزا السفير')
    {
      tabs = pizzaElsafirTabs;
      tabsScreens = pizzaElsafirScreens;
    }
    else if (restaurantName == 'بيتزا العمدة')
    {
      tabs = pizzaElomdaTabs;
      tabsScreens = pizzaElomdaScreens;
    }
    else if (restaurantName == 'بيتزا بريمو')
    {
      tabs = pizzaBremoTabs;
      tabsScreens = pizzaBremoScreens;
    }
    else if (restaurantName == 'اسماك ابو مريم')
    {
      tabs = asmakAboMarimTabs;
      tabsScreens = asmakAboMarimScreens;
      getFishAbuMarim();


    }
    else if (restaurantName == 'بيتزا الأميرة')
    {
      tabs = pizzaElamiraTabs;
      tabsScreens = pizzaElamiraScreens;

    }
    else if (restaurantName == 'كشرى هند')
    {
      tabs = kosharyHendTabs;
      tabsScreens = kosharyHendScreens;
    }
    else if (restaurantName == 'حضر موت المهندسين')
    {
      tabs = hadrMotTabs;
      tabsScreens = hadrMotScreens;
    }
    else if (restaurantName == 'بيتزا هم')
    {
      tabs = pizzaHumTabs;
      tabsScreens = pizzaHumScreens;
    }
    else if (restaurantName == 'Wings')
    {
      tabs = wingsTabs;
      tabsScreens = wingsScreens;
      getWings();
    }
    else if (restaurantName == 'بيتزا المهدى')
    {
      tabs = pizzaElmahdyTabs;
      tabsScreens = pizzaElmahdyScreens;
    }
    else if (restaurantName == 'البيك')
    {
      tabs = elBakTabs;
      tabsScreens = elBakScreens;
    }
    else if (restaurantName == 'Fresco - فريسكو')
    {
      tabs = frescoTabs;
      tabsScreens = frescoScreens;
    }
    else if (restaurantName == 'كشرى حمادة')
    {
      tabs = kosharyHamadaTabs;
      tabsScreens = kosharyHamadaScreens;
      getKoshryHamada();

    }
    else if (restaurantName == 'الأصيل')
    {
      tabs = elAselTabs;
      tabsScreens = elAselScreens;
    }
    else if (restaurantName == 'مطعم جوستوم')
    {
      tabs = gostom;
      tabsScreens = gostomScreens;
    }

    emit(AppChangeTabsState());

  }




  void getPizzaBola(){

    // شرقي

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('شرقي')
        .collection('بسطرمه')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('شرقي')
        .collection('لحمه')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('شرقي')
        .collection('مشروم')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('شرقي')
        .collection('بوله')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('شرقي')
        .collection('بيف')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('شرقي')
        .collection('جبنه رومي')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('شرقي')
        .collection('تونه قطع')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('تونه مفتته')
        .doc('شرقي')
        .collection('لحمه')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('شرقي')
        .collection('سجق اسكندراني')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('شرقي')
        .collection('سوسيس')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('شرقي')
        .collection('فاهيتا فراخ')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('شرقي')
        .collection('فراخ')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('شرقي')
        .collection('مشكل جبن')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('شرقي')
        .collection('مشكل لحوم')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    // ايطالي

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('مارجريتا')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('مشروم')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('بسطرمه')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('بوله')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('بيفي')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('تشكين بربكيو')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('تونه قطع')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('تونه مفتته')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('خضروات')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('سجق اسكندراني')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('سوبر سوبريم')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('سوسيس')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('فاهيتا فراخ')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('فراخ')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('لحمه')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('مشكل جبن')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('ايطالي')
        .collection('مشكل لحوم')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    // الحلو

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('الحلو')
        .collection('بغاشه')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('الحلو')
        .collection('سكر')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('الحلو')
        .collection('شيكولاته')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('الحلو')
        .collection('قشطه و عسل')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('الحلو')
        .collection('كاستر')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    // حواوشي

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('حواوشي')
        .collection('سجق')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('بيتزا')
        .collection('بيتزا بوله')
        .doc('حواوشي')
        .collection('لحمه')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetPizzaBolaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetPizzaBolaErrorState());
    });


    foodsScreen1=[];
    foodsScreen2=[];
    foodsScreen3=[];
    foodsScreen4=[];
    foodsScreen5=[];
    foodsScreen6=[];
    foodsScreen7=[];
    foodsScreen8=[];





  }

  void getHatyeEltakya(){


    // سندوتشات

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سندوتشات')
        .collection('رغيف حواوشي')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سندوتشات')
        .collection('برجر جبنه فرنساوي')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سندوتشات')
        .collection('برجر التكيه فرنساوي')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سندوتشات')
        .collection('سندوتش بانيه فرنساوي')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سندوتشات')
        .collection('سندوتش برجر ساده - فرنساوي')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سندوتشات')
        .collection('سندوتش زنجر فرنساوي')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سندوتشات')
        .collection('سندوتش شيش فرنساوي')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سندوتشات')
        .collection('سندوتش فاهيتا فرنساوي')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سندوتشات')
        .collection('سندوتش كبده')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سندوتشات')
        .collection('سندوتش كرسبي فرنساوي')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سندوتشات')
        .collection('سندوتش كوردن بلو فرنساوي')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    // المطبخ


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('المطبخ')
        .collection('سمبوسك جبن')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('المطبخ')
        .collection('سمبوسك لحم')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('المطبخ')
        .collection('كريمه بالفراخ')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('المطبخ')
        .collection('كوارع مخليه')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('المطبخ')
        .collection('لسان عصفور')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('المطبخ')
        .collection('ورق عنب')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    // باستا

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('باستا')
        .collection('مكرونه الفريدو')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('باستا')
        .collection('مكرونه بالسجق')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('باستا')
        .collection('مكرونه بالكبده')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('باستا')
        .collection('مكرونه بشاميل')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('باستا')
        .collection('مكرونه بولونيز')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('باستا')
        .collection('مكرونه نجرسكو')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });


    // سلاطات

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سلاطات')
        .collection('بابا غنوج')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سلاطات')
        .collection('توميه')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سلاطات')
        .collection('سلطه بلدي')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سلاطات')
        .collection('سلطه طحينه')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سلاطات')
        .collection('طماطم مشوي')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('سلاطات')
        .collection('مخلل')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    // طواجن


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('طواجن')
        .collection('طاجن ارز معمر ساده')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('طواجن')
        .collection('طاجن ارز معمر لحمه')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('طواجن')
        .collection('طاجن التكيه')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('طواجن')
        .collection('طاجن باميه باللحمه')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('طواجن')
        .collection('طاجن تورلي لحمه')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('طواجن')
        .collection('طاجن سجق')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('طواجن')
        .collection('طاجن عكاوي')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('طواجن')
        .collection('طاجن ملوخيه')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('طواجن')
        .collection('طاجن ورق عنب كوارع')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    // فتات

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('فتات')
        .collection('فته كوارع')
        .doc('detail')
        .get().then((value) {
      foodsScreen6.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('فتات')
        .collection('فته لحمه')
        .doc('detail')
        .get().then((value) {
      foodsScreen6.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('فتات')
        .collection('فته موزه')
        .doc('detail')
        .get().then((value) {
      foodsScreen6.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    // كريب


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('كريب')
        .collection('كريب بانيه')
        .doc('detail')
        .get().then((value) {
      foodsScreen7.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('كريب')
        .collection('كريب برجر')
        .doc('detail')
        .get().then((value) {
      foodsScreen7.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('كريب')
        .collection('كريب بطاطس')
        .doc('detail')
        .get().then((value) {
      foodsScreen7.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('كريب')
        .collection('كريب زنجر')
        .doc('detail')
        .get().then((value) {
      foodsScreen7.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('كريب')
        .collection('كريب سجق')
        .doc('detail')
        .get().then((value) {
      foodsScreen7.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('كريب')
        .collection('كريب سوسيس')
        .doc('detail')
        .get().then((value) {
      foodsScreen7.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('كريب')
        .collection('كريب شيش طاووق')
        .doc('detail')
        .get().then((value) {
      foodsScreen7.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('كريب')
        .collection('كريب فاهيتا')
        .doc('detail')
        .get().then((value) {
      foodsScreen7.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('كريب')
        .collection('كريب كرسبي')
        .doc('detail')
        .get().then((value) {
      foodsScreen7.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('كريب')
        .collection('كريب كفته')
        .doc('detail')
        .get().then((value) {
      foodsScreen7.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('كريب')
        .collection('كريب مكس جبنه')
        .doc('detail')
        .get().then((value) {
      foodsScreen7.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    // مشويات

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('مشويات')
        .collection('ريش')
        .doc('detail')
        .get().then((value) {
      foodsScreen8.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('مشويات')
        .collection('شيش طاووق')
        .doc('detail')
        .get().then((value) {
      foodsScreen8.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('مشويات')
        .collection('طرب')
        .doc('detail')
        .get().then((value) {
      foodsScreen8.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('مشويات')
        .collection('طلب نيفه')
        .doc('detail')
        .get().then((value) {
      foodsScreen8.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('مشويات')
        .collection('فراخ تكا')
        .doc('detail')
        .get().then((value) {
      foodsScreen8.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('مشويات')
        .collection('فراخ مشويه شيش')
        .doc('detail')
        .get().then((value) {
      foodsScreen8.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('مشويات')
        .collection('كباب')
        .doc('detail')
        .get().then((value) {
      foodsScreen8.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('مشويات')
        .collection('كبده')
        .doc('detail')
        .get().then((value) {
      foodsScreen8.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('مشويات')
        .collection('حاتي التكيه')
        .doc('مشويات')
        .collection('كفته')
        .doc('detail')
        .get().then((value) {
      foodsScreen8.add(ItemModel.fromFire(value.data()!));
      emit(AppGetHatyeEltakiaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetHatyeEltakiaErrorState());
    });


    foodsScreen1=[];
    foodsScreen2=[];
    foodsScreen3=[];
    foodsScreen4=[];
    foodsScreen5=[];
    foodsScreen6=[];
    foodsScreen7=[];
    foodsScreen8=[];

  }

  void getFishAbuMarim(){

    // أسماك أبو مريم

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('اسماك')
        .collection('جمبري')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('اسماك')
        .collection('سبيط بلدي')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('اسماك')
        .collection('سمك بربوني')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('اسماك')
        .collection('سمك بلطي')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('اسماك')
        .collection('سمك بوري')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('اسماك')
        .collection('سمك تونه ماكريال')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('اسماك')
        .collection('سمك دنيس')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('اسماك')
        .collection('سمك فيليه')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('اسماك')
        .collection('سمك قاروص')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('اسماك')
        .collection('سمك مكرونه')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('اسماك')
        .collection('سمك قشر بياض')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    // سندوتشات

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('سندوتشات')
        .collection('سندوتش جمبري')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('سندوتشات')
        .collection('سندوتش سبيط')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });



    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('سندوتشات')
        .collection('سندوتش فيليه')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('سندوتشات')
        .collection('سندوتش كفته جمبري')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('سندوتشات')
        .collection('سندوتش ميكس')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    // شوربه


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('شوربه')
        .collection('شوربه جمبري بطارخ')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('شوربه')
        .collection('شوربه جمبري حمراء')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('شوربه')
        .collection('شوربه جمبري ميكس')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('شوربه')
        .collection('شوربه جمبري سي فود')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('شوربه')
        .collection('شوربه جمبري سي فود مخليه')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('شوربه')
        .collection('ملوخيه بالجمبري')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    // طواجن

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('طواجن')
        .collection('طاجن بطارخ')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('طواجن')
        .collection('طاجن جمبري صوص ابيض')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('طواجن')
        .collection('طاجن جمبري صوص احمر')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('طواجن')
        .collection('طاجن سبيط')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('طواجن')
        .collection('طاجن فيليه صوص ابيض')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('طواجن')
        .collection('طاجن فيليه صوص احمر')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('طواجن')
        .collection('طاجن ميكس')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('طواجن')
        .collection('طاجن مقطش')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    // وجبات

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('وجبات')
        .collection('وجبه جمبري فسفور')
        .doc('detail')
        .get().then((value) {
      foodsScreen6.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('وجبات')
        .collection('وجبه تونه ماكريال')
        .doc('detail')
        .get().then((value) {
      foodsScreen6.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('وجبات')
        .collection('وجبه بوري')
        .doc('detail')
        .get().then((value) {
      foodsScreen6.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('وجبات')
        .collection('وجبه بلطي')
        .doc('detail')
        .get().then((value) {
      foodsScreen6.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('وجبات')
        .collection('وجبه الفردين')
        .doc('detail')
        .get().then((value) {
      foodsScreen6.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('وجبات')
        .collection('وجبه العائله')
        .doc('detail')
        .get().then((value) {
      foodsScreen6.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    // المطبخ

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('المطبخ')
        .collection('ارز سي فود')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('المطبخ')
        .collection('ارز صياديه ساده')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('المطبخ')
        .collection('مكرونه صوص ابيض')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('المطبخ')
        .collection('مكرونه صوص احمر')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('المطبخ')
        .collection('ارز بالجمبري')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('المطبخ')
        .collection('ارز بالسبيط')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('المطبخ')
        .collection('ارز بالفليه')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    // الحلو


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('الحلو')
        .collection('وجبه ابو مريم')
        .doc('detail')
        .get().then((value) {
      foodsScreen7.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    // اضافات

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('اضافات')
        .collection('سلطه خضراء')
        .doc('detail')
        .get().then((value) {
      foodsScreen8.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('اضافات')
        .collection('سلطه طحينه')
        .doc('detail')
        .get().then((value) {
      foodsScreen8.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('اضافات')
        .collection('خيار مخلل')
        .doc('detail')
        .get().then((value) {
      foodsScreen8.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('اسماك')
        .collection('اسماك ابو مريم')
        .doc('اضافات')
        .collection('بابا غنوج')
        .doc('detail')
        .get().then((value) {
      foodsScreen8.add(ItemModel.fromFire(value.data()!));
      emit(AppGetAbuMariamFishSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetAbuMariamFishErrorState());
    });

    foodsScreen1=[];
    foodsScreen2=[];
    foodsScreen3=[];
    foodsScreen4=[];
    foodsScreen5=[];
    foodsScreen6=[];
    foodsScreen7=[];
    foodsScreen8=[];


  }

  void getKoshryHamada(){


    // كشري

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('كشري و طواجن')
        .collection('كشري حماده')
        .doc('كشري')
        .collection('علبه كماله')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetKosharyHamadaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetKosharyHamadaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('كشري و طواجن')
        .collection('كشري حماده')
        .doc('كشري')
        .collection('علبه حماده')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetKosharyHamadaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetKosharyHamadaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('كشري و طواجن')
        .collection('كشري حماده')
        .doc('كشري')
        .collection('علبه محمد صلاح')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetKosharyHamadaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetKosharyHamadaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('كشري و طواجن')
        .collection('كشري حماده')
        .doc('كشري')
        .collection('علبه الشبح')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetKosharyHamadaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetKosharyHamadaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('كشري و طواجن')
        .collection('كشري حماده')
        .doc('كشري')
        .collection('علبه ميكس')
        .doc('detail')
        .get().then((value) {
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetKosharyHamadaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetKosharyHamadaErrorState());
    });

    //طواجن

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('كشري و طواجن')
        .collection('كشري حماده')
        .doc('طواجن')
        .collection('طاجن لحمه')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetKosharyHamadaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetKosharyHamadaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('كشري و طواجن')
        .collection('كشري حماده')
        .doc('طواجن')
        .collection('طاجن لحمه كبير')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetKosharyHamadaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetKosharyHamadaErrorState());
    });

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('كشري و طواجن')
        .collection('كشري حماده')
        .doc('طواجن')
        .collection('طاجن فراخ عادي')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetKosharyHamadaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetKosharyHamadaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('كشري و طواجن')
        .collection('كشري حماده')
        .doc('طواجن')
        .collection('طاجن فراخ كبير')
        .doc('detail')
        .get().then((value) {
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetKosharyHamadaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetKosharyHamadaErrorState());
    });


    // حواوشي

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('كشري و طواجن')
        .collection('كشري حماده')
        .doc('حواوشي')
        .collection('حواوشي بلدي')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetKosharyHamadaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetKosharyHamadaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('كشري و طواجن')
        .collection('كشري حماده')
        .doc('حواوشي')
        .collection('حواوشي فراخ')
        .doc('detail')
        .get().then((value) {
      foodsScreen5.add(ItemModel.fromFire(value.data()!));
      emit(AppGetKosharyHamadaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetKosharyHamadaErrorState());
    });


    // الحلو

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('كشري و طواجن')
        .collection('كشري حماده')
        .doc('الحلو')
        .collection('ارز باللبن حلو')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetKosharyHamadaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetKosharyHamadaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('كشري و طواجن')
        .collection('كشري حماده')
        .doc('الحلو')
        .collection('بليله')
        .doc('detail')
        .get().then((value) {
      foodsScreen4.add(ItemModel.fromFire(value.data()!));
      emit(AppGetKosharyHamadaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetKosharyHamadaErrorState());
    });


    // اضافات

    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('كشري و طواجن')
        .collection('كشري حماده')
        .doc('اضافات')
        .collection('عيش توست')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetKosharyHamadaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetKosharyHamadaErrorState());
    });


    FirebaseFirestore.instance.collection('كفر شبين')
        .doc('كشري و طواجن')
        .collection('كشري حماده')
        .doc('اضافات')
        .collection('سلطه')
        .doc('detail')
        .get().then((value) {
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetKosharyHamadaSuccessState());

    }).catchError((error){
      print('Error');
      emit(AppGetKosharyHamadaErrorState());
    });

    foodsScreen1=[];
    foodsScreen2=[];
    foodsScreen3=[];
    foodsScreen4=[];
    foodsScreen5=[];
    foodsScreen6=[];
    foodsScreen7=[];
    foodsScreen8=[];


  }

  void getWings (){

    // وجبات

    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('برجر')
        .collection('دينر بوكس')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });

    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('برجر')
        .collection('سناك بوكس')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });


    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('برجر')
        .collection('سوبر دينر')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });


    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('برجر')
        .collection('سوبر ستربس')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });

    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('برجر')
        .collection('كيدز ميل')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });


    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('برجر')
        .collection('لايت استريس')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });

    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('برجر')
        .collection('مكس بوكس')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });


    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('برجر')
        .collection('ميجا ستربس')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });

    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('برجر')
        .collection('وجبة التوفير')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });


    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('برجر')
        .collection('وجبة وينجز')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen1.add(ItemModel.fromFire(value.data()!));
      print('menu : ${value.data()}');
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });

    // برجر

    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('وجبات')
        .collection('اونيون وينج')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });

    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('وجبات')
        .collection('بيج وينج طبقتين')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });

    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('وجبات')
        .collection('فيينا وينج')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });

    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('وجبات')
        .collection('كلاسيك وينج')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });


    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('وجبات')
        .collection('لاف تشيز')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });

    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('وجبات')
        .collection('موتز وينج')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });

    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('وجبات')
        .collection('موتزريلا لاف')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });

    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('وجبات')
        .collection('هوت وينج')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen2.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals');
      emit(AppGetMenusErrorState());
    });


    // وجبات عائليه


    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('وجبات عائلية')
        .collection('وجبة 12 قطعة')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals : ${error.toString()}');
      emit(AppGetMenusErrorState());
    });

    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('وجبات عائلية')
        .collection('وجبة 16 قطعة')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals : ${error.toString()}');
      emit(AppGetMenusErrorState());
    });

    FirebaseFirestore.instance.collection('شبين')
        .doc('Restaurant')
        .collection('Wings')
        .doc('وجبات عائلية')
        .collection('وجبة 8 قطع')
        .doc('detail')
        .get()
        .then((value){
      foodsScreen3.add(ItemModel.fromFire(value.data()!));
      emit(AppGetMenusSuccessState());
    }).catchError((error){
      print('Error when get wings Meals : ${error.toString()}');
      emit(AppGetMenusErrorState());
    });

    foodsScreen1=[];
    foodsScreen2=[];
    foodsScreen3=[];
    foodsScreen4=[];
    foodsScreen5=[];
    foodsScreen6=[];
    foodsScreen7=[];
    foodsScreen8=[];


  }




}




