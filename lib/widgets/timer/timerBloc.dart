import 'package:flutter/cupertino.dart';

class TimerBloc extends ChangeNotifier {
  String _time = "3:45";

  String get time => _time;

  set time(String val) {
    _time = val;
    notifyListeners();
  }
}
