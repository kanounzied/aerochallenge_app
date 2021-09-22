import 'dart:async';

import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:flutter/material.dart';

import '../../aero_button.dart';

class TimerAero extends StatefulWidget {
  const TimerAero({Key key}) : super(key: key);

  @override
  _TimerAeroState createState() => _TimerAeroState();
}

class _TimerAeroState extends State<TimerAero> {
  Stopwatch stopwatch = new Stopwatch();
  String minutesStr = "00";
  String secondsStr = "00";
  String millisecondsStr = "00";
  IconData icon = Icons.play_arrow;
  bool shouldPlay = true;
  bool active = false;
  Timer timer;
  Duration timerInterval = Duration(milliseconds: 10);
  int counter = 0;

  stopTimer() {
    setState(() {
      active = false;
      shouldPlay = false;
      icon = Icons.replay;
      stopwatch.stop();
      setTime();
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

  startTimer() {
    setState(() {
      stopwatch.start();
      shouldPlay = false;
      active = true;
      timer = Timer.periodic(timerInterval, updateTimer);
      icon = Icons.stop;
    });
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
                      'Niveau 1',
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
            //https://medium.com/analytics-vidhya/build-a-simple-stopwatch-in-flutter-a1f21cfcd7a8
            onPressed: active
                ? stopTimer
                : () {
                    if (shouldPlay)
                      startTimer();
                    else
                      resetWatch();
                  }),
        Text(
          "$minutesStr:$secondsStr:$millisecondsStr",
          style: TextStyle(
              fontSize: SizeConfig.defaultSize * 1.8, color: AERO_BLUE),
        ),
      ],
    );
  }
}
