import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/action.dart';
import 'package:aerochallenge_app/screens/game/history.dart';
import 'package:aerochallenge_app/widgets/obstacles/auschwitz/timer_lvl1/timer_aero1.dart';
import 'package:aerochallenge_app/widgets/obstacles/auschwitz/timer_lvl1/timer_bloc_1.dart';
import 'package:aerochallenge_app/widgets/obstacles/auschwitz/timer_lvl2/timer_aero2.dart';
import 'package:aerochallenge_app/widgets/obstacles/auschwitz/timer_lvl2/timer_bloc_2.dart';
import 'package:aerochallenge_app/widgets/texts/obstacle_name_text.dart';
import 'package:aerochallenge_app/widgets/timer/timerBloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../aero_button.dart';
import '../sonctions.dart';

class Auschwitz extends StatefulWidget {
  Auschwitz({Key key, this.contestantId, this.cc}) : super(key: key);
  String contestantId;
  CarouselController cc;

  @override
  _AuschwitzState createState() => _AuschwitzState();
}

class _AuschwitzState extends State<Auschwitz> {
  String _name = "auschwitz";
  List<String> _sonctions = ["-5"];
  Map _success = {
    "niveau1": {"5": 25, "7": 40},
    "niveau2": {"5": 10, "7": 20},
  };
  bool _done = false;

  Map<String, String> maxTime(
      Map<String, String> time1, Map<String, String> time2) {
    if (int.parse(time1["minutes"] + time1["seconds"] + time1["milliseconds"]) >
        int.parse(time2["minutes"] + time2["seconds"] + time2["milliseconds"]))
      return time1;
    return time2;
  }

  int getScore(Map<String, String> time1, Map<String, String> time2) {
    int niveau1 = int.parse(time1["seconds"]);
    int niveau2 = int.parse(time2["seconds"]);

    if (niveau1 >= 5) {
      if (niveau1 < 7)
        return _success["niveau1"]["5"];
      else
        return _success["niveau1"]["7"];
    } else if (niveau2 >= 5) {
      if (niveau2 < 7)
        return _success["niveau2"]["5"];
      else
        return _success["niveau2"]["7"];
    } else
      return 0;
  }

  @override
  Widget build(BuildContext context) {
    final TimerBloc timerBloc = Provider.of<TimerBloc>(context);
    final AuschwitzTimerBloc1 timerBloc1 =
        Provider.of<AuschwitzTimerBloc1>(context);
    final AuschwitzTimerBloc2 timerBloc2 =
        Provider.of<AuschwitzTimerBloc2>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(child: ObstacleNameText(name: _name)),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/obstacles/' + _name + '.png',
                        width: SizeConfig.screenWidth * 0.7,
                        fit: BoxFit.fill,
                      ),
                      Column(
                        children: [
                          TimerAero1(),
                          SizedBox(
                            height: SizeConfig.defaultSize * 2,
                          ),
                          TimerAero2()
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Sonctions(
                    soncs: _sonctions,
                    onPressed: [
                      () {
                        ActionHist act = new ActionHist(
                          type: "toucher d'un element",
                          time: timerBloc.time,
                          value: -1,
                          obstacle: _name,
                        );
                        historique[widget.contestantId].add(act);
                      },
                      () {
                        ActionHist act = new ActionHist(
                          type: "toucher d'obstacle",
                          time: timerBloc.time,
                          value: int.parse(_sonctions[0]),
                          obstacle: _name,
                        );
                        historique[widget.contestantId].add(act);
                      },
                    ],
                  ))
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AeroButton(
              content: Text(
                'VALIDER',
                style: TextStyle(fontSize: SizeConfig.defaultSize * 1.65),
              ),
              width: SizeConfig.screenWidth * 0.4,
              height: SizeConfig.defaultSize * 6,
              color: AERO_BLUE,
              textColor: LIGHT_COLOR,
              onPressed: () {
                ActionHist act = new ActionHist(
                  type: "validation",
                  time: timerBloc.time,
                  value: getScore(timerBloc1.time, timerBloc2.time),
                  obstacle: _name,
                );
                if (!_done) {
                  historique[widget.contestantId].add(act);
                  widget.cc.nextPage();
                  setState(() {
                    _done = !_done;
                  });
                }
                timerBloc1.stopTimer();
                timerBloc1.resetWatch();
                timerBloc2.stopTimer();
                timerBloc2.resetWatch();
              },
            ),
            SizedBox(width: SizeConfig.defaultSize * 3),
            AeroButton(
              content: Text(
                'ANNULER',
                style: TextStyle(fontSize: SizeConfig.defaultSize * 1.65),
              ),
              width: SizeConfig.screenWidth * 0.4,
              height: SizeConfig.defaultSize * 6,
              color: AERO_RED,
              textColor: LIGHT_COLOR,
              onPressed: () {
                ActionHist act = new ActionHist(
                  type: "annulation",
                  time: timerBloc.time,
                  value: 0,
                  obstacle: _name,
                );
                historique[widget.contestantId].add(act);
                timerBloc1.stopTimer();
                timerBloc1.resetWatch();
                timerBloc2.stopTimer();
                timerBloc2.resetWatch();
              },
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.defaultSize * 2,
        ),
      ],
    );
  }
}
