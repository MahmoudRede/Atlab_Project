
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/Componants/constants.dart';
import 'package:talabatak/Models/RestaurantModel.dart';
import 'package:talabatak/Models/UserModel.dart';
import 'package:talabatak/Models/itemModel.dart';
import 'package:talabatak/Modules/ProfileScreen/profileScreen.dart';
import 'package:talabatak/SharedPreference/CacheHelper.dart';
import 'package:talabatak/talabatak_bloc/states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(intailstate());

  static AppCubit get(context)=> BlocProvider.of(context);

  UserModel ?usermodel;


  List <String>Places=['كشري و طواجن','مشويات','اسماك','كل الفئات','لحوم و خضروات','كريب/سوري','بيتزا','Restaurant','كل المطاعم'];

  String ?selectedplace='كل المطاعم';

  void SelectedPlace(newvalue){

    selectedplace=newvalue;
    emit(SelectedPlaceState());
  }

  List <String>Areas=['كفر الشوبك','كفر شبين','طحا','شبين','كل المناطق'];

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
         usermodel=UserModel.fromFire(value.data()!);
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

    else{print('error');}

  }


  //List<RestaurantModel> restaurantsDetails = [];

  void getShbinRestaurantDetails ()
  {
    // مطعم Wings
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


  }


  void getTahaRestaurantDetails ()
  {
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
  }


}





