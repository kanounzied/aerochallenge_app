import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'package:aerochallenge_app/screens/game/game.dart';
import 'package:aerochallenge_app/widgets/aero_button.dart';
import 'package:aerochallenge_app/widgets/texts/aeroday_edition_text.dart';
import 'package:aerochallenge_app/widgets/appbar_aeroday.dart';
import 'package:aerochallenge_app/widgets/custom_page_route.dart';
import 'package:aerochallenge_app/widgets/timer/timerBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartPage extends StatelessWidget {
  const StartPage({this.equipe});

  final Equipe equipe;

  @override
  Widget build(BuildContext context) {
    final TimerBloc timerBloc = Provider.of<TimerBloc>(context);

    List<Color> colors = [
      AERO_RED,
      AERO_YELLOW,
      AERO_BLUE,
    ];

    SizeConfig sizeConfig = new SizeConfig();
    sizeConfig.init(context);

    return Scaffold(
      appBar: AppbarAeroday.getAppbar(),
      backgroundColor: DARK_COLOR,
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 1, child: Center(child: AerodayEditionText())),
            Expanded(
              flex: 6,
              child: Center(
                child: Image.asset(
                  'assets/drone.png',
                  width: SizeConfig.screenWidth * 0.65,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(bottom: SizeConfig.defaultSize * 2),
                child: AeroButton(
                  content: Text('Start Game!'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CustomPageRoute(
                        child: Game(
                          equipe: equipe,
                        ),
                      ),
                    );
                    timerBloc.stopwatch.reset();
                    timerBloc.minutesStr = "04";
                    timerBloc.secondsStr = "00";
                    timerBloc.millisecondsStr = "00";
                  },
                  width: SizeConfig.screenWidth * 0.8,
                  height: SizeConfig.defaultSize * 6,
                  color: AERO_RED,
                  textColor: LIGHT_COLOR,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
