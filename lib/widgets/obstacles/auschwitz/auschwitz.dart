import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/action.dart';
import 'package:aerochallenge_app/screens/game/history.dart';
import 'package:aerochallenge_app/widgets/obstacles/auschwitz/timer_aero.dart';
import 'package:aerochallenge_app/widgets/texts/obstacle_name_text.dart';
import 'package:aerochallenge_app/widgets/timer/timerBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../aero_button.dart';
import '../sonctions.dart';

class Auschwitz extends StatefulWidget {
  Auschwitz({Key key, this.name}) : super(key: key);
  String name;

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
  int _record = 0;

  @override
  Widget build(BuildContext context) {
    final TimerBloc timerBloc = Provider.of<TimerBloc>(context);

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
                          TimerAero(
                            level: "Niveau 1",
                          ),
                          SizedBox(
                            height: SizeConfig.defaultSize * 2,
                          ),
                          TimerAero(
                            level: "Niveau 2",
                          ),
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
                        historique[widget.name].add(act);
                      },
                      () {},
                      () {}
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
              onPressed: () {},
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
              onPressed: () {},
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
