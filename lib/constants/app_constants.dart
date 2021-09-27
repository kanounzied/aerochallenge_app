import 'package:aerochallenge_app/widgets/obstacles/auschwitz/auschwitz.dart';
import 'package:aerochallenge_app/widgets/obstacles/helipad/helipad.dart';
import 'package:aerochallenge_app/widgets/obstacles/missiles/missiles.dart';
import 'package:aerochallenge_app/widgets/obstacles/podium/podium.dart';
import 'package:aerochallenge_app/widgets/obstacles/torii/torii.dart';
import 'package:aerochallenge_app/widgets/obstacles/wtc/wtc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

// List<Widget> obsWidgets = [
//       Helipad(name: obstacles[0]['name']),
//       WTC(name: obstacles[1]['name']),
//       Auschwitz(name: obstacles[2]['name']),
//       Torii(name: obstacles[3]['name']),
//       Missiles(name: obstacles[4]['name']),
//       Podium(name: obstacles[5]['name'])
//     ];

final dbInstance = FirebaseFirestore.instance.collection('equipes');//.snapshots();
