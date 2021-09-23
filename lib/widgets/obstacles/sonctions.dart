import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:flutter/material.dart';

import '../aero_button.dart';

class Sonctions extends StatelessWidget {
  Sonctions({this.soncs, this.onPressed});

  final List<String> soncs;
  final List<Function> onPressed;

  @override
  Widget build(BuildContext context) {
    List<Widget> tab = [
      AeroButton(
        content: Padding(
          padding: EdgeInsets.fromLTRB(
              0, 0, SizeConfig.defaultSize * 0.2, SizeConfig.defaultSize * 0.4),
          child: Image.asset(
            'assets/obstacles/drone_hit.png',
            width: SizeConfig.defaultSize * 4,
          ),
        ),
        width: SizeConfig.defaultSize * 7,
        height: SizeConfig.defaultSize * 7,
        color: AERO_BLUE,
        textColor: DARK_COLOR,
        onPressed: onPressed[0],
      ),
      SizedBox(
        height: SizeConfig.defaultSize * 4,
      ),
    ];
    int i = 1;
    soncs.forEach((s) {
      tab.add(
        AeroButton(
          content: Text(
            s,
            style: TextStyle(color: DARK_COLOR, fontWeight: FontWeight.bold),
          ),
          color: AERO_BLUE,
          width: SizeConfig.defaultSize * 7,
          height: SizeConfig.defaultSize * 7,
          onPressed: onPressed[i++],
        ),
      );
      tab.add(SizedBox(
        height: SizeConfig.defaultSize * 4,
      ));
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: tab,
    );
  }
}
