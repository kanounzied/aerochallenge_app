import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/action.dart';
import 'package:aerochallenge_app/screens/game/history.dart';
import 'package:aerochallenge_app/widgets/texts/obstacle_name_text.dart';
import 'package:aerochallenge_app/widgets/timer/timerBloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../aero_button.dart';
import '../sonctions.dart';

class Torii extends StatefulWidget {
  Torii({Key key, this.contestantId, this.cc}) : super(key: key);

  String contestantId;
  CarouselController cc;

  @override
  _ToriiState createState() => _ToriiState();
}

class _ToriiState extends State<Torii> {
  String _name = "torii";
  List<String> _sonctions = ["-5"];
  int _success = 20;
  bool _done = false;

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
                child: Align(
                  alignment: Alignment(0.0, -0.3),
                  child: Image.asset(
                    'assets/obstacles/' + _name + '.png',
                    width: SizeConfig.screenWidth * 0.5,
                    fit: BoxFit.fill,
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
                        historique[widget.contestantId].add(act);
                      },
                      () {
                        ActionHist act = new ActionHist(
                          type: "toucher d'obstacle",
                          time: timerBloc.time,
                          value: int.parse(_sonctions[0]),
                          obstacle: _name,
                        );
                        historique[widget.contestantId].add(act);
                      }
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
              onPressed: () {
                ActionHist act = new ActionHist(
                  type: "validation",
                  time: timerBloc.time,
                  value: _success,
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
                  type: "annulation",
                  time: timerBloc.time,
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
