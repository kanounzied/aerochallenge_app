import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/widgets/texts/obstacle_name_text.dart';
import 'package:flutter/material.dart';

import '../../aero_button.dart';
import '../sonctions.dart';

class Helipad extends StatefulWidget {
  const Helipad({ Key key }) : super(key: key);

  @override
  _HelipadState createState() => _HelipadState();
}

class _HelipadState extends State<Helipad> {

  var _name = "helipad";
  var _sonctions = ["-3"];
  var _success = 5;

  @override
  Widget build(BuildContext context) {
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
                  'assets/obstacles/' + _name + '.png',
                  width: SizeConfig.screenWidth * 0.5,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Sonctions(soncs: _sonctions, onPressed: [],)
            )
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