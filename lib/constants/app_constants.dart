import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/widgets/aero_button.dart';
import 'package:aerochallenge_app/widgets/obstacles/auschwitz/auschwitz.dart';
import 'package:aerochallenge_app/widgets/obstacles/helipad/helipad.dart';
import 'package:aerochallenge_app/widgets/obstacles/missiles/missiles.dart';
import 'package:aerochallenge_app/widgets/obstacles/podium/podium.dart';
import 'package:aerochallenge_app/widgets/obstacles/torii/torii.dart';
import 'package:aerochallenge_app/widgets/obstacles/wtc/wtc.dart';
import 'package:aerochallenge_app/widgets/texts/obstacle_name_text.dart';
import 'package:flutter/material.dart';

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

List<Widget> obsWidgets_test = [
  Column(
    children: [
      Text(
        '3asssssssssssssssssssbaaaaaaaa',
        style: TextStyle(color: LIGHT_COLOR),
      ),
      Text(
        '3asssssssssssssssssssbaaaaaaaa',
        style: TextStyle(color: LIGHT_COLOR),
      ),
      Text(
        '3asssssssssssssssssssbaaaaaaaa',
        style: TextStyle(color: LIGHT_COLOR),
      ),
    ],
  ),
  Text(
    '3asssssssssssssssssssbaaaaaaaa',
    style: TextStyle(color: LIGHT_COLOR),
  ),
  Text(
    '3asssssssssssssssssssbaaaaaaaa',
    style: TextStyle(color: LIGHT_COLOR),
  )
];

List<Widget> obsWidgets = [
  Helipad(),
  WTC(),
  Auschwitz(),
  Torii(),
  Missiles(),
  Podium()
];
