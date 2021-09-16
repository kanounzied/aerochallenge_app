// import 'package:aerochallenge_app/config/responsive_size.dart';
// import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'package:aerochallenge_app/widgets/aeroday_edition_text.dart';
import 'package:aerochallenge_app/widgets/appbar_aeroday.dart';
import 'package:aerochallenge_app/widgets/participantCard.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../wing_icon_icons.dart';

class ObstaclesList extends StatefulWidget {
  const ObstaclesList({Key key, @required this.equipe}) : super(key: key);

  final Equipe equipe;

  @override
  _ObstaclesListState createState() => _ObstaclesListState();
}

class _ObstaclesListState extends State<ObstaclesList> {
  var obstacles = [
    {
      "name": "helipad",
      "sonctions": ["-3"],
      "success": 5
    },
    {
      "name": "WTC",
      "sonctions": ["-5", "-10"],
      "counter": 0,
      "success": [-5, 10, 25, 40]
    },
    {
      "name": "auschwitz",
      "sonctions": ["-5"],
      "success": {
        "niveau1": {"5": 25, "7": 40},
        "niveau2": {"5": 10, "7": 20},
      },
      "record": 0
    },
    {
      "name": "torii",
      "sonctions": ["-5"],
      "success": 20
    },
    {
      "name": "missiles",
      "sonctions": ["-5", "-10"],
      "success": {"2": 15, "3": 30}
    },
    {
      "name": "podium",
      "success": [0, 25, 10, 5]
    }
  ];

  List<Equipe> participants = [
    Equipe(chef: 'zied', members: ['zied', 'baha', 'ka3'], name: 'aa chmikh'),
    Equipe(chef: 'baha', members: ['zied', 'baha', 'ka3'], name: 'aa chmikh'),
    Equipe(chef: 'ka3', members: ['zied', 'baha', 'ka3'], name: 'caa hmikh'),
    Equipe(chef: 'zied', members: ['zied', 'baha', 'ka3'], name: 'aa chmikh'),
    Equipe(chef: 'baha', members: ['zied', 'baha', 'ka3'], name: 'aa chmikh'),
    Equipe(chef: 'ka3', members: ['zied', 'baha', 'ka3'], name: 'caa hmikh'),
    Equipe(chef: 'zied', members: ['zied', 'baha', 'ka3'], name: 'aa chmikh'),
    Equipe(chef: 'baha', members: ['zied', 'baha', 'ka3'], name: 'aa chmikh'),
    Equipe(chef: 'ka3', members: ['zied', 'baha', 'ka3'], name: 'caa hmikh'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarAeroday.getAppbar(),
      backgroundColor: DARK_COLOR,
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: AerodayEditionText(),
              ),
            ),
            Expanded(
              flex: 8,
              child: Center(
                child: ListView.builder(
                  itemCount: participants.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ParticipantCard(
                        equipe: participants[index], color: AERO_RED);
                  },
                ),
              ),
            ),
            //   StreamBuilder<QuerySnapshot>(
            //     stream: FirebaseFirestore.instance.collection('equipes').snapshots(),
            //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //       if (!snapshot.hasData) {
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //       int i = 0;
            //       print("=========");
            //       return ListView(
            //         children: snapshot.data.docs.map((document) {
            //           Map<String, dynamic> data = document.data();
            //           i++;
            //           Equipe equipe = Equipe.fromMap(data);
            //           return Container(
            //             child: ParticipantCard(equipe: equipe, color: colors[i % 3]),
            //           );
            //         }).toList(),
            //       );
            //     },
            //   )
            // )
          ],
        ),
      ),
    );
  }
}
