import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/widgets/timer/timerBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerAero extends StatelessWidget {
  const TimerAero({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimerBloc timerBloc = Provider.of<TimerBloc>(context);

    return Container(
      child: Text(
        timerBloc.time,
        style: TextStyle(
            color: LIGHT_COLOR,
            fontWeight: FontWeight.normal,
            fontSize: SizeConfig.defaultSize * 1.8),
      ),
    );
  }
}
