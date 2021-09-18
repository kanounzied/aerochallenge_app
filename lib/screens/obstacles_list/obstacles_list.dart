import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/constants/app_constants.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'package:aerochallenge_app/widgets/appbar_aeroday.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ObstaclesList extends StatefulWidget {
  const ObstaclesList({Key key, @required this.equipe}) : super(key: key);

  final Equipe equipe;

  @override
  _ObstaclesListState createState() => _ObstaclesListState();
}

class _ObstaclesListState extends State<ObstaclesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarAeroday.getAppbar(),
      backgroundColor: DARK_COLOR,
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.defaultSize * 1.2),
        child: CarouselSlider(
          options: CarouselOptions(
              height: SizeConfig.screenHeight, viewportFraction: 1),
          items: obsWidgets.map((widget) {
            return Builder(
              builder: (BuildContext context) {
                return widget;
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
