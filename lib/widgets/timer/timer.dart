import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:flutter/material.dart';

class TimerAero extends StatefulWidget {
  const TimerAero({Key key}) : super(key: key);

  @override
  _TimerAeroState createState() => _TimerAeroState();
}

class _TimerAeroState extends State<TimerAero> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '03:45',
        style: TextStyle(
          color: LIGHT_COLOR,
          fontWeight: FontWeight.normal,
          fontSize: SizeConfig.defaultSize * 1.8
        ),
      ),
    );
  }
}
