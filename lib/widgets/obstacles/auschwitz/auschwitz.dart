import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/widgets/obstacles/auschwitz/timer_aero.dart';
import 'package:aerochallenge_app/widgets/texts/obstacle_name_text.dart';
import 'package:flutter/material.dart';

import '../../aero_button.dart';
import '../sonctions.dart';

class Auschwitz extends StatefulWidget {
  const Auschwitz({Key key}) : super(key: key);

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
                    onPressed: [],
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
