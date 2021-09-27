import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:flutter/cupertino.dart';

class ObstacleNameText extends StatelessWidget {
  ObstacleNameText({this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: SizeConfig.defaultSize * 1.9,
        fontWeight: FontWeight.bold,
        color: LIGHT_COLOR,
      ),
    );
  }
}
