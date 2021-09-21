import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/widgets/texts/obstacle_name_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../aero_button.dart';
import '../sonctions.dart';

class Podium extends StatefulWidget {
  const Podium({Key key}) : super(key: key);

  @override
  _PodiumState createState() => _PodiumState();
}

class _PodiumState extends State<Podium> {
  String _name = "podium";
  List<int> _success = [0, 25, 10, 5];

  @override
  Widget build(BuildContext context) {
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
              alignment: Alignment(SizeConfig.defaultSize * -0.055,SizeConfig.defaultSize * -0.025),
              child: AeroButton(
                content: Text('2nd'),
                width: SizeConfig.defaultSize * 6,
                height: SizeConfig.defaultSize * 6,
                color: Color(0xffc0c0c0),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment(SizeConfig.defaultSize * 0.005,SizeConfig.defaultSize * 0.04),
              child: AeroButton(
                content: Text('1st'),
                width: SizeConfig.defaultSize * 6,
                height: SizeConfig.defaultSize * 6,
                color: AERO_YELLOW,
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment(SizeConfig.defaultSize * 0.038, SizeConfig.defaultSize * -0.045),
              child: AeroButton(
                content: Text('3rd'),
                width: SizeConfig.defaultSize * 6,
                height: SizeConfig.defaultSize * 6,
                color: Color(0xffCD7F32),
                onPressed: () {},
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
