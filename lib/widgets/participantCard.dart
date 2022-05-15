import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'package:aerochallenge_app/screens/final_page/hist_page.dart';
import 'package:aerochallenge_app/screens/start_page/start_page.dart';
import 'package:flutter/material.dart';

import 'custom_page_route.dart';

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
      if (numWords > names.length) {
        numWords = names.length;
      }

      for (var i = 0; i < numWords; i++) {
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
        color: equipe.hasPlayed ? Colors.grey[400] : LIGHT_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        margin: EdgeInsets.fromLTRB(0, _10 * 1.5, 0, 0),
        child: InkWell(
          splashColor: color,
          onTap: () {
            !equipe.hasPlayed
                ? Navigator.push(
                    context,
                    CustomPageRoute(child: StartPage(equipe: equipe)),
                  )
                : Navigator.push(
                    context,
                    CustomPageRoute(child: HistPage(equipe: equipe, contestantId: equipe.id, fromHome: true)),
                  );
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
                      child: Center(
                          child: Text(
                        short.toUpperCase(),
                        style: TextStyle(color: LIGHT_COLOR),
                      )),
                    )),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        equipe.name,
                        style: TextStyle(
                          fontSize: _10 * 1.8,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: _10 * 0.6,
                      ),
                      Text(
                        equipe.chef,
                        style: TextStyle(
                          fontSize: _10 * 1.6,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: equipe.hasPlayed
                      ? Icon(
                          Icons.check_circle,
                          size: SizeConfig.defaultSize * 3,
                          color: color,
                        )
                      : Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
