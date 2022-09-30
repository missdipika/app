import 'package:flutter/material.dart';

class GetTimeFromTimeEpoch {
  static String dataChanger(DateTime date) {
    // var time;
    // final formatter = new DateFormat('dd-MM-yyyy');
    // String formattedTime = DateFormat('hh:mm').format(time);
    // String formattedDate = formatter.format(time);
    int dd = date.day;
    int hh = date.hour;
    int mm = date.minute;

    return "$dd/$hh:$mm";
  }
}
