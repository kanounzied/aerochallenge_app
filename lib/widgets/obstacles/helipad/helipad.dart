import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/action.dart';
import 'package:aerochallenge_app/screens/game/history.dart';
import 'package:aerochallenge_app/widgets/texts/obstacle_name_text.dart';
import 'package:aerochallenge_app/widgets/timer/timerBloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../aero_button.dart';
import '../sonctions.dart';

class Helipad extends StatefulWidget {
  Helipad({Key key, this.name, this.cc, this.contestantId}) : super(key: key);

  String name;
  CarouselController cc;
  String contestantId;

  @override
  _HelipadState createState() => _HelipadState();
}

class _HelipadState extends State<Helipad> {
  var _name = "helipad";
  var _sonctions = ["-3"];
  var _success = [-3, 5];
  bool _done = false;

  // var x = dbInstance[];

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
                  child: Image.asset(
                    // _done
                    //     ? 'assets/obstacles/' + _name + '_hashed.png' :
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
                        if (!_done) historique[widget.contestantId].add(act);
                      },
                      () {
                        ActionHist act = new ActionHist(
                          type: "toucher d'obstacle",
                          time: timerBloc.time,
                          value: -3,
                          obstacle: _name,
                        );
                        if (!_done) historique[widget.contestantId].add(act);
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
                  value: _success[1],
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
                'FALSE ATTEMPT',
                style: TextStyle(fontSize: SizeConfig.defaultSize * 1.65),
              ),
              width: SizeConfig.screenWidth * 0.4,
              height: SizeConfig.defaultSize * 6,
              color: AERO_RED,
              textColor: LIGHT_COLOR,
              onPressed: () {
                ActionHist act = new ActionHist(
                  type: "failed",
                  time: timerBloc.time,
                  value: _success[0],
                  obstacle: _name,
                );
                if (!_done) historique[widget.contestantId].add(act);
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
