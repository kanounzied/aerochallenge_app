import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'package:aerochallenge_app/widgets/aeroday_edition_text.dart';
import 'package:aerochallenge_app/widgets/appbar_aeroday.dart';
import 'dart:math' as math;
import 'package:aerochallenge_app/wing_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [AERO_RED, AERO_YELLOW, AERO_BLUE];

    SizeConfig sizeConfig = new SizeConfig();
    sizeConfig.init(context);

    return Scaffold(
      appBar: AppbarAeroday.getAppbar(),
      backgroundColor: DARK_COLOR,
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(flex: 1, child: Center(child: AerodayEditionText())),
            Expanded(flex: 6, child: Center(child: Text('salem'))),
            Expanded(
              flex: 1,
              child: Center(
                child: Text('salem'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
