
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/Componants/componant.dart';
import 'package:talabatak/Componants/constants.dart';
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

  ItemModel ?itemModel;

  List <ItemModel> detail=[];

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
            .doc('detail')
            .get()
            .then((value) {

          print(value.data());
          detail.add(ItemModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('كل الفئات')
            .collection('حضرموت المهندسين')
            .doc('detail')
            .get()
            .then((value) {

          print(value.data());
          detail.add(ItemModel.fromFire(value.data()!));

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get  : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('كل الفئات')
            .collection('مطعم و كشري حماده المحطه')
            .doc('detail')
            .get()
            .then((value) {

          print(value.data());
          detail.add(ItemModel.fromFire(value.data()!));

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });




        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('اسماك')
            .collection('اسماك ابو مريم')
            .doc('detail')
            .get()
            .then((value) {

          print(value.data());
          detail.add(ItemModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('كشري و طواجن')
            .collection('كشري حماده')
            .doc('detail')
            .get()
            .then((value) {

          print(value.data());
          detail.add(ItemModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('مشويات')
            .collection('حاتي التكيه')
            .doc('detail')
            .get()
            .then((value) {

          print(value.data());
          detail.add(ItemModel.fromFire(value.data()!)) ;

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
            .doc('detail')
            .get()
            .then((value) {

          print(value.data());
          detail.add(ItemModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('بيتزا')
            .collection('بيتزا هم')
            .doc('detail')
            .get()
            .then((value) {

          print(value.data());
          detail.add(ItemModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });

        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('بيتزا')
            .collection('بيتزا الاميره')
            .doc('detail')
            .get()
            .then((value) {

          print(value.data());
          detail.add(ItemModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });

        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('بيتزا')
            .collection('بيتزا الحوت')
            .doc('detail')
            .get()
            .then((value) {

          print(value.data());
          detail.add(ItemModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('بيتزا')
            .collection('بيتزا السفير')
            .doc('detail')
            .get()
            .then((value) {

          print(value.data());
          detail.add(ItemModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('بيتزا')
            .collection('بيتزا البوله')
            .doc('detail')
            .get()
            .then((value) {

          print(value.data());
          detail.add(ItemModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('بيتزا')
            .collection('بيتزا بوله')
            .doc('detail')
            .get()
            .then((value) {

          print(value.data());
          detail.add(ItemModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        FirebaseFirestore.instance
            .collection('كفر شبين')
            .doc('بيتزا')
            .collection('Crazy Pizza')
            .doc('detail')
            .get()
            .then((value) {

          print(value.data());
          detail.add(ItemModel.fromFire(value.data()!)) ;

          emit(AppGetItemDetailSuccessState());
        }).catchError((error) {
          print('Error when Get : ${error.toString()}');
          emit(AppGetItemDetailErrorState(error.toString()));
        });


        detail=[];

    }

    else if(resName=='كل الفئات' ){

      emit(AppGetItemDetailLoadingState());


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('كل الفئات')
          .collection('الاصيل')
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('كل الفئات')
          .collection('حضرموت المهندسين')
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!));

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get  : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('كل الفئات')
          .collection('مطعم و كشري حماده المحطه')
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!));

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      detail=[];



    }

    else if(resName=='اسماك'){

      emit(AppGetItemDetailLoadingState());

      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('اسماك')
          .collection('اسماك ابو مريم')
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      detail=[];

    }

    else if(resName=='كشري و طواجن' ){

      emit(AppGetItemDetailLoadingState());

      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('كشري و طواجن')
          .collection('كشري حماده')
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      detail=[];

    }

    else if(resName=='مشويات' ){

      emit(AppGetItemDetailLoadingState());

      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('مشويات')
          .collection('حاتي التكيه')
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      detail=[];

    }

    else if(resName=='بيتزا' ){

      emit(AppGetItemDetailLoadingState());


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('بيتزا المهدي')
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('بيتزا هم')
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('بيتزا الاميره')
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });

      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('بيتزا الحوت')
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('بيتزا السفير')
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('بيتزا البوله')
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('بيتزا بوله')
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      FirebaseFirestore.instance
          .collection('كفر شبين')
          .doc('بيتزا')
          .collection('Crazy Pizza')
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });









      detail=[];



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
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      detail=[];


    }

    else if(resName=='بيتزا'){

      emit(AppGetItemDetailLoadingState());


      FirebaseFirestore.instance
          .collection('كفر الشوبك')
          .doc('بينزا')
          .collection('بينزا العمده')
          .doc('detail')
          .get()
          .then((value) {

        print(value.data());
        detail.add(ItemModel.fromFire(value.data()!)) ;

        emit(AppGetItemDetailSuccessState());
      }).catchError((error) {
        print('Error when Get : ${error.toString()}');
        emit(AppGetItemDetailErrorState(error.toString()));
      });


      detail=[];

    }

    else{print('error');}

  }


  }

