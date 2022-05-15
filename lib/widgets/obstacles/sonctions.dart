import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:flutter/material.dart';

import '../aero_button.dart';

class Sonctions extends StatelessWidget {
  Sonctions({this.soncs, this.onPressed, this.done});

  final List<String> soncs;
  final List<Function> onPressed;
  final bool done;

  @override
  Widget build(BuildContext context) {
    List<Widget> tab = [
      AeroButton(
        content: Padding(
          padding: EdgeInsets.fromLTRB(
              0, 0, SizeConfig.defaultSize * 0.2, SizeConfig.defaultSize * 0.4),
          child: Image.asset(
            'assets/obstacles/drone_hit.webp',
            width: SizeConfig.defaultSize * 4,
          ),
        ),
        width: SizeConfig.defaultSize * 7,
        height: SizeConfig.defaultSize * 7,
        color: done ? AERO_BLUE.withOpacity(0.7) : AERO_BLUE,
        textColor: DARK_COLOR,
        onPressed: done ? null : onPressed[0],
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
            style: TextStyle(
              color: done ? DARK_COLOR.withOpacity(0.7) : DARK_COLOR,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: done ? AERO_BLUE.withOpacity(0.7) : AERO_BLUE,
          width: SizeConfig.defaultSize * 7,
          height: SizeConfig.defaultSize * 7,
          onPressed: done ? null : onPressed[i++],
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
