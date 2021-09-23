import 'dart:async';

import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'package:aerochallenge_app/screens/game/history.dart';
import 'package:aerochallenge_app/widgets/appbar_aeroday.dart';
import 'package:aerochallenge_app/widgets/obstacles/auschwitz/auschwitz.dart';
import 'package:aerochallenge_app/widgets/obstacles/helipad/helipad.dart';
import 'package:aerochallenge_app/widgets/obstacles/missiles/missiles.dart';
import 'package:aerochallenge_app/widgets/obstacles/podium/podium.dart';
import 'package:aerochallenge_app/widgets/obstacles/torii/torii.dart';
import 'package:aerochallenge_app/widgets/obstacles/wtc/wtc.dart';
import 'package:aerochallenge_app/widgets/texts/aeroday_edition_text.dart';
import 'package:aerochallenge_app/widgets/timer/timer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key key, @required this.equipe}) : super(key: key);

  final Equipe equipe;

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  Stopwatch stopwatch = new Stopwatch();
  String minutesStr = "04";
  String secondsStr = "00";
  String millisecondsStr = "00";
  IconData icon = Icons.play_arrow;

  Timer timer;
  Duration timerInterval = Duration(milliseconds: 10);

  setTime() {
    int time =
        Duration(minutes: 4).inMilliseconds - stopwatch.elapsedMilliseconds;
    if (time <= 0)
      stopTimer();
    else
      setState(() {
        minutesStr = (time / (1000 * 60)).floor().toString().padLeft(2, '0');
        secondsStr = ((time / 1000) % 60).floor().toString().padLeft(2, '0');
        millisecondsStr =
            ((time / 10) % 100).floor().toString().padLeft(2, '0');
      });
  }

  updateTimer(Timer t) {
    if (stopwatch.isRunning) setTime();
  }

  startTimer() {
    setState(() {
      stopwatch.start();
      timer = Timer.periodic(timerInterval, updateTimer);
      icon = Icons.stop;
    });
  }

  stopTimer() {
    setState(() {
      icon = Icons.replay;
      stopwatch.stop();
      // You can qlso set it to the time left, juste zid condition ya Zied
      setState(() {
        stopwatch.reset();
        minutesStr = "00";
        secondsStr = "00";
        millisecondsStr = "00";
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _obsWidgets = [
      Helipad(name: widget.equipe.name),
      WTC(name: widget.equipe.name),
      Auschwitz(name: widget.equipe.name),
      Torii(name: widget.equipe.name),
      Missiles(name: widget.equipe.name),
      Podium(name: widget.equipe.name)
    ];

    historique[widget.equipe.name] = [];

    return Scaffold(
      appBar: AppbarAeroday.getAppbar(),
      backgroundColor: DARK_COLOR,
      body:
          // Padding(
          //   padding: EdgeInsets.all(SizeConfig.defaultSize * 1.2),
          //   child:
          Column(
        children: [
          SizedBox(
            height: SizeConfig.defaultSize * 1.5,
          ),
          Center(child: AerodayEditionText()),
          SizedBox(
            height: SizeConfig.defaultSize * 2.5,
          ),
          Center(
            child: TimerAero(
              time: "$minutesStr:$secondsStr:$millisecondsStr",
            ),
          ),
          SizedBox(
            height: SizeConfig.defaultSize * 2,
          ),
          CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              height: SizeConfig.screenHeight * 0.75,
              viewportFraction: 1,
            ),
            items: _obsWidgets.map((widget) {
              return Builder(
                builder: (BuildContext context) {
                  return widget;
                },
              );
            }).toList(),
          )
        ],
      ),
      // ),
    );
  }
}
