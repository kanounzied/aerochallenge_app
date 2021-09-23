import 'dart:async';

import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:flutter/material.dart';

import '../../aero_button.dart';

class TimerAero extends StatefulWidget {
  const TimerAero({Key key, this.level}) : super(key: key);
  final String level;

  @override
  _TimerAeroState createState() => _TimerAeroState();
}

class _TimerAeroState extends State<TimerAero> {
  Stopwatch stopwatch = new Stopwatch();
  String minutesStr = "00";
  String secondsStr = "00";
  String millisecondsStr = "00";
  IconData icon = Icons.play_arrow;

  // To know whether to reset the stopwatch or replay it
  bool shouldPlay = true;

  // To know if the stopwatch is currently playing or not
  bool active = false;

  // Hedhi aad wadh7a
  Timer timer;
  Duration timerInterval = Duration(milliseconds: 10);

  startTimer() {
    setState(() {
      stopwatch.start();
      shouldPlay = false;
      active = true;
      timer = Timer.periodic(timerInterval, updateTimer);
      icon = Icons.stop;
    });
  }

  stopTimer() {
    setState(() {
      active = false;
      shouldPlay = false;
      icon = Icons.replay;
      stopwatch.stop();
      setTime();
    });
  }

  resetWatch() {
    setState(() {
      stopwatch.reset();
      minutesStr = "00";
      secondsStr = "00";
      millisecondsStr = "00";
      active = false;
      shouldPlay = true;
      icon = Icons.play_arrow;
    });
  }

  setTime() {
    int time = stopwatch.elapsedMilliseconds;
    setState(() {
      minutesStr = (time / (1000 * 60)).floor().toString().padLeft(2, '0');
      secondsStr = (time / 1000).floor().toString().padLeft(2, '0');
      millisecondsStr = ((time / 10) % 100).floor().toString().padLeft(2, '0');
    });
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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AeroButton(
          content: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              WidgetSpan(
                child: Icon(
                  icon,
                  size: SizeConfig.defaultSize * 2.4,
                ),
              ),
              WidgetSpan(
                  child: SizedBox(
                width: SizeConfig.defaultSize / 2,
              )),
              WidgetSpan(
                child: Center(
                  child: Text(
                    widget.level,
                    style: TextStyle(
                      color: LIGHT_COLOR,
                      fontSize: SizeConfig.defaultSize * 2,
                    ),
                  ),
                ),
              )
            ]),
          ),
          color: active ? AERO_YELLOW : AERO_RED,
          width: SizeConfig.screenWidth * 0.38,
          height: SizeConfig.defaultSize * 5,
          onPressed: active ? stopTimer : playOrResetTimer,
        ),
        Text(
          "$minutesStr:$secondsStr:$millisecondsStr",
          style: TextStyle(
            fontSize: SizeConfig.defaultSize * 1.8,
            color: AERO_BLUE,
          ),
        ),
      ],
    );
  }
}
