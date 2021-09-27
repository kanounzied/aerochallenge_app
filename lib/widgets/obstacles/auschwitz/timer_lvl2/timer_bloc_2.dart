import 'dart:async';
import 'package:flutter/material.dart';

class TimerBloc2 extends ChangeNotifier {
  Map<String, String> _time = {
    "minutes": "00",
    "seconds": "00",
    "milliseconds": "00"
  };
  Stopwatch stopwatch = new Stopwatch();
  IconData icon = Icons.play_arrow;

  Map<String, String> get time => _time;

  void updateTime(String min, String sec, String msec) {
    _time["minutes"] = min;
    _time["seconds"] = sec;
    _time["milliseconds"] = msec;
    notifyListeners();
  }

  bool shouldPlay = true;

  // To know if the stopwatch is currently playing or not
  bool active = false;

  // Hedhi aad wadh7a
  Timer timer;
  Duration timerInterval = Duration(milliseconds: 10);

  startTimer() {
    stopwatch.start();
    shouldPlay = false;
    active = true;
    timer = Timer.periodic(timerInterval, updateTimer);
    icon = Icons.stop;
  }

  stopTimer() {
    active = false;
    shouldPlay = false;
    icon = Icons.replay;
    stopwatch.stop();
    setTime();
  }

  resetWatch() {
    stopwatch.reset();
    updateTime("00", "00", "00");
    active = false;
    shouldPlay = true;
    icon = Icons.play_arrow;
  }

  setTime() {
    int time = stopwatch.elapsedMilliseconds;
    updateTime(
      (time / (1000 * 60)).floor().toString().padLeft(2, '0'),
      (time / 1000).floor().toString().padLeft(2, '0'),
      ((time / 10) % 100).floor().toString().padLeft(2, '0'),
    );
  }

  updateTimer(Timer t) {
    if (stopwatch.isRunning) setTime();
  }

  playOrResetTimer() {
    if (shouldPlay)
      startTimer();
    else
      resetWatch();
  }
}
