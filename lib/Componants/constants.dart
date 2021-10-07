import 'package:flutter/cupertino.dart';
import 'package:talabatak/Modules/MenuScreen/TabScreens/Screen1.dart';

String ?uId = '';

// مطاعم شبين

List <String> wingsTabs = ['وجبات' , 'وجبات عائلية' , 'برجر'];
List <String> elBakTabs = ['اضافات' , 'شندوتشات' , 'وجبات' , 'وجبات عائلية'];
List <String> pizzaBremoTabs = ['شرقى'];
List <String> taboshElsoryTabs = ['اضافات' , 'البروسات' , 'الحلو' , 'برجر' , 'سندوتشات' , 'شاورما' , 'فتات' , 'فراخ' , 'وجبات'];
List <String> kosharyHendTabs = ['اضافات' , 'الحو' , 'ايطالى' , 'حواوشى' , 'سندوتشات' , 'شرقى' , 'طواجن' , 'كشرى'];
List <String> elSoltanTabs = ['اضافات' , 'الحو' , 'ايطالى' , 'حواوشى' , 'سندوتشات' , 'شرقى' ,'شاورما' , 'طواجن' , 'كشرى' , 'كريب' , 'مشويات' , 'مكرونات' ];
List <String> batElknafaTabs = ['شرقى'];
List <String> frescoTabs = ['اضافات' , 'باستا' , 'برجر' , 'بيتزا' , 'سلاطات' , 'شاورما' , 'طواجن' , 'كريب' , 'مشويات' , 'وجبات'];
List <String> elAndalosTabs = ['الحو' , 'ايطالى' , 'حواوشى' , 'سندوتشات' , 'شرقى' , 'طواجن' , 'فراخ'];
List <String> gostom = ['مشويات', 'وجبات' , 'طواجن' , 'وجبات عائلية' , 'مكرونات' , 'اضافات' , 'سلاطات' , 'سندوتشات' , 'سورى' , 'كريب'];

List <Widget> wingsScreens = [Screen1(),  Screen1(),  Screen1()];
List <Widget> elBakScreens = [Screen1(),  Screen1(),  Screen1() , Screen1()];
List <Widget> pizzaBremoScreens = [Screen1()];
List <Widget> taboshElsoryScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1()];
List <Widget> kosharyHendScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() ,Screen1(),  Screen1(),  Screen1() , Screen1()];
List <Widget> elSoltanScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1(),  Screen1(),  Screen1() , Screen1()];
List <Widget> batElknafaScreens = [Screen1()];
List <Widget> frescoScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1(),  Screen1()];
List <Widget> elAndalosScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() ,Screen1(),  Screen1(),  Screen1()];
List <Widget> gostomScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1(),  Screen1()];


// مطاعم طحا

List <String> mashwatHamzaTabs = ['حواوشى' , 'سندوتشات' , 'مشويات' , 'وجبات'];
List <Widget> mashwatHamzaScreens = [Screen1(),  Screen1(),  Screen1() , Screen1()];
// كفر شبين

List <String> hatyEltkehTabs = ['مشويات' , 'كريب' , 'باستا' , 'سندوتشات' , 'طواجن' ];
List <String> pizzaElmahdyTabs = ['شرقى' , 'ايطالى' , 'الحو' ,  'اضافات' ];
List <String> hamdaElmahataTabs = ['كشرى' ,  'وجبات' , 'اضافات' , 'طواجن' , 'الحو' , 'شاورما' ,  'سندوتشات' , 'حواوشى' , 'كريب' ];
List <String> kosharyHamadaTabs = ['كشرى' , 'اضافات' , 'طواجن' , 'الحو' , 'حواوشى' ];
List <String> asmakAboMarimTabs = ['اسماك' , 'سندوتشات' , 'شوربة' , 'المطبخ' , 'طواجن' , 'وجبات' , 'الحلو' , 'اضافات'];
List <String> pizzaHumTabs = ['شرقى' , 'ايطالى' , 'الحو' ,  'اضافات' , 'بريك'];
List <String> pizzaElkhwagaTabs =  ['شرقى' , ' '];
List <String> pizzaElamiraTabs = ['شرقى' , 'ايطالى' , 'الحو'];
List <String> pizzaElhootTabs = ['شرقى' , 'ايطالى' , 'الحو' , 'كريب'];
List <String> pizzaElsafirTabs = ['شرقى' , 'ايطالى' , 'الحو' , 'حواوشى' , 'مكرونات' ,  'اضافات' ];
List <String> pizzaPoalaTabs = ['شرقى' , 'ايطالى' , 'الحو' , 'حواوشى'  ];
List <String> crazyPizzaTabs = [ 'ايطالى'];
List <String> elAselTabs = ['مشويات' , 'كريب' , 'حواوشى' , 'مكرونات' , 'سندوتشات' , 'اضافات' , 'فتات' , 'وجبات' , 'شاورما' ];
List <String> hadrMotTabs = ['مشويات' , 'سندوتشات' , 'اضافات' , 'وجبات' , 'المطبخ' ];


List <Widget> hatyEltkehScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1()];
List <Widget> pizzaElmahdyScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() ];
List <Widget> hamdaElmahataScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1() , Screen1(),  Screen1() , Screen1() , Screen1()];
List <Widget> kosharyHamadaScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1() ];
List <Widget> asmakAboMarimScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1() , Screen1(),  Screen1() , Screen1() ];
List <Widget> pizzaHumScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1() ];
List <Widget> pizzaElkhwagaScreens =  [Screen1()];
List <Widget> pizzaElamiraScreens = [Screen1(),  Screen1(),  Screen1() ];
List <Widget> pizzaElhootScreens = [Screen1(),  Screen1(),  Screen1() , Screen1()];
List <Widget> pizzaElsafirScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1() , Screen1(), ];
List <Widget> pizzaPoalaScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() ];
List <Widget> crazyPizzaScreens = [Screen1()];
List <Widget> elAselScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1() , Screen1(),  Screen1() , Screen1() , Screen1()];
List <Widget> hadrMotScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1() ];


// كفر الشوبك

List <String> pizzaElomdaTabs = ['شرقى' , 'ايطالى' , 'الفطائر' ,'الحو' , 'مكرونات' ,'بريك' ];
List <Widget> pizzaElomdaScreens = [Screen1(),  Screen1(),  Screen1() , Screen1() , Screen1()  , Screen1()];