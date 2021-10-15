import 'package:flutter/cupertino.dart';
import 'package:talabatak/Models/itemModel.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen1.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen10.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen11.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen12.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen2.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen3.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen4.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen5.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen6.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen7.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen8.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen9.dart';

String ?uId = '';
List <ItemModel>  userOrders = [];
List <int> itemNumber = [];
// مطاعم شبين

List <String> wingsTabs = ['وجبات' ,'برجر', 'وجبات عائلية' ];
List <String> elBakTabs = ['وجبات' , 'وجبات عائلية' , 'شندوتشات' , 'اضافات' ];
List <String> pizzaBremoTabs = ['شرقى'];
List <String> taboshElsoryTabs = ['وجبات' , 'فراخ' , 'فتات' , 'شاورما' , 'سندوتشات' , 'برجر' , 'الحلو' , 'البروسات' , 'اضافات'];
List <String> kosharyHendTabs = ['كشرى' , 'طواجن' , 'شرقى' , 'سندوتشات' , 'حواوشى' , 'ايطالى' ,  'الحو' , 'اضافات'];
List <String> elSoltanTabs = ['مكرونات' , 'مشويات' , 'كشرى' , 'كريب' ,  'طواجن' ,  'شرقى' , 'شاورما' , 'سندوتشات' , 'حواوشى' , 'ايطالى' , 'الحو' , 'اضافات' ];
List <String> batElknafaTabs = ['شرقى'];
List <String> frescoTabs = ['وجبات' , 'مشويات' ,  'كريب' , 'طواجن' ,  'شاورما' , 'سلاطات' , 'بيتزا' , 'برجر' , 'باستا' , 'اضافات'];
List <String> elAndalosTabs = ['فراخ' , 'طواجن' , 'شرقى' , 'ايطالى' , 'سندوتشات' , 'حواوشى' , 'الحو'];
List <String> gostom = ['وجبات عائلية' , 'وجبات' , 'مكرونات' , 'مشويات',  'كريب' , 'طواجن' ,  'سورى' , 'سندوتشات' ,  'سلاطات' , 'اضافات'];

List <Widget> wingsScreens = [Screen1(),  Screen2(),  Screen3()];
List <Widget> elBakScreens = [Screen3() ,  Screen4() , Screen2() , Screen1() ];
List <Widget> pizzaBremoScreens = [Screen1()];
List <Widget> taboshElsoryScreens = [Screen1(),  Screen2(),  Screen3() , Screen4() , Screen5(),  Screen6(),  Screen7() , Screen8() , Screen9()];
List <Widget> kosharyHendScreens = [Screen1(),  Screen2(),  Screen3() , Screen4() ,Screen5(),  Screen6(),  Screen7() , Screen8()];
List <Widget> elSoltanScreens = [Screen1(),  Screen2(),  Screen3() , Screen4() , Screen5(),  Screen6(),  Screen7() , Screen8() , Screen9(),  Screen10(),  Screen11() , Screen12()];
List <Widget> batElknafaScreens = [Screen1()];
List <Widget> frescoScreens = [Screen1(),  Screen2(),  Screen3() , Screen4() , Screen5(),  Screen6(),  Screen7() , Screen8(),  Screen9() , Screen10()];
List <Widget> elAndalosScreens = [Screen1(),  Screen2(),  Screen3() , Screen4() ,Screen5(),  Screen6(),  Screen7()];
List <Widget> gostomScreens = [Screen1(),  Screen2(),  Screen3() , Screen4() , Screen5(),  Screen6(),  Screen7() , Screen8() , Screen9(),  Screen10()];


// مطاعم طحا

List <String> mashwatHamzaTabs = ['وجبات' , 'مشويات' ,  'سندوتشات' ,  'حواوشى' ];
List <Widget> mashwatHamzaScreens = [Screen1(),  Screen2(),  Screen3() , Screen4()];
// كفر شبين

List <String> hatyEltkehTabs = ['سندوتشات','المطبخ','باستا','سلاطات','طواجن','فتات' , 'كريب' ,'مشويات'  ];
List <String> pizzaElmahdyTabs = ['شرقى' , 'ايطالى' , 'الحو' ,  'اضافات' ];
List <String> hamdaElmahataTabs = ['كشرى' ,  'وجبات' , 'اضافات' , 'طواجن' , 'الحو' , 'شاورما' ,  'سندوتشات' , 'حواوشى' , 'كريب' ];
List <String> kosharyHamadaTabs = ['كشرى' , 'اضافات' , 'طواجن' , 'الحلو' , 'حواوشى' ];
List <String> asmakAboMarimTabs = ['اسماك' , 'سندوتشات' , 'شوربة' , 'المطبخ' , 'طواجن' , 'وجبات' , 'الحلو' , 'اضافات'];
List <String> pizzaHumTabs = ['شرقى' , 'ايطالى' , 'الحو' ,  'اضافات' , 'بريك'];
List <String> pizzaElkhwagaTabs =  ['شرقى' , ' '];
List <String> pizzaElamiraTabs = ['شرقى' , 'ايطالى' , 'الحو'];
List <String> pizzaElhootTabs = ['شرقى' , 'ايطالى' , 'الحو' , 'كريب'];
List <String> pizzaElsafirTabs = ['شرقى' , 'ايطالى' , 'الحو' , 'حواوشى' , 'مكرونات' ,  'اضافات' ];
List <String> pizzaPoalaTabs = ['شرقى' , 'ايطالى' , 'الحلو' , 'حواوشي'  ];
List <String> crazyPizzaTabs = [ 'ايطالى'];
List <String> elAselTabs = ['مشويات' , 'كريب' , 'حواوشى' , 'مكرونات' , 'سندوتشات' , 'اضافات' , 'فتات' , 'وجبات' , 'شاورما' ];
List <String> hadrMotTabs = ['مشويات' , 'سندوتشات' , 'اضافات' , 'وجبات' , 'المطبخ' ];


List <Widget> hatyEltkehScreens = [Screen1(),  Screen2(),  Screen3() , Screen4() , Screen5(),Screen6() , Screen7() , Screen8()];
List <Widget> pizzaElmahdyScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() ];
List <Widget> hamdaElmahataScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1() , Screen1(),  Screen1() , Screen1() , Screen1()];
List <Widget> kosharyHamadaScreens = [Screen1(),  Screen2(),  Screen3() , Screen4() , Screen5() ];
List <Widget> asmakAboMarimScreens = [Screen1(),  Screen2(),  Screen3() , Screen4() , Screen5() , Screen6(),  Screen7() , Screen8() ];
List <Widget> pizzaHumScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1() ];
List <Widget> pizzaElkhwagaScreens =  [Screen1()];
List <Widget> pizzaElamiraScreens = [Screen1(),  Screen2(),  Screen3() ];
List <Widget> pizzaElhootScreens = [Screen1(),  Screen1(),  Screen1() , Screen1()];
List <Widget> pizzaElsafirScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1() , Screen1(), ];
List <Widget> pizzaPoalaScreens = [Screen1(),  Screen2(),  Screen3() , Screen4() ];
List <Widget> crazyPizzaScreens = [Screen1()];
List <Widget> elAselScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1() , Screen1(),  Screen1() , Screen1() , Screen1()];
List <Widget> hadrMotScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1() ];


// كفر الشوبك

List <String> pizzaElomdaTabs = ['شرقى' , 'ايطالى' , 'الفطائر' ,'الحو' , 'مكرونات' ,'بريك' ];
List <Widget> pizzaElomdaScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1()  , Screen1()];