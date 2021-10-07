import 'dart:async';

import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/constants/app_constants.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'package:aerochallenge_app/screens/final_page/hist_page.dart';
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
import 'package:aerochallenge_app/widgets/timer/timerBloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Game extends StatefulWidget {
  const Game({Key key, @required this.equipe}) : super(key: key);

  final Equipe equipe;

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  CarouselController carouselController = new CarouselController();

  @override
  void initState() {
    historique[widget.equipe.id] = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TimerBloc timerBloc = Provider.of<TimerBloc>(context);

    if (timerBloc.isFinished)
      timerBloc.stopwatch.stop();
    else if (timerBloc.getTime() != "00:00") timerBloc.startTimer();

    if (historique[widget.equipe.id] == null) historique[widget.equipe.id] = [];

    List<Widget> _obsWidgets = [
      Helipad(
          name: widget.equipe.name,
          cc: carouselController,
          contestantId: widget.equipe.id),
      WTC(contestantId: widget.equipe.id, cc: carouselController),
      Auschwitz(contestantId: widget.equipe.id, cc: carouselController),
      Torii(contestantId: widget.equipe.id, cc: carouselController),
      Missiles(contestantId: widget.equipe.id, cc: carouselController),
      Podium(
        cc: carouselController,
        contestantId: widget.equipe.id,
        equipe: widget.equipe,
      )
    ];

    Widget finishText = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize),
        color: AERO_RED,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.defaultSize),
          child: Text("FINISH!"),
        ),
      ),
    );

    return Scaffold(
      appBar: AppbarAeroday.getAppbar(),
      backgroundColor: DARK_COLOR,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: SizeConfig.defaultSize * 1.5,
          ),
          Center(child: AerodayEditionText()),
          SizedBox(
            height: SizeConfig.defaultSize * 2.5,
          ),
          Stack(
            children: [
              Align(
                heightFactor: 2,
                alignment: Alignment.center,
                child: TimerAero(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: PopupMenuButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        Constants.padding * SizeConfig.defaultSize),
                  ),
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: LIGHT_COLOR,
                  ),
                  color: LIGHT_COLOR,
                  itemBuilder: (context) => [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.defaultSize),
                        child: Text(
                          "Helipad",
                          style: TextStyle(color: DARK_COLOR),
                        ),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.defaultSize),
                        child: Text(
                          "WTC",
                          style: TextStyle(color: DARK_COLOR),
                        ),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 2,
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.defaultSize),
                        child: Text(
                          "Auschwitz",
                          style: TextStyle(color: DARK_COLOR),
                        ),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 3,
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.defaultSize),
                        child: Text(
                          "Torii",
                          style: TextStyle(color: DARK_COLOR),
                        ),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 4,
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.defaultSize),
                        child: Text(
                          "Missiles",
                          style: TextStyle(color: DARK_COLOR),
                        ),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 5,
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.defaultSize),
                        child: Text(
                          "Podium",
                          style: TextStyle(color: DARK_COLOR),
                        ),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 6,
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.defaultSize),
                        child: finishText,
                      ),
                    ),
                  ],
                  onSelected: (item) => {
                    if (item == 6)
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistPage(
                              contestantId: widget.equipe.id,
                              equipe: widget.equipe,
                            ),
                          ),
                        ),
                        timerBloc.setIsFinished(true)
                      }
                    else
                      carouselController.jumpToPage(item)
                  },
                ),
              )
            ],
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
            items: _obsWidgets,
            carouselController: carouselController,
          ),
        ],
      ),
    );
  }
}
