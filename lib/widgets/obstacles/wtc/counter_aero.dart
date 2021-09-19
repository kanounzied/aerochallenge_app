import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/widgets/aero_button.dart';
import 'package:flutter/material.dart';

class CounterAero extends StatefulWidget {
  const CounterAero({Key key}) : super(key: key);

  @override
  _CounterAeroState createState() => _CounterAeroState();
}

class _CounterAeroState extends State<CounterAero> {
  int _count = 0;

  void _increment() {
    setState(() {
      if (_count < 3)
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      if(_count >0)
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0, SizeConfig.defaultSize * 4, 0, SizeConfig.defaultSize * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AeroButton(
              content: Icon(Icons.remove, color: DARK_COLOR,),
              height: SizeConfig.defaultSize * 5,
              width: SizeConfig.defaultSize * 5,
              color: AERO_BLUE,
              onPressed: () {
                _decrement();
              }),
          Container(
              width: SizeConfig.defaultSize * 6,
              height: SizeConfig.defaultSize * 5,
              child: Center(
                child: Text(
                  _count.toString(),
                  style: TextStyle(
                      fontSize: SizeConfig.defaultSize * 1.7,
                      color: LIGHT_COLOR),
                ),
              )),
          AeroButton(
            content: Icon(Icons.add, color: DARK_COLOR,),
            height: SizeConfig.defaultSize * 5,
            width: SizeConfig.defaultSize * 5,
            color: AERO_BLUE,
            onPressed: () {
              _increment();
            },
          )
        ],
      ),
    );
  }
}