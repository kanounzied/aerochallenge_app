import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/constants/app_constants.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'package:aerochallenge_app/widgets/appbar_aeroday.dart';
import 'package:aerochallenge_app/widgets/texts/aeroday_edition_text.dart';
import 'package:aerochallenge_app/widgets/timer/timer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key key, @required this.equipe}) : super(key: key);

  final Equipe equipe;

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarAeroday.getAppbar(),
      backgroundColor: DARK_COLOR,
      body: Column(
        children: [
          SizedBox(
            height: SizeConfig.defaultSize * 1.5,
          ),
          Center(child: AerodayEditionText()),
          SizedBox(
            height: SizeConfig.defaultSize * 2.5,
          ),
          Center(
            child: TimerAero(),
          ),
          SizedBox(
            height: SizeConfig.defaultSize * 2,
          ),
          CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              height: SizeConfig.screenHeight * 0.75,
              viewportFraction: 1,
            ),
            items: obsWidgets.map((widget) {
              return Builder(
                builder: (BuildContext context) {
                  return widget;
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
