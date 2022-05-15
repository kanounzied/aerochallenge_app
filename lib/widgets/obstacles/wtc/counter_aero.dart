import 'dart:developer';

import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/widgets/aero_button.dart';
import 'package:aerochallenge_app/widgets/obstacles/wtc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterAero extends StatelessWidget {
  const CounterAero({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = Provider.of<CounterBloc>(context);
    return Container(
      margin: EdgeInsets.fromLTRB(
          0, SizeConfig.defaultSize * 4, 0, SizeConfig.defaultSize * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AeroButton(
              content: Icon(
                Icons.remove,
                color: DARK_COLOR,
              ),
              height: SizeConfig.defaultSize * 5,
              width: SizeConfig.defaultSize * 5,
              color: AERO_BLUE,
              onPressed: () {
                counterBloc.decrement();
              }),
          Container(
              width: SizeConfig.defaultSize * 6,
              height: SizeConfig.defaultSize * 5,
              child: Center(
                child: Text(
                  counterBloc.count.toString(),
                  style: TextStyle(
                      fontSize: SizeConfig.defaultSize * 1.7,
                      color: LIGHT_COLOR),
                ),
              )),
          AeroButton(
            content: Icon(
              Icons.add,
              color: DARK_COLOR,
            ),
            height: SizeConfig.defaultSize * 5,
            width: SizeConfig.defaultSize * 5,
            color: AERO_BLUE,
            onPressed: () {
              counterBloc.increment();
            },
          )
        ],
      ),
    );
  }
}
