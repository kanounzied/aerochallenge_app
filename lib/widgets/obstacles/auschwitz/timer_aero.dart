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
  Stream<int> timerStream;
  StreamSubscription<int> timerSubscription;
  String hoursStr = "00";
  String minutesStr = "00";
  String secondsStr = "00";
  bool active = false;

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
                  Icons.play_arrow,
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
              ? () {
                  timerSubscription.cancel();
                  timerStream = null;
                  setState(() {
                    hoursStr = '00';
                    minutesStr = '00';
                    secondsStr = '00';
                    active = !active;
                  });
                }
              : () {
                  setState(() {
                    active = !active;
                  });
                  timerStream = stopWatchStream();
                  timerSubscription = timerStream.listen((int newTick) {
                    setState(() {
                      hoursStr = ((newTick / (60 * 60)) % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      minutesStr = ((newTick / 60) % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      secondsStr =
                          (newTick % 60).floor().toString().padLeft(2, '0');
                    });
                  });
                },
        ),
        Text(
          "$hoursStr:$minutesStr:$secondsStr",
          style: TextStyle(
              fontSize: SizeConfig.defaultSize * 1.8, color: AERO_BLUE),
        ),
      ],
    );
  }

  Stream<int> stopWatchStream() {
    StreamController<int> streamController;
    Timer timer;
    Duration timerInterval = Duration(seconds: 1);
    int counter = 0;

    void stopTimer() {
      if (timer != null) {
        timer.cancel();
        timer = null;
        counter = 0;
        streamController.close();
      }
    }

    void tick(_) {
      counter++;
      streamController.add(counter);
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );

    return streamController.stream;
  }
}
