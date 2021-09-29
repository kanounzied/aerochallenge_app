import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/action.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'package:aerochallenge_app/screens/final_page/hist_page.dart';
import 'package:aerochallenge_app/screens/game/history.dart';
import 'package:aerochallenge_app/widgets/texts/obstacle_name_text.dart';
import 'package:aerochallenge_app/widgets/timer/timerBloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../aero_button.dart';

class Podium extends StatefulWidget {
  Podium({Key key, this.cc, this.contestantId, this.equipe}) : super(key: key);

  CarouselController cc;
  String contestantId;
  Equipe equipe;

  @override
  _PodiumState createState() => _PodiumState();
}

class _PodiumState extends State<Podium> {
  String _name = "podium";
  List<int> _success = [0, 25, 10, 5];
  int _placement = 0;
  bool _done = false;

  Color _fstColor = AERO_YELLOW;
  Color _sndColor = Color(0xffc0c0c0);
  Color _thrdColor = Color(0xffCD7F32);

  void change1Color(){
    setState(() {
          if (_fstColor == AERO_YELLOW) _fstColor = AERO_YELLOW.withOpacity(0.5);
          else _fstColor = AERO_YELLOW;
          _sndColor = Color(0xffc0c0c0);
          _thrdColor = Color(0xffCD7F32);
        });
  }

  void change2Color(){
    setState(() {
          if (_sndColor == Color(0xffc0c0c0)) _sndColor = Color(0xffc0c0c0).withOpacity(0.5);
          else _sndColor = Color(0xffc0c0c0);
          _fstColor = AERO_YELLOW;
          _thrdColor = Color(0xffCD7F32);
        });
  }

  void change3Color(){
    setState(() {
          if (_thrdColor == Color(0xffCD7F32)) _thrdColor = Color(0xffCD7F32).withOpacity(0.5);
          else _thrdColor = Color(0xffCD7F32);
          _fstColor = AERO_YELLOW;
          _sndColor = Color(0xffc0c0c0);
        });
  }

  void _changePlacement(int p){
    setState((){
      _placement = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TimerBloc timerBloc = Provider.of<TimerBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(child: ObstacleNameText(name: _name)),
        Expanded(
            child: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/obstacles/' + _name + '.png',
                width: SizeConfig.screenWidth * 0.7,
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment(SizeConfig.defaultSize * -0.055,
                  SizeConfig.defaultSize * -0.025),
              child: AeroButton(
                content: Text('2nd'),
                width: SizeConfig.defaultSize * 6,
                height: SizeConfig.defaultSize * 6,
                color: _sndColor,
                onPressed: () {
                  _changePlacement(2);
                  change2Color();
                },
              ),
            ),
            Align(
              alignment: Alignment(SizeConfig.defaultSize * 0.005,
                  SizeConfig.defaultSize * 0.04),
              child: AeroButton(
                content: Text('1st'),
                width: SizeConfig.defaultSize * 6,
                height: SizeConfig.defaultSize * 6,
                color: _fstColor,
                onPressed: () {
                  _changePlacement(1);
                  change1Color();
                },
              ),
            ),
            Align(
              alignment: Alignment(SizeConfig.defaultSize * 0.038,
                  SizeConfig.defaultSize * -0.045),
              child: AeroButton(
                content: Text('3rd'),
                width: SizeConfig.defaultSize * 6,
                height: SizeConfig.defaultSize * 6,
                color: _thrdColor,
                onPressed: () {
                  _changePlacement(3);
                  change3Color();
                },
              ),
            ),
          ],
        )),
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
                  time: timerBloc.getTime(),
                  value: _success[_placement],
                  obstacle: _name,
                );
                if (!_done) {
                  historique[widget.contestantId].add(act);
                  setState(() {
                    _done = !_done;
                  });
                  timerBloc.stopTimer();
                }
                print("===================="+widget.contestantId);
                print(historique.toString());
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                                builder: (context) => HistPage(contestantId: widget.contestantId,equipe: widget.equipe,)));
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
