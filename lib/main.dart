import 'package:flutter/material.dart';
import 'package:weather/screens/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit/api_data_cubit_dart_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider<ApiDataCubit>(
          create: (context) => ApiDataCubit(),
          child:const MainScreen(),
        ));
  }
}

// // class MainScreen extends StatefulWidget {
// //   @override
// //   State<MainScreen> createState() => _MainScreenState();
// // }

// // class _MainScreenState extends State<MainScreen> {
//   // 
//   // final weekDays = [
//   //   'Monday',
//   //   'Tuesday',
//   //   'Wednesday',
//   //   'Thursday',
//   //   'Saturday',
//   //   'Sunday',
//   //   'Monday',
//   //   'Tuesday',
//   //   'Wednesday',
//   //   'Thursday',
//   // ];

//   // @override
//   // void initState() {
//   //   getUserData();
//   //   super.initState();
//   // }

//   



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   // backgroundColor: const Color(0xFF4FC3F7),
//       //   elevation: 0,
//       //   toolbarHeight: 80,
//       //   // default is 56
//       //   // toolbarOpacity: 0.5,

//       //   actions: const [
//       //     Icon(Icons.book_outlined),
//       //     SizedBox(
//       //       width: 20,
//       //     ),
//       //     Icon(
//       //       Icons.more_vert_outlined,
//       //       size: 20,
//       //     ),
//       //     SizedBox(
//       //       width: 20,
//       //     ),
//       //   ],
//       // ),
//       // backgroundColor: const Color(0xFF4FC3F7),
//       body: Container(
//         // height: MediaQuery.of(context).size.height,

//         ),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 10,
//                 ),
//                 //
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Icon(Icons.book_outlined),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Icon(
//                       Icons.more_vert_outlined,
//                       size: 20,
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 const Text('Mahammadpur',
//                     style: TextStyle(
//                       fontSize: 30,
//                       color: Colors.white,
//                     )),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Icon(
//                   Icons.location_pin,
//                   size: 12,
//                   color: Colors.white,
//                 ),
//                 const SizedBox(
//                   height: 150,
//                 ),

//                 Row(
//                   children: [
//                     Container(
//                       child: Text(
//                         "29°",
//                         style: TextStyle(fontSize: 65),
//                       ),
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           child: Text(
//                             "c ",
//                             style: TextStyle(fontSize: 28),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       resData.forecast?.forecastday?[0].hour?[0].condition!.text
//                               .toString() ??
//                           '',
//                       style: TextStyle(fontSize: 28),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       DateFormat('d MMMM EE ').format(DateTime.now()),
//                       style: TextStyle(fontSize: 15),
//                     ),
//                     Text(
//                       resData.current?.tempC.toString() ?? '',
//                     ),
//                     Text("/"),
//                     Text(
//                       resData.current?.tempF.toString() ?? '',
//                     ),
//                   ],
//                 ),

//                 // const Text(
//                 //   "4 aug mon 31°c/27°c ",
//                 // ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 isLoading ? const CircularProgressIndicator() : Container(),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * .15,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: resData.forecast?.forecastday?[0].hour?.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: const EdgeInsets.only(right: 10),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(DateFormat('KK:mm a').format(DateTime.parse(
//                                 resData.forecast!.forecastday![0].hour![index]
//                                     .time!))),
//                             // Text(GetTimeFromTimeEpoch.dataChanger(
//                             //     DateTime.now())),

//                             // Text("$GetTimeFromTimeEpoch()");

//                             //   resData.forecast?.forecastday?[0].hour?[index]
//                             //           .time
//                             //           .toString() ??
//                             //       '',
//                             //   style: const TextStyle(
//                             //       fontSize: 18, color: Colors.white),
//                             // ),
//                             // const SizedBox(
//                             //   height: 20,
//                             // ),
//                             Container(
//                               child: Image(
//                                 image: NetworkImage(
//                                     "http:${resData.forecast?.forecastday?[0].hour?[index].condition!.icon}",
//                                     scale: 1),
//                                 // width: 20,
//                                 // height: 20,
//                                 // fit: BoxFit.cover,
//                               ),
//                             ),
//                             // const SizedBox(
//                             //   height: 30,
//                             // ),

//                             Text(
//                               resData.forecast?.forecastday?[0].hour?[index]
//                                       .tempC
//                                       .toString() ??
//                                   '',
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: 10,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       //crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(weekDays[index]),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image(
//                               image: NetworkImage(
//                                 "http:${resData.forecast?.forecastday?[0].hour?[index].condition!.icon}",
//                               ),
//                               width: 30,
//                               height: 30,
//                               fit: BoxFit.cover,
//                             ),
//                             Text(
//                               resData.forecast?.forecastday?[0].hour?[0]
//                                       .condition!.text
//                                       .toString() ??
//                                   '',
//                             ),
//                           ],
//                         ),
//                         Text(
//                             '${resData.forecast?.forecastday?[0].hour?[index].cloud} / ${resData.forecast?.forecastday?[0].hour?[index].tempC}'),
//                       ],
//                     );
//                   },
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Text("Weather Details"),
//                 SizedBox(
//                   height: 40,
//                 ),

//                 GridView.count(
//                   physics: NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   padding: const EdgeInsets.all(40),
//                   // crossAxisSpacing: 10,
//                   crossAxisCount: 2,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.only(
//                         right: 40,
//                       ),
//                       child: Column(
//                         children: [
//                           Text(
//                             "Feels like",
//                             style: TextStyle(
//                               fontSize: 18,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 6,
//                           ),
//                           Text(
//                             resData.forecast?.forecastday?[0].hour?[1]
//                                     .feelslikeC
//                                     .toString() ??
//                                 '',
//                             style: TextStyle(fontSize: 30),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(
//                         left: 40,
//                       ),
//                       child: Column(
//                         children: [
//                           Text(
//                             "Humidity",
//                             style: TextStyle(
//                               fontSize: 18,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 6,
//                           ),
//                           Text(
//                             resData.forecast?.forecastday?[0].hour?[1].humidity
//                                     .toString() ??
//                                 '',
//                             style: TextStyle(fontSize: 30),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(
//                         right: 40,
//                       ),
//                       child: Column(
//                         children: [
//                           Text(
//                             "W Wind",
//                             style: TextStyle(
//                               fontSize: 18,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 6,
//                           ),
//                           Text(
//                             resData.forecast?.forecastday?[0].hour?[1].windKph
//                                     .toString() ??
//                                 '',
//                             style: TextStyle(fontSize: 30),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(
//                         left: 40,
//                       ),
//                       child: Column(
//                         children: [
//                           Text(
//                             "UV",
//                             style: TextStyle(
//                               fontSize: 18,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 6,
//                           ),
//                           Text(
//                             resData.forecast?.forecastday?[0].hour?[1].uv
//                                     .toString() ??
//                                 '',
//                             style: TextStyle(fontSize: 30),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(
//                         right: 40,
//                       ),
//                       child: Column(
//                         children: [
//                           Text(
//                             "visibility",
//                             style: TextStyle(
//                               fontSize: 18,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 6,
//                           ),
//                           Text(
//                             resData.forecast?.forecastday?[0].hour?[1].visMiles
//                                     .toString() ??
//                                 '',
//                             style: TextStyle(fontSize: 30),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(
//                         left: 40,
//                       ),
//                       child: Column(
//                         children: [
//                           Text(
//                             "Air pressure",
//                             style: TextStyle(
//                               fontSize: 18,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 6,
//                           ),
//                           Text(
//                             resData.forecast?.forecastday?[0].hour?[1]
//                                     .pressureMb
//                                     .toString() ??
//                                 '',
//                             style: TextStyle(fontSize: 30),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 )

//                 // Row(
//                 //   children: [
//                 //     Container(
//                 //       padding: EdgeInsets.only(
//                 //         left: 40,
//                 //       ),
//                 //       child: Column(
//                 //         children: [
//                 //           Text(
//                 //             "Feels like",
//                 //             style: TextStyle(
//                 //               fontSize: 18,
//                 //             ),
//                 //           ),
//                 //           SizedBox(
//                 //             height: 6,
//                 //           ),
//                 //           Text(
//                 //             resData.forecast?.forecastday?[0].hour?[1]
//                 //                     .feelslikeC
//                 //                     .toString() ??
//                 //                 '',
//                 //             style: TextStyle(fontSize: 30),
//                 //           )
//                 //         ],
//                 //       ),
//                 //     ),
//                 //     Container(
//                 //       padding: EdgeInsets.only(
//                 //         left: 110,
//                 //       ),
//                 //       child: Column(
//                 //         children: [
//                 //           Text(
//                 //             "Humidity",
//                 //             style: TextStyle(
//                 //               fontSize: 18,
//                 //             ),
//                 //           ),
//                 //           SizedBox(
//                 //             height: 6,
//                 //           ),
//                 //           Text(
//                 //             resData.forecast?.forecastday?[0].hour?[1].humidity
//                 //                     .toString() ??
//                 //                 '',
//                 //             style: TextStyle(fontSize: 30),
//                 //           )
//                 //         ],
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 // SizedBox(
//                 //   height: 40,
//                 // ),
//                 // Row(
//                 //   children: [
//                 //     Container(
//                 //       padding: EdgeInsets.only(
//                 //         left: 40,
//                 //       ),
//                 //       child: Column(
//                 //         children: [
//                 //           Text(
//                 //             "W Wind",
//                 //             style: TextStyle(
//                 //               fontSize: 18,
//                 //             ),
//                 //           ),
//                 //           SizedBox(
//                 //             height: 6,
//                 //           ),
//                 //           Text(
//                 //             resData.forecast?.forecastday?[0].hour?[1].windKph
//                 //                     .toString() ??
//                 //                 '',
//                 //             style: TextStyle(fontSize: 30),
//                 //           )
//                 //         ],
//                 //       ),
//                 //     ),
//                 //     Container(
//                 //       padding: EdgeInsets.only(
//                 //         left: 140,
//                 //       ),
//                 //       child: Column(
//                 //         children: [
//                 //           Text(
//                 //             "UV",
//                 //             style: TextStyle(
//                 //               fontSize: 18,
//                 //             ),
//                 //           ),
//                 //           SizedBox(
//                 //             height: 6,
//                 //           ),
//                 //           Text(
//                 //             resData.forecast?.forecastday?[0].hour?[1].uv
//                 //                     .toString() ??
//                 //                 '',
//                 //             style: TextStyle(fontSize: 30),
//                 //           )
//                 //         ],
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 // SizedBox(
//                 //   height: 40,
//                 // ),
//                 // Row(
//                 //   children: [
//                 //     Container(
//                 //       padding: EdgeInsets.only(
//                 //         left: 40,
//                 //       ),
//                 //       child: Column(
//                 //         children: [
//                 //           Text(
//                 //             "visibility",
//                 //             style: TextStyle(
//                 //               fontSize: 18,
//                 //             ),
//                 //           ),
//                 //           SizedBox(
//                 //             height: 6,
//                 //           ),
//                 //           Text(
//                 //             resData.forecast?.forecastday?[0].hour?[1].visMiles
//                 //                     .toString() ??
//                 //                 '',
//                 //             style: TextStyle(fontSize: 30),
//                 //           )
//                 //         ],
//                 //       ),
//                 //     ),
//                 //     Container(
//                 //       padding: EdgeInsets.only(
//                 //         left: 110,
//                 //       ),
//                 //       child: Column(
//                 //         children: [
//                 //           Text(
//                 //             "Air pressure",
//                 //             style: TextStyle(
//                 //               fontSize: 18,
//                 //             ),
//                 //           ),
//                 //           SizedBox(
//                 //             height: 6,
//                 //           ),
//                 //           Text(
//                 //             resData.forecast?.forecastday?[0].hour?[1]
//                 //                     .pressureMb
//                 //                     .toString() ??
//                 //                 '',
//                 //             style: TextStyle(fontSize: 30),
//                 //           )
//                 //         ],
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
