import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/constants/app_constants.dart';
import 'package:aerochallenge_app/models/action.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'package:aerochallenge_app/widgets/texts/aeroday_edition_text.dart';
import 'package:aerochallenge_app/widgets/appbar_aeroday.dart';
import 'package:aerochallenge_app/widgets/participantCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SizeConfig sizeConfig = new SizeConfig();

  List<Color> colors = [AERO_RED, AERO_YELLOW, AERO_BLUE];
  bool fromMockData = false;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);

    var h = SizeConfig.screenHeight;
    var w = SizeConfig.screenWidth;

    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppbarAeroday.getAppbar(),
      backgroundColor: DARK_COLOR,
      body: Padding(
        padding: EdgeInsets.all(SizeConfig.defaultSize * 1.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: w < h ? 1 : 2,
              child: Center(
                child: AerodayEditionText(),
              ),
            ),
            Expanded(
              flex: w < h ? 8 : 7,
              child: StreamBuilder<QuerySnapshot>(
                      stream: Constants.dbInstance.snapshots(),
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot,
                      ) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        int i = 0;
                        print("=========");
                        return ListView(
                          children: snapshot.data.docs.map<Widget>(
                            (document) {
                              Map<String, dynamic> data = document.data();
                              i++;
                              Equipe equipe = Equipe.fromMap(data);
                              equipe.id = document.id;
                              if (data["historique"] != null) equipe.historique = (data['historique'] as List).map((e) => ActionHist.fromMap(e)).toList();
                              return Container(
                                child: ParticipantCard(
                                  equipe: equipe,
                                  color: colors[i % 3],
                                ),
                              );
                            },
                          ).toList(),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
