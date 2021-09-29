import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/action.dart';
import 'package:aerochallenge_app/screens/game/history.dart';
import 'package:aerochallenge_app/widgets/appbar_aeroday.dart';
import 'package:aerochallenge_app/widgets/texts/obstacle_name_text.dart';
import 'package:aerochallenge_app/widgets/timer/timerBloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../aero_button.dart';
import '../sonctions.dart';

class Missiles extends StatefulWidget {
  Missiles({Key key, this.cc, this.contestantId}) : super(key: key);

  CarouselController cc;
  String contestantId;

  @override
  _MissilesState createState() => _MissilesState();
}

class _MissilesState extends State<Missiles> {
  String _name = "missiles";
  List<String> _sonctions = ["-5", "-10"];
  Map _success = {
    "0": 0,
    "2": 15,
    "3": 30,
  };
  int _nMissiles = 0;
  bool _done = false;

  Color _obs2Btn = AERO_RED;
  Color _obs3Btn = AERO_RED;

  void _changeBtn2Color() {
    setState(() {
      if (_obs2Btn == AERO_RED) {
        _obs2Btn = AERO_RED.withOpacity(0.5);
        _obs3Btn = AERO_RED;
      } else
        _obs2Btn = AERO_RED;
    });
  }

  void _changeBtn3Color() {
    setState(() {
      if (_obs3Btn == AERO_RED) {
        _obs3Btn = AERO_RED.withOpacity(0.5);
        _obs2Btn = AERO_RED;
      } else
        _obs3Btn = AERO_RED;
    });
  }

  void _updateNMissiles(int i) {
    setState(() {
      if (_nMissiles == i)
        _nMissiles = 0;
      else
        _nMissiles = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TimerBloc timerBloc = Provider.of<TimerBloc>(context);

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
                        'assets/obstacles/' + _name + '.png',
                        width: SizeConfig.screenWidth * 0.5,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize * 2,
                      ),
                      // Center(child: Text('tours', style: TextStyle(color: LIGHT_COLOR),),)
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
                        time: timerBloc.getTime(),
                        value: -1,
                        obstacle: _name,
                      );
                      historique[widget.contestantId].add(act);
                    },
                    () {
                      ActionHist act = new ActionHist(
                        type: "toucher d'obstacle",
                        time: timerBloc.getTime(),
                        value: int.parse(_sonctions[0]),
                        obstacle: _name,
                      );
                      historique[widget.contestantId].add(act);
                    },
                    () {
                      ActionHist act = new ActionHist(
                        type: "depasser hauteur",
                        time: timerBloc.getTime(),
                        value: int.parse(_sonctions[1]),
                        obstacle: _name,
                      );
                      historique[widget.contestantId].add(act);
                    },
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
                '2 obstacles',
                style: TextStyle(
                    color: LIGHT_COLOR,
                    fontSize: SizeConfig.defaultSize * 1.55),
              ),
              color: _obs2Btn,
              width: SizeConfig.screenWidth * 0.38,
              height: SizeConfig.defaultSize * 5,
              onPressed: () {
                _changeBtn2Color();
                _updateNMissiles(2);
              },
            ),
            SizedBox(
              width: SizeConfig.defaultSize * 2,
            ),
            AeroButton(
              content: Text(
                '3 obstacles',
                style: TextStyle(
                    color: LIGHT_COLOR,
                    fontSize: SizeConfig.defaultSize * 1.55),
              ),
              color: _obs3Btn,
              width: SizeConfig.screenWidth * 0.38,
              height: SizeConfig.defaultSize * 5,
              onPressed: () {
                _changeBtn3Color();
                _updateNMissiles(3);
              },
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.defaultSize * 5,
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
                  time: timerBloc.getTime(),
                  value: _success[_nMissiles.toString()],
                  obstacle: _name,
                );
                if (!_done) {
                  historique[widget.contestantId].add(act);
                  widget.cc.nextPage();
                  setState(() {
                    _done = !_done;
                  });
                }
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
                  type: "annuler",
                  time: timerBloc.getTime(),
                  value: 0,
                  obstacle: _name,
                );
                historique[widget.contestantId].add(act);
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
