import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/widgets/obstacles/wtc/counter_aero.dart';
import 'package:aerochallenge_app/widgets/obstacles/sonctions.dart';
import 'package:aerochallenge_app/widgets/texts/obstacle_name_text.dart';
import 'package:flutter/material.dart';

import '../../aero_button.dart';

class WTC extends StatefulWidget {
  const WTC({ Key key }) : super(key: key);

  @override
  _WTCState createState() => _WTCState();
}

class _WTCState extends State<WTC> {

  var _name = "WTC";
  var _sonctions = ["-5", "-10"];
  var _counter = 0;
  var _success = [-5, 10, 25, 40];

  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Center(child: ObstacleNameText(name: _name,)),
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
              child: Sonctions(soncs: _sonctions, onPressed: [],),
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