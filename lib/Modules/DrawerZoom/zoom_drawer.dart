// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:talabatak/Modules/DrawerScreen/drawer_screen.dart';
// import 'package:talabatak/Modules/home_page/HomePageScreen.dart';
// import 'package:talabatak/talabatak_bloc/cubit.dart';
// import 'package:talabatak/talabatak_bloc/states.dart';
// import 'package:slide_drawer/slide_drawer.dart';
//
////
// class ZoomDrawer extends StatelessWidget {
//   const ZoomDrawer({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubit,AppStates>(
//       listener: (context,state){},
//       builder: (context,state){
//         return Scaffold(
//           body: SlideDrawer(
//           brightness: Brightness.dark,
//           contentDrawer: Container(
//             color: Colors.black,
//             padding: EdgeInsets.symmetric(horizontal: 5),
//             child: Column(
//               children: [
//                Text('Home',style: TextStyle(
//                  color: Colors.amber
//                ),),
//                Text('Project'),
//                 Text('Home'),
//                 Text('Project'),
//               ],
//             ),
//           ),
//           child: HomePageScreen(),
//         ),
//         );
//       },
//     );
//   }
// }