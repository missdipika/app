import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../model/response_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider { 
  // ApiProvider();

  Future<ResponseModel> getUserData(String cityName) async {
  //  isLoading = true;
     var resData;
    String url =
        "http://api.weatherapi.com/v1/forecast.json?key=40fc420f369e4a67a1771835222107&q=$cityName&days=10&aqi=no&alerts=no";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      resData = ResponseModel.fromJson(data);
      log('------------------response list data :  $resData');
      return resData;
    } else {
      log('error in api');return ResponseModel();
    }
  }
}