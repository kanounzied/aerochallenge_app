import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/widgets/obstacles/auschwitz/timer_lvl1/timer_bloc_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../aero_button.dart';

class TimerAero1 extends StatelessWidget {
  const TimerAero1({Key key}) : super(key: key);
  final String level = "Niveau 1";

  @override
  Widget build(BuildContext context) {
    final AuschwitzTimerBloc1 timerBloc1 = Provider.of<AuschwitzTimerBloc1>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AeroButton(
          content: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              WidgetSpan(
                child: Icon(
                  timerBloc1.icon,
                  size: SizeConfig.defaultSize * 2.4,
                ),
              ),
              WidgetSpan(
                  child: SizedBox(
                width: SizeConfig.defaultSize / 2,
              )),
              WidgetSpan(
                child: Center(
                  child: Text(
                    level,
                    style: TextStyle(
                      color: LIGHT_COLOR,
                      fontSize: SizeConfig.defaultSize * 2,
                    ),
                  ),
                ),
              )
            ]),
          ),
          color: timerBloc1.active ? AERO_YELLOW : AERO_RED,
          width: SizeConfig.screenWidth * 0.38,
          height: SizeConfig.defaultSize * 5,
          onPressed: timerBloc1.active
              ? timerBloc1.stopTimer
              : timerBloc1.playOrResetTimer,
        ),
        Text(
          timerBloc1.time["minutes"] +
              ":" +
              timerBloc1.time["seconds"] +
              ":" +
              timerBloc1.time["milliseconds"],
          style: TextStyle(
            fontSize: SizeConfig.defaultSize * 1.8,
            color: AERO_BLUE,
          ),
        ),
      ],
    );
  }
}
