import 'package:flutter/cupertino.dart';

class TimerBloc extends ChangeNotifier {
  String _time = "3:45";
  String _minutes = "3";
  String _seconds = "45";

  String get time => _time;

  set time(String val) {
    _time = val;
    notifyListeners();
  }

  int getSeconds(){
    return int.parse(_minutes) * 60 + int.parse(_seconds);
  }

  void reset(){
    _time = "00:00";
    _minutes = "00";
    _seconds = "00";
  }
}
