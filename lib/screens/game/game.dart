import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'package:aerochallenge_app/screens/game/history.dart';
import 'package:aerochallenge_app/widgets/appbar_aeroday.dart';
import 'package:aerochallenge_app/widgets/obstacles/auschwitz/auschwitz.dart';
import 'package:aerochallenge_app/widgets/obstacles/helipad/helipad.dart';
import 'package:aerochallenge_app/widgets/obstacles/missiles/missiles.dart';
import 'package:aerochallenge_app/widgets/obstacles/podium/podium.dart';
import 'package:aerochallenge_app/widgets/obstacles/torii/torii.dart';
import 'package:aerochallenge_app/widgets/obstacles/wtc/wtc.dart';
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

  // List<Widget> _obsWidgets = [
  //   Helipad(),
  //   WTC(),
  //   Auschwitz(),
  //   Torii(),
  //   Missiles(),
  //   Podium()
  // ];

  @override
  Widget build(BuildContext context) {

    List<Widget> _obsWidgets = [
      Helipad(name: widget.equipe.name),
      WTC(name: widget.equipe.name),
      Auschwitz(name: widget.equipe.name),
      Torii(name: widget.equipe.name),
      Missiles(name: widget.equipe.name),
      Podium(name: widget.equipe.name)
    ];

    historique[widget.equipe.name] = [];

    return Scaffold(
      appBar: AppbarAeroday.getAppbar(),
      backgroundColor: DARK_COLOR,
      body:
          // Padding(
          //   padding: EdgeInsets.all(SizeConfig.defaultSize * 1.2),
          //   child:
          Column(
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
            items: _obsWidgets.map((widget) {
              return Builder(
                builder: (BuildContext context) {
                  return widget;
                },
              );
            }).toList(),
          )
        ],
      ),
      // ),
    );
  }
}
