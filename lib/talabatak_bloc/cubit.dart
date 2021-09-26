import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talabatak/talabatak_bloc/states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(intailstate());

  static AppCubit get(context)=> BlocProvider.of(context);

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

}