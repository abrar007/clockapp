import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetTimeController extends GetxController {
  static final TimeOfDay timeOfDay = TimeOfDay.fromDateTime(DateTime.now());
  int h = 0;
  int hh = 0;
  int min = 0;
  int minn = 0;

  int hour = timeOfDay.hour.toInt();
  int minute = timeOfDay.minute.toInt();
  String time = "";
  String setTime = "";
  int state = 1; //initial state

  int getHour() {
    return hour;
  }

  int getminute() {
    return minute;
  }

  setHour(int hour) {
    this.hour = hour;
    update();
  }

  setMinute(int minute) {
    this.minute = minute;
    update();
  }

  String sendTime(context) {
    setTime = h.toString() + hh.toString() + min.toString() + minn.toString();
    print("Hoiseeee" + setTime);
    return setTime;
  }

  String setCurrentTime(BuildContext context) {
    //print(timeOfDay.format());
    setHour(TimeOfDay.now().hour);
    setMinute(TimeOfDay.now().minute);
    print(hour);
    print(minute);
    time = h.toString() + hh.toString() + min.toString() + minn.toString();
    print(time);
    return time;
  }

  setState(int state) {
    this.state = state;
    update();
  }
}
