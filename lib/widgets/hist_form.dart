import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/action.dart';
import 'package:aerochallenge_app/screens/game/history.dart';
import 'package:aerochallenge_app/widgets/timer/timerBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'aero_button.dart';

class HistForm extends StatefulWidget {
  const HistForm({Key key, this.contestantId, this.homologationScore})
      : super(key: key);
  final String contestantId;
  final int homologationScore;

  @override
  _HistFormState createState() => _HistFormState();
}

class _HistFormState extends State<HistForm> {
  SizeConfig sizeConfig = new SizeConfig();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sizeConfig.init(context);
    final TimerBloc timerBloc = Provider.of<TimerBloc>(context);

    var actual = historique[widget.contestantId];
    var test = [
      ActionHist(
          obstacle: "helipad",
          time: "1:22",
          type: "validationvalidationvalidation",
          value: 5,
          desc: "desxcription test"),
      ActionHist(
          obstacle: "auschwitz",
          time: "1:22",
          type: "validation",
          value: 5,
          desc: "desxcription test"),
      ActionHist(
          obstacle: "torii",
          time: "1:22",
          type: "validation",
          value: 5,
          desc: "desxcription test"),
      ActionHist(
          obstacle: "wtc",
          time: "1:22",
          type: "validation",
          value: 5,
          desc: "desxcription test"),
      ActionHist(
          obstacle: "podium",
          time: "1:22",
          type: "validation",
          value: 5,
          desc: "desxcription test"),
      ActionHist(
          obstacle: "podium",
          time: "1:22",
          type: "validation",
          value: 5,
          desc: "desxcription test"),
      ActionHist(
          obstacle: "podium",
          time: "1:22",
          type: "validation",
          value: 5,
          desc: "desxcription test"),
      ActionHist(
          obstacle: "podium",
          time: "1:22",
          type: "validation",
          value: 5,
          desc: "desxcription test"),
      ActionHist(
          obstacle: "podium",
          time: "1:22",
          type: "validation",
          value: 5,
          desc: "desxcription test"),
      ActionHist(
          obstacle: "podium",
          time: "1:22",
          type: "validation",
          value: 5,
          desc: "desxcription test"),
      ActionHist(
          obstacle: "podium",
          time: "1:22",
          type: "validation",
          value: 5,
          desc: "desxcription test"),
      ActionHist(
          obstacle: "podium",
          time: "1:22",
          type: "validation",
          value: 5,
          desc: "desxcription test"),
      ActionHist(
          obstacle: "podium",
          time: "1:22",
          type: "validation",
          value: 5,
          desc: "desxcription test"),
    ];
    int total = 0;
    return Container(
      decoration: BoxDecoration(
        color: LIGHT_COLOR,
        border: Border.all(
          color: Colors.black38,
        ),
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize * 2.4),
      ),
      child: SizedBox(
        height: SizeConfig.defaultSize * 60,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(SizeConfig.defaultSize * 1.2),
              height: SizeConfig.defaultSize * 6,
              child: Center(
                child: Text(
                  'Game History!',
                  style: TextStyle(
                    color: AERO_RED,
                    fontSize: SizeConfig.defaultSize * 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.defaultSize * 3,
            ),
            SizedBox(
              height: SizeConfig.defaultSize * 4,
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            "Time",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.defaultSize * 1.6,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Center(
                          child: Text(
                            "Obstacle",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.defaultSize * 1.6,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Center(
                          child: Text(
                            "Type  ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.defaultSize * 1.6,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          "Valeur",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.defaultSize * 1.6,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.black),
                ],
              ),
            ),
            Flexible(
              child: ListView(
                children: [
                  DataTable(
                    headingRowHeight: 0,
                    columnSpacing: SizeConfig.defaultSize * 2,
                    columns: [
                      DataColumn(label: Text("")), //Time")),
                      DataColumn(label: Text("")), //Obstacle")),
                      DataColumn(label: Text("")), //Type")),
                      DataColumn(label: Text(""), numeric: true), //Valeur")),
                    ],
                    rows: actual.map((e) {
                      total += e.value;
                      print(e.obstacle);
                      if (e.obstacle == "podium") {
                        print(timerBloc.getSeconds());
                        total += (timerBloc.getSeconds() ~/ 5) * 2;
                        print("podium: " + e.value.toString());
                        print(total);
                      }
                      return DataRow(
                        cells: [
                          DataCell(Center(
                              child: Text(
                            e.time,
                            textAlign: TextAlign.center,
                          ))),
                          DataCell(Center(
                              child: Text(
                            e.obstacle,
                            textAlign: TextAlign.center,
                          ))),
                          DataCell(Container(
                            child: Center(
                                child: Text(
                              e.type,
                              textAlign: TextAlign.center,
                            )),
                            width: SizeConfig.defaultSize * 10,
                          )),
                          DataCell(
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    e.value.toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      Icons.delete,
                                      color: DARK_COLOR,
                                    ),
                                    onPressed: () {
                                      actual.remove(e);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  Divider(color: Colors.black38),
                  SizedBox(
                    width: SizeConfig.screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AeroButton(
                          content: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Add action",
                                  style: TextStyle(
                                    fontSize: SizeConfig.defaultSize * 1.8,
                                  ),
                                ),
                                WidgetSpan(
                                  // alignment: PlaceholderAlignment.middle,
                                  child: Icon(
                                    Icons.add,
                                    color: LIGHT_COLOR,
                                    size: SizeConfig.defaultSize * 2.2,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          color: DARK_COLOR,
                          width: SizeConfig.screenWidth * 0.4,
                          height: SizeConfig.defaultSize * 4.5,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.black),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        0,
                        /*SizeConfig.defaultSize*/ 20,
                        0,
                        /*SizeConfig.defaultSize*/ 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: SizeConfig.defaultSize * 2),
                            Text(
                              "HOMOLOGATION : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.defaultSize * 1.6,
                              ),
                            ),
                            Text(widget.homologationScore.toString()),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.defaultSize * 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: SizeConfig.defaultSize * 2),
                            Text(
                              "TOTAL : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.defaultSize * 1.6,
                              ),
                            ),
                            Text((total + widget.homologationScore).toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
