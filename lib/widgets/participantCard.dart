import 'dart:math';

import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'package:aerochallenge_app/screens/obstacles_list.dart';
import 'package:flutter/material.dart';

class ParticipantCard extends StatelessWidget {

  final SizeConfig sizeConfig = new SizeConfig();
  
  final Equipe equipe;
  final Color color;
  ParticipantCard({this.equipe, this.color});

  @override
  Widget build(BuildContext context) {

    String getInitials(name) {
    List<String> names = name.split(" ");
   print(names);
    String initials = "";
    int numWords = 2;
    if(numWords > names.length) {
      numWords = names.length;
    }
   
    for(var i = 0; i < numWords; i++){
      initials += '${names[i][0]}';
    }
    return initials;
  }

    sizeConfig.init(context);
    // ignore: non_constant_identifier_names
    var _10 = SizeConfig.defaultSize;
    String short = getInitials(equipe.name);

    return Container(
      child: Card(
        color: equipe.hasPlayed ? Colors.grey[400]: PRIMARY_COLOR,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0), 
          ),
        margin: EdgeInsets.fromLTRB(0 ,_10 * 1.5 ,0 ,0 ),
        child: InkWell(
          splashColor: color,
          onTap: () {
            print(equipe.hasPlayed);
            equipe.hasPlayed == false ? Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ObstaclesList(equipe: equipe)),
            ):print('do nothing');
          },
          child: Padding(
          padding: EdgeInsets.all(_10 * 0.8),
          child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Container(
                        width: _10 * 5,
                        height: _10 * 5,
                        margin: EdgeInsets.all(_10),
                        decoration: new BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: Text(
                          short.toUpperCase(), style: TextStyle(color: PRIMARY_COLOR),
                          )
                        ),
                      )
                    ),
                  Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            equipe.name,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 6.0,),
                          Text(
                            equipe.chef,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(child: Text(
                          equipe.hasPlayed ? 'finished': '',
                          style: TextStyle(
                            color: AERO_RED
                          ),
                        ),
                      ),
                    )
                ],
              ),
              
            ),
        )
        ),
      // decoration: new BoxDecoration(
      //                   boxShadow: [
      //                     new BoxShadow(
      //                       color: Colors.black.withOpacity(0.5),
      //                       blurRadius: 10,
      //                       spreadRadius: -5,
      //                       offset: Offset(0,7)
      //                     ),
      //                   ],
      //                 ),
    );
  }

}