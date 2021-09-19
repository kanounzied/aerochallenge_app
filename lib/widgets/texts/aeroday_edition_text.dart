import 'package:aerochallenge_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../wing_icon_icons.dart';

class AerodayEditionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              WingIcon.feather_wing,
              size: 24,
              color: AERO_YELLOW,
            ),
          ),
          TextSpan(
            text: '  aerochallenge edition  ',
            style: TextStyle(
                fontSize: 21,
                color: AERO_YELLOW,
                fontFamily: 'playfairDisplay'),
          ),
          WidgetSpan(
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Icon(
                WingIcon.feather_wing,
                size: 24,
                color: AERO_YELLOW,
              ),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
