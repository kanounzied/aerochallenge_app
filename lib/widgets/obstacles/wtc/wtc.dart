import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/action.dart';
import 'package:aerochallenge_app/screens/game/done_bloc.dart';
import 'package:aerochallenge_app/screens/game/history.dart';
import 'package:aerochallenge_app/widgets/obstacles/wtc/counter_aero.dart';
import 'package:aerochallenge_app/widgets/obstacles/sonctions.dart';
import 'package:aerochallenge_app/widgets/texts/obstacle_name_text.dart';
import 'package:aerochallenge_app/widgets/timer/timerBloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../aero_button.dart';
import 'counter_bloc.dart';

class WTC extends StatefulWidget {
  WTC({Key key, this.contestantId, this.cc}) : super(key: key);

  String contestantId;
  CarouselController cc;
  @override
  _WTCState createState() => _WTCState();
}

class _WTCState extends State<WTC> {
  var _name = "WTC";
  var _sonctions = ["-5", "-10"];
  var _success = [-5, 10, 25, 40];

  @override
  Widget build(BuildContext context) {
    final TimerBloc timerBloc = Provider.of<TimerBloc>(context);
    final CounterBloc counterBloc = Provider.of<CounterBloc>(context);
    final DoneBloc doneBloc = Provider.of<DoneBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
            child: ObstacleNameText(
          name: _name,
        )),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        doneBloc.wtc
                            ? 'assets/obstacles/' + _name + '_hashed.webp'
                            : 'assets/obstacles/' + _name + '.webp',
                        width: SizeConfig.screenWidth * 0.4,
                        fit: BoxFit.fill,
                      ),
                      CounterAero(),
                      // Center(child: Text('tours', style: TextStyle(color: LIGHT_COLOR),),)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Sonctions(
                  done: doneBloc.wtc,
                  soncs: _sonctions,
                  onPressed: [
                    () {
                      ActionHist act = new ActionHist(
                        type: "toucher d'un element",
                        time: timerBloc.getReversedTime(),
                        value: -1,
                        obstacle: _name,
                      );
                      historique[widget.contestantId].add(act);
                    },
                    () {
                      ActionHist act = new ActionHist(
                        type: "toucher d'obstacle",
                        time: timerBloc.getReversedTime(),
                        value: int.parse(_sonctions[0]),
                        obstacle: _name,
                      );
                      historique[widget.contestantId].add(act);
                    },
                    () {
                      ActionHist act = new ActionHist(
                        type: "toucher d'obstacle",
                        time: timerBloc.getReversedTime(),
                        value: int.parse(_sonctions[1]),
                        obstacle: _name,
                      );
                      historique[widget.contestantId].add(act);
                    }
                  ],
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AeroButton(
              content: Text(
                'VALIDER',
                style: TextStyle(
                  fontSize: SizeConfig.defaultSize * 1.65,
                  color:
                      doneBloc.wtc ? LIGHT_COLOR.withOpacity(0.5) : LIGHT_COLOR,
                ),
              ),
              width: SizeConfig.screenWidth * 0.4,
              height: SizeConfig.defaultSize * 6,
              color: doneBloc.wtc ? AERO_BLUE.withOpacity(0.5) : AERO_BLUE,
              textColor: LIGHT_COLOR,
              onPressed: () {
                ActionHist act = new ActionHist(
                  type: "validation",
                  time: timerBloc.getReversedTime(),
                  value: _success[counterBloc.count],
                  obstacle: _name,
                );
                if (!doneBloc.wtc) {
                  historique[widget.contestantId].add(act);
                  widget.cc.nextPage();
                  print(
                      "WTC STATE: " + doneBloc.wtc.toString());

                  doneBloc.updateWTC(true);
                  print(
                      "WTC STATE: " + doneBloc.wtc.toString());
                }
                counterBloc.reset();
              },
            ),
            SizedBox(width: SizeConfig.defaultSize * 3),
            AeroButton(
              content: Text(
                'RESET',
                style: TextStyle(
                  fontSize: SizeConfig.defaultSize * 1.65,
                  color:
                      doneBloc.wtc ? LIGHT_COLOR : LIGHT_COLOR.withOpacity(0.5),
                ),
              ),
              width: SizeConfig.screenWidth * 0.4,
              height: SizeConfig.defaultSize * 6,
              color: doneBloc.wtc ? AERO_RED : AERO_RED.withOpacity(0.5),
              textColor: LIGHT_COLOR,
              onPressed: () {
                doneBloc.updateWTC(false);
                counterBloc.reset();
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
