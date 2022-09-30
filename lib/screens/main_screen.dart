import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../cubit/cubit/api_data_cubit_dart_cubit.dart';
import '../model/response_model.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  TextEditingController _textController = TextEditingController();
  
  final weekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
  ];

  // Future<ResponseModel> getUserData(String cityName) async {
  //   isLoading = true;
  //   String url =
  //       "http://api.weatherapi.com/v1/forecast.json?key=40fc420f369e4a67a1771835222107&q=$cityName&days=10&aqi=no&alerts=no";
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     resData = ResponseModel.fromJson(data);
  //     log('------------------response list data :  $resData');
  //   } else {
  //     log('error in api');
  //   }

  //   return resData;
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getUserData("Kolkata").then((value) {
  //     print("IM done running");
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  //   super.initState();
  // }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child:Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.teal,
                      Colors.tealAccent,
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myAppBar(),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: myLocation(),
                        ),
                          BlocBuilder<ApiDataCubit, ApiDataState>(
                            builder: (context, state) {
                              log('arpan checking ############ $state');
                              if(state is ApiDataLoading)
                              {
                                log('arpan checking');
                                return Container(
                                   height: MediaQuery.of(context).size.height,
                                   child: const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                   ),
                                );
                              }
                              return Container(
                                height: MediaQuery.of(context).size.height,
                              );
                            },
                          )

                        // horizontaListview(),
                        // Padding(
                        //   padding: const EdgeInsets.all(16.0),
                        //   child: verticalListview(),
                        // ),
                        // const Padding(
                        //   padding: EdgeInsets.all(16.0),
                        //   child: Text(
                        //     'Weather details',
                        //     style: TextStyle(
                        //       color: Colors.black,
                        //       fontSize: 18,
                        //     ),
                        //   ),
                        // ),
                        // gridView(),
                       
                      ]),
                ),
              ),
      ),
    );
  }

  Widget myAppBar() {
    return Row(
      children: [
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.book_outlined)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
      ],
    );
  }

  Widget myLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _textController,
          decoration: InputDecoration(
              suffix: GestureDetector(
            onTap: () {
              // getUserData(_textController.text).then((value) {
              //   print("IM done running");
              //   setState(() {
              //     isLoading = false;
              //   });
              // });
              BlocProvider.of<ApiDataCubit>(context).getdeta(_textController.text);
            },
            child: Icon(Icons.search),
          )),
        ),
        Text(
          _textController.text,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Icon(
          Icons.location_pin,
          size: 12,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget horizontaListview(ResponseModel resData) {
    return Column(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                resData.current!.feelslikeC.toString(),
                style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '°C',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Text(
                      resData.forecast?.forecastday?[0].hour?[0].condition!.text
                              .toString() ??
                          '',
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${DateFormat('d MMMM EE ').format(DateTime.now())}  ${resData.forecast!.forecastday![0].day!.maxtempC}°C / ${resData.forecast!.forecastday![0].day!.mintempC}°C',
            style: TextStyle(color: Colors.white),
          ),
        ]),
        Container(
          margin: EdgeInsets.only(top: 40),
          height: 78,
          child: ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('KK:mm a').format(DateTime.parse(
                            resData.forecast!.forecastday![0].hour![index].time!)),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Image(
                        height: 40,
                        width: 40,
                        image: NetworkImage(
                          resData.forecast?.forecastday?[0].hour?[index].condition!
                                      .icon !=
                                  ''
                              ? "http:${resData.forecast?.forecastday?[0].hour?[index].condition!.icon}"
                              : 'no data',
                        ),
                      ),
                      Text(
                        resData.forecast?.forecastday?[0].hour?[index].tempC
                                .toString() ??
                            '',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                );
              })),
        ),
      ],
    );
  }

  Widget verticalListview(ResponseModel resData) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      height: 247,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: resData.forecast!.forecastday!.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(weekDays[index]),
                    Image(
                      image: NetworkImage(
                        resData.forecast?.forecastday?[index].hour?[12]
                                    .condition!.icon !=
                                ''
                            ? "http:${resData.forecast?.forecastday?[index].hour?[12].condition!.icon}"
                            : 'no data',
                      ),
                      width: 35,
                      height: 35,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      resData.forecast?.forecastday?[index].hour?[12].condition!
                              .text
                              .toString() ??
                          '',
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                        '${resData.forecast?.forecastday?[index].hour?[12].cloud} / ${resData.forecast?.forecastday?[index].hour?[12].tempC}'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget gridView(ResponseModel resData) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(40),
      // crossAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        Container(
          padding: const EdgeInsets.only(
            right: 40,
          ),
          child: Column(
            children: [
              const Text(
                "Feels like",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                resData.current!.feelslikeC.toString() ?? "no data",
                style: const TextStyle(fontSize: 30),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 40,
          ),
          child: Column(
            children: [
              const Text(
                "Humidity",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                resData.current!.humidity.toString() ?? "no data",
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            right: 40,
          ),
          child: Column(
            children: [
              const Text(
                "W Wind",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                resData.current!.windKph.toString() ?? "no data",
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 40,
          ),
          child: Column(
            children: [
              const Text(
                "UV",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                resData.current!.uv.toString() ?? "no data",
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            right: 40,
          ),
          child: Column(
            children: [
              const Text(
                "visibility",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                resData.current!.visMiles.toString() ?? "no data",
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 40,
          ),
          child: Column(
            children: [
              const Text(
                "Air pressure",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                resData.current!.pressureMb.toString() ?? "no data",
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        ),
      ],
    );
  }
}
