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
                  size: 24,
                ),
              ),
              TextSpan(
                text: 'niveau 1',
                style: TextStyle(
                  color: LIGHT_COLOR,
                  fontSize: SizeConfig.defaultSize * 2,
                ),
              )
            ]),
          ),
          color: AERO_RED,
          width: SizeConfig.screenWidth * 0.38,
          height: SizeConfig.defaultSize * 5,
          onPressed: () {},
        ),
        Text(
          '00:00:00',
          style: TextStyle(
              fontSize: SizeConfig.defaultSize * 1.8, color: AERO_BLUE),
        ),
      ],
    );
  }
}
