import 'dart:async';

import 'package:flutter/material.dart';

class TimerBloc extends ChangeNotifier {
  Stopwatch stopwatch = new Stopwatch();
  String minutesStr = "04";
  String secondsStr = "00";
  String millisecondsStr = "00";
  IconData icon = Icons.play_arrow;
  bool _isFinished = false;

  Timer timer;
  Duration timerInterval = Duration(milliseconds: 10);

  bool get isFinished => _isFinished;

  void setIsFinished(bool val){
    _isFinished = val;
    notifyListeners();
  } 

  setTime() {
    int time =
        Duration(minutes: 4).inMilliseconds - stopwatch.elapsedMilliseconds;
    if (time <= 0)
      stopTimer();
    else
        minutesStr = (time / (1000 * 60)).floor().toString().padLeft(2, '0');
        secondsStr = ((time / 1000) % 60).floor().toString().padLeft(2, '0');
        millisecondsStr =
            ((time / 10) % 100).floor().toString().padLeft(2, '0');
  }

  updateTimer(Timer t) {
    if (stopwatch.isRunning) setTime();
    notifyListeners();
  }

  startTimer() {
      stopwatch.start();
      timer = Timer.periodic(timerInterval, updateTimer);
      icon = Icons.stop;
  }

  stopTimer() {
      icon = Icons.replay;
      stopwatch.stop();
      // You can qlso set it to the time left, juste zid condition ya Zied
        stopwatch.reset();
        minutesStr = "00";
        secondsStr = "00";
        millisecondsStr = "00";
  }

  String getTime(){
    return "$minutesStr:$secondsStr";
  }

  String getTimeWithMilliseconds(){
    return "$minutesStr:$secondsStr:$millisecondsStr";
  }

  int getSeconds() {
    return int.parse(minutesStr) * 60 + int.parse(secondsStr);
  }

  String getReversedTime(){
    int minutes = 3 - int.parse(minutesStr);
    int seconds = 59 - int.parse(secondsStr);
    return "$minutes:$seconds";
  }
}
