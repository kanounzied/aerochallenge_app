import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/constants/app_constants.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'package:aerochallenge_app/screens/game/history.dart';
import 'package:aerochallenge_app/screens/home_page/home_page.dart';
import 'package:aerochallenge_app/widgets/aero_button.dart';
import 'package:aerochallenge_app/widgets/appbar_aeroday.dart';
import 'package:aerochallenge_app/widgets/hist_form.dart';
import 'package:aerochallenge_app/widgets/texts/aeroday_edition_text.dart';
import 'package:aerochallenge_app/widgets/timer/timerBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistPage extends StatelessWidget {
  const HistPage({Key key, this.contestantId, this.equipe}) : super(key: key);
  final String contestantId;
  final Equipe equipe;

  @override
  Widget build(BuildContext context) {
    final TimerBloc timerBloc = Provider.of<TimerBloc>(context);

    print("TEST HIST PAGE BUILD!!!");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppbarAeroday.getAppbar(),
      backgroundColor: DARK_COLOR,
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.defaultSize * 1.2),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: SizeConfig.defaultSize * 3,
              ),
              Center(child: AerodayEditionText()),
              SizedBox(
                height: SizeConfig.defaultSize * 3,
              ),
              Expanded(
                child: Center(
                  child: HistForm(
                    contestantId: contestantId,
                    homologationScore: equipe.homologationScore,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.defaultSize * 3,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: SizeConfig.defaultSize * 2),
                child: AeroButton(
                  content: Text('CONFIRM SCORE'),
                  onPressed: () {
                    timerBloc.stopTimer();
                    timerBloc.setIsFinished(false);
                    int timeScore = (timerBloc.getSeconds() ~/ 5) * 2;
                    List<Map<String, dynamic>> maplist =
                        []; // list of actions in map form
                    int total = 0;
                    historique[contestantId].forEach((element) {
                      maplist.add(element.toMap());
                      total += element.value;
                    });
                    total += timeScore;
                    print("total without homologation: " + total.toString());
                    total += equipe.homologationScore;

                    Constants.dbInstance
                        .doc(contestantId)
                        .update({"historique": maplist, "total": total})
                        .then((value) => print("historique updated"))
                        .catchError(
                            (e) => print("db update error: " + e.toString()));
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (Route<dynamic> route) => false);
                  },
                  width: SizeConfig.screenWidth * 0.8,
                  height: SizeConfig.defaultSize * 6,
                  color: AERO_RED,
                  textColor: LIGHT_COLOR,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
