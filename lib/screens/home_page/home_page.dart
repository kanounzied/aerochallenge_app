import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'package:aerochallenge_app/widgets/participantCard.dart';
import 'dart:math' as math;
import 'package:aerochallenge_app/wing_icon_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  SizeConfig sizeConfig = new SizeConfig();

  // List<Equipe> participants = [
  //   Equipe(chef: 'zied',members: ['zied', 'baha', 'ka3'], name: 'aa chmikh'),
  //   Equipe(chef: 'baha',members: ['zied', 'baha', 'ka3'], name: 'aa chmikh'),
  //   Equipe(chef: 'ka3',members: ['zied', 'baha', 'ka3'], name: 'caa hmikh'),
  //   Equipe(chef: 'zied',members: ['zied', 'baha', 'ka3'], name: 'aa chmikh'),
  //   Equipe(chef: 'baha',members: ['zied', 'baha', 'ka3'], name: 'aa chmikh'),
  //   Equipe(chef: 'ka3',members: ['zied', 'baha', 'ka3'], name: 'caa hmikh'),
  //   Equipe(chef: 'zied',members: ['zied', 'baha', 'ka3'], name: 'aa chmikh'),
  //   Equipe(chef: 'baha',members: ['zied', 'baha', 'ka3'], name: 'aa chmikh'),
  //   Equipe(chef: 'ka3',members: ['zied', 'baha', 'ka3'], name: 'caa hmikh'),
  // ];

  List<Color> colors = [AERO_RED, AERO_YELLOW, AERO_Blue];

  @override
  Widget build(BuildContext context) {

    sizeConfig.init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: DARK_COLOR,
          title: Center(
            child: Image.asset(
              'assets/LogoWhite.png',
              width: SizeConfig.screenWidth * 0.4,
            ),
          ),
          centerTitle: true,
          )
        ),
      backgroundColor: DARK_COLOR,
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(WingIcon.feather_wing, size: 24, color: AERO_YELLOW,),
                        ),
                        TextSpan(
                          text: '  aerochallenge edition  ',
                          style: TextStyle(
                            fontSize: 21,
                            color: AERO_YELLOW,
                            fontFamily: 'playfairDisplay'
                          ),
                        ),
                        WidgetSpan(
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(math.pi),
                            child: Icon(WingIcon.feather_wing, size: 24,color: AERO_YELLOW,),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ) 
                )
              ),
              Expanded(
                flex: 8,
                child: //Center(
                //   child: ListView.builder(
                //     itemCount: participants.length,
                //     physics: BouncingScrollPhysics(),
                //     itemBuilder: (context, index) {
                //       return ParticipantCard(equipe: participants[index], color: colors[index % 3]);
                //     }
                //   ) 
                // )
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('equipes').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    int i = 0;
                    print("=========");
                    return ListView(
                      children: snapshot.data.docs.map((document) {
                        Map<String, dynamic> data = document.data();
                        i++;
                        Equipe equipe = Equipe.fromMap(data);
                        return Container(
                          child: ParticipantCard(equipe: equipe, color: colors[i % 3]),
                        );
                      }).toList(),
                    );
                  },
                )
              )
            ],
          ),
      )
    );
  }
}