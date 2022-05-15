import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/widgets/obstacles/auschwitz/timer_lvl2/timer_bloc_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../aero_button.dart';

class TimerAero2 extends StatelessWidget {
  const TimerAero2({Key key, this.done}) : super(key: key);
final String level = "Niveau 2";
final bool done;

  @override
  Widget build(BuildContext context) {
        final AuschwitzTimerBloc2 timerBloc2 = Provider.of<AuschwitzTimerBloc2>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AeroButton(
          content: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              WidgetSpan(
                child: Icon(
                  timerBloc2.icon,
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
          color: timerBloc2.active ? AERO_YELLOW : done ? AERO_RED.withOpacity(0.5) : AERO_RED,
          width: SizeConfig.screenWidth * 0.38,
          height: SizeConfig.defaultSize * 5,
          onPressed: timerBloc2.active ? timerBloc2.stopTimer : timerBloc2.playOrResetTimer,
        ),
        Text(
          timerBloc2.time["minutes"]+":"+timerBloc2.time["seconds"]+":"+timerBloc2.time["milliseconds"],
          style: TextStyle(
            fontSize: SizeConfig.defaultSize * 1.8,
            color: done ? AERO_BLUE.withOpacity(0.5) : AERO_BLUE,
          ),
        ),
      ],
    );
  }
}
