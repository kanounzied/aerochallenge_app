import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/widgets/texts/obstacle_name_text.dart';
import 'package:flutter/material.dart';

import '../../aero_button.dart';
import '../sonctions.dart';

class Missiles extends StatefulWidget {
  Missiles({Key key, this.name}) : super(key: key);

  String name;

  @override
  _MissilesState createState() => _MissilesState();
}

class _MissilesState extends State<Missiles> {
  String _name = "missiles";
  List<String> _sonctions = ["-5", "-10"];
  Map _success = {"2": 15, "3": 30};

  Color _obs2Btn = AERO_RED;
  Color _obs3Btn = AERO_RED;

  void _changeBtn2Color() {
    setState(() {
      if (_obs2Btn == AERO_RED) {
        _obs2Btn = AERO_RED.withOpacity(0.5);
        _obs3Btn = AERO_RED;
      } else
        _obs2Btn = AERO_RED;
    });
  }

  void _changeBtn3Color() {
    setState(() {
      if (_obs3Btn == AERO_RED) {
        _obs3Btn = AERO_RED.withOpacity(0.5);
        _obs2Btn = AERO_RED;
      } else
        _obs3Btn = AERO_RED;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
            child: ObstacleNameText(
          name: _name,
        )),
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
                        width: SizeConfig.screenWidth * 0.5,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize * 2,
                      ),
                      // Center(child: Text('tours', style: TextStyle(color: LIGHT_COLOR),),)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Sonctions(
                  soncs: _sonctions,
                  onPressed: [
                    () {},
                    () {},
                    () {},
                  ],
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AeroButton(
              content: Text(
                '2 obstacles',
                style: TextStyle(
                    color: LIGHT_COLOR,
                    fontSize: SizeConfig.defaultSize * 1.55),
              ),
              color: _obs2Btn,
              width: SizeConfig.screenWidth * 0.38,
              height: SizeConfig.defaultSize * 5,
              onPressed: () {
                _changeBtn2Color();
              },
            ),
            SizedBox(
              width: SizeConfig.defaultSize * 2,
            ),
            AeroButton(
              content: Text(
                '3 obstacles',
                style: TextStyle(
                    color: LIGHT_COLOR,
                    fontSize: SizeConfig.defaultSize * 1.55),
              ),
              color: _obs3Btn,
              width: SizeConfig.screenWidth * 0.38,
              height: SizeConfig.defaultSize * 5,
              onPressed: () {
                _changeBtn3Color();
              },
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.defaultSize * 5,
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
