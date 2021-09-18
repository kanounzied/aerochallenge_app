import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/widgets/aero_button.dart';
import 'package:aerochallenge_app/widgets/aeroday_edition_text.dart';
import 'package:aerochallenge_app/widgets/timer/timer.dart';
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
  Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      SizedBox(
        height: SizeConfig.defaultSize * 1.5,
      ),
      Center(child: AerodayEditionText()),
      SizedBox(
        height: SizeConfig.defaultSize * 2.5,
      ),
      Center(
        child: Text(
          obstacles[0]['name'],
          style: TextStyle(
            fontSize: SizeConfig.defaultSize * 1.9,
            fontWeight: FontWeight.bold,
            color: LIGHT_COLOR,
          ),
        ),
      ),
      SizedBox(
        height: SizeConfig.defaultSize * 2,
      ),
      Center(child: TimerAero()),
      Expanded(
        // flex: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 4,
              child: Center(
                child: Image.asset(
                  'assets/obstacles/helipad.png',
                  width: SizeConfig.screenWidth * 0.5,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AeroButton(
                    content: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          SizeConfig.defaultSize * 0.2,
                          SizeConfig.defaultSize * 0.4),
                      child: Image.asset(
                        'assets/obstacles/drone_hit.png',
                        width: SizeConfig.defaultSize * 4,
                      ),
                    ),
                    width: SizeConfig.defaultSize * 7,
                    height: SizeConfig.defaultSize * 7,
                    color: AERO_BLUE,
                    textColor: DARK_COLOR,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize * 5,
                  ),
                  AeroButton(
                    content: Text(
                      '-3',
                      style: TextStyle(
                          color: DARK_COLOR, fontWeight: FontWeight.bold),
                    ),
                    color: AERO_BLUE,
                    width: SizeConfig.defaultSize * 7,
                    height: SizeConfig.defaultSize * 7,
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AeroButton(
            content: Text(
              'VALIDER',
              style: TextStyle(fontSize: SizeConfig.defaultSize * 1.65),
            ),
            width: SizeConfig.screenWidth * 0.4,
            height: SizeConfig.defaultSize * 6,
            color: AERO_BLUE,
            textColor: LIGHT_COLOR,
            onPressed: () {},
          ),
          SizedBox(width: SizeConfig.defaultSize * 3),
          AeroButton(
            content: Text(
              'ANNULER',
              style: TextStyle(fontSize: SizeConfig.defaultSize * 1.65),
            ),
            width: SizeConfig.screenWidth * 0.4,
            height: SizeConfig.defaultSize * 6,
            color: AERO_RED,
            textColor: LIGHT_COLOR,
            onPressed: () {},
          ),
        ],
      ),
      SizedBox(
        height: SizeConfig.defaultSize * 2,
      ),
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Expanded(flex: 1, child: Center(child: AerodayEditionText())),
      Expanded(
        flex: 1,
        child: Center(
          child: Text(
            obstacles[0]['name'],
            style: TextStyle(
              fontSize: SizeConfig.defaultSize * 1.9,
              fontWeight: FontWeight.bold,
              color: LIGHT_COLOR,
            ),
          ),
        ),
      ),
      Expanded(flex: 1, child: Center(child: TimerAero())),
      Expanded(
        flex: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 4,
              child: Center(
                child: Image.asset(
                  'assets/obstacles/helipad.png',
                  width: SizeConfig.screenWidth * 0.5,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AeroButton(
                    content: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          SizeConfig.defaultSize * 0.2,
                          SizeConfig.defaultSize * 0.4),
                      child: Image.asset(
                        'assets/obstacles/drone_hit.png',
                        width: SizeConfig.defaultSize * 4,
                      ),
                    ),
                    width: SizeConfig.defaultSize * 7,
                    height: SizeConfig.defaultSize * 7,
                    color: AERO_BLUE,
                    textColor: DARK_COLOR,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize * 5,
                  ),
                  AeroButton(
                    content: Text(
                      '-3',
                      style: TextStyle(
                          color: DARK_COLOR, fontWeight: FontWeight.bold),
                    ),
                    color: AERO_BLUE,
                    width: SizeConfig.defaultSize * 7,
                    height: SizeConfig.defaultSize * 7,
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Expanded(
        flex: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AeroButton(
              content: Text(
                'VALIDER',
                style: TextStyle(fontSize: SizeConfig.defaultSize * 1.65),
              ),
              width: SizeConfig.screenWidth * 0.4,
              height: SizeConfig.defaultSize * 6,
              color: AERO_BLUE,
              textColor: LIGHT_COLOR,
              onPressed: () {},
            ),
            SizedBox(width: SizeConfig.defaultSize * 3),
            AeroButton(
              content: Text(
                'ANNULER',
                style: TextStyle(fontSize: SizeConfig.defaultSize * 1.65),
              ),
              width: SizeConfig.screenWidth * 0.4,
              height: SizeConfig.defaultSize * 6,
              color: AERO_RED,
              textColor: LIGHT_COLOR,
              onPressed: () {},
            ),
          ],
        ),
      )
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Expanded(flex: 1, child: Center(child: AerodayEditionText())),
      Expanded(
        flex: 1,
        child: Center(
          child: Text(
            obstacles[0]['name'],
            style: TextStyle(
              fontSize: SizeConfig.defaultSize * 1.9,
              fontWeight: FontWeight.bold,
              color: LIGHT_COLOR,
            ),
          ),
        ),
      ),
      Expanded(flex: 1, child: Center(child: TimerAero())),
      Expanded(
        flex: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 4,
              child: Center(
                child: Image.asset(
                  'assets/obstacles/helipad.png',
                  width: SizeConfig.screenWidth * 0.5,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AeroButton(
                    content: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          SizeConfig.defaultSize * 0.2,
                          SizeConfig.defaultSize * 0.4),
                      child: Image.asset(
                        'assets/obstacles/drone_hit.png',
                        width: SizeConfig.defaultSize * 4,
                      ),
                    ),
                    width: SizeConfig.defaultSize * 7,
                    height: SizeConfig.defaultSize * 7,
                    color: AERO_BLUE,
                    textColor: DARK_COLOR,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize * 5,
                  ),
                  AeroButton(
                    content: Text(
                      '-3',
                      style: TextStyle(
                          color: DARK_COLOR, fontWeight: FontWeight.bold),
                    ),
                    color: AERO_BLUE,
                    width: SizeConfig.defaultSize * 7,
                    height: SizeConfig.defaultSize * 7,
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Expanded(
        flex: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AeroButton(
              content: Text(
                'VALIDER',
                style: TextStyle(fontSize: SizeConfig.defaultSize * 1.65),
              ),
              width: SizeConfig.screenWidth * 0.4,
              height: SizeConfig.defaultSize * 6,
              color: AERO_BLUE,
              textColor: LIGHT_COLOR,
              onPressed: () {},
            ),
            SizedBox(width: SizeConfig.defaultSize * 3),
            AeroButton(
              content: Text(
                'ANNULER',
                style: TextStyle(fontSize: SizeConfig.defaultSize * 1.65),
              ),
              width: SizeConfig.screenWidth * 0.4,
              height: SizeConfig.defaultSize * 6,
              color: AERO_RED,
              textColor: LIGHT_COLOR,
              onPressed: () {},
            ),
          ],
        ),
      )
    ],
  ),
];

List<Widget> obsWidgets_backup = [
  Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Expanded(flex: 1, child: Center(child: AerodayEditionText())),
      Expanded(
        flex: 1,
        child: Center(
          child: Text(
            obstacles[0]['name'],
            style: TextStyle(
              fontSize: SizeConfig.defaultSize * 1.9,
              fontWeight: FontWeight.bold,
              color: LIGHT_COLOR,
            ),
          ),
        ),
      ),
      Expanded(flex: 1, child: Center(child: TimerAero())),
      Expanded(
        flex: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 4,
              child: Center(
                child: Image.asset(
                  'assets/obstacles/helipad.png',
                  width: SizeConfig.screenWidth * 0.5,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AeroButton(
                    content: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0,
                          0,
                          SizeConfig.defaultSize * 0.2,
                          SizeConfig.defaultSize * 0.4),
                      child: Image.asset(
                        'assets/obstacles/drone_hit.png',
                        width: SizeConfig.defaultSize * 4,
                      ),
                    ),
                    width: SizeConfig.defaultSize * 7,
                    height: SizeConfig.defaultSize * 7,
                    color: AERO_BLUE,
                    textColor: DARK_COLOR,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize * 5,
                  ),
                  AeroButton(
                    content: Text(
                      '-3',
                      style: TextStyle(
                          color: DARK_COLOR, fontWeight: FontWeight.bold),
                    ),
                    color: AERO_BLUE,
                    width: SizeConfig.defaultSize * 7,
                    height: SizeConfig.defaultSize * 7,
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Expanded(
        flex: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AeroButton(
              content: Text(
                'VALIDER',
                style: TextStyle(fontSize: SizeConfig.defaultSize * 1.65),
              ),
              width: SizeConfig.screenWidth * 0.4,
              height: SizeConfig.defaultSize * 6,
              color: AERO_BLUE,
              textColor: LIGHT_COLOR,
              onPressed: () {},
            ),
            SizedBox(width: SizeConfig.defaultSize * 3),
            AeroButton(
              content: Text(
                'ANNULER',
                style: TextStyle(fontSize: SizeConfig.defaultSize * 1.65),
              ),
              width: SizeConfig.screenWidth * 0.4,
              height: SizeConfig.defaultSize * 6,
              color: AERO_RED,
              textColor: LIGHT_COLOR,
              onPressed: () {},
            ),
          ],
        ),
      )
    ],
  ),
  Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(flex: 1, child: Center(child: AerodayEditionText())),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              obstacles[0]['name'],
              style: TextStyle(
                fontSize: SizeConfig.defaultSize * 1.9,
                fontWeight: FontWeight.bold,
                color: LIGHT_COLOR,
              ),
            ),
          ),
        ),
        Expanded(flex: 1, child: Center(child: TimerAero())),
        Expanded(
          flex: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: Center(
                  child: Image.asset(
                    'assets/obstacles/helipad.png',
                    width: SizeConfig.screenWidth * 0.5,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AeroButton(
                      content: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0,
                            0,
                            SizeConfig.defaultSize * 0.2,
                            SizeConfig.defaultSize * 0.4),
                        child: Image.asset(
                          'assets/obstacles/drone_hit.png',
                          width: SizeConfig.defaultSize * 4,
                        ),
                      ),
                      width: SizeConfig.defaultSize * 7,
                      height: SizeConfig.defaultSize * 7,
                      color: AERO_BLUE,
                      textColor: DARK_COLOR,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize * 5,
                    ),
                    AeroButton(
                      content: Text(
                        '-3',
                        style: TextStyle(
                            color: DARK_COLOR, fontWeight: FontWeight.bold),
                      ),
                      color: AERO_BLUE,
                      width: SizeConfig.defaultSize * 7,
                      height: SizeConfig.defaultSize * 7,
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AeroButton(
                content: Text(
                  'VALIDER',
                  style: TextStyle(fontSize: SizeConfig.defaultSize * 1.65),
                ),
                width: SizeConfig.screenWidth * 0.4,
                height: SizeConfig.defaultSize * 6,
                color: AERO_BLUE,
                textColor: LIGHT_COLOR,
                onPressed: () {},
              ),
              SizedBox(width: SizeConfig.defaultSize * 3),
              AeroButton(
                content: Text(
                  'ANNULER',
                  style: TextStyle(fontSize: SizeConfig.defaultSize * 1.65),
                ),
                width: SizeConfig.screenWidth * 0.4,
                height: SizeConfig.defaultSize * 6,
                color: AERO_RED,
                textColor: LIGHT_COLOR,
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    ),
  ),
  Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(flex: 1, child: Center(child: AerodayEditionText())),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              obstacles[0]['name'],
              style: TextStyle(
                fontSize: SizeConfig.defaultSize * 1.9,
                fontWeight: FontWeight.bold,
                color: LIGHT_COLOR,
              ),
            ),
          ),
        ),
        Expanded(flex: 1, child: Center(child: TimerAero())),
        Expanded(
          flex: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: Center(
                  child: Image.asset(
                    'assets/obstacles/helipad.png',
                    width: SizeConfig.screenWidth * 0.5,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AeroButton(
                      content: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0,
                            0,
                            SizeConfig.defaultSize * 0.2,
                            SizeConfig.defaultSize * 0.4),
                        child: Image.asset(
                          'assets/obstacles/drone_hit.png',
                          width: SizeConfig.defaultSize * 4,
                        ),
                      ),
                      width: SizeConfig.defaultSize * 7,
                      height: SizeConfig.defaultSize * 7,
                      color: AERO_BLUE,
                      textColor: DARK_COLOR,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize * 5,
                    ),
                    AeroButton(
                      content: Text(
                        '-3',
                        style: TextStyle(
                            color: DARK_COLOR, fontWeight: FontWeight.bold),
                      ),
                      color: AERO_BLUE,
                      width: SizeConfig.defaultSize * 7,
                      height: SizeConfig.defaultSize * 7,
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AeroButton(
                content: Text(
                  'VALIDER',
                  style: TextStyle(fontSize: SizeConfig.defaultSize * 1.65),
                ),
                width: SizeConfig.screenWidth * 0.4,
                height: SizeConfig.defaultSize * 6,
                color: AERO_BLUE,
                textColor: LIGHT_COLOR,
                onPressed: () {},
              ),
              SizedBox(width: SizeConfig.defaultSize * 3),
              AeroButton(
                content: Text(
                  'ANNULER',
                  style: TextStyle(fontSize: SizeConfig.defaultSize * 1.65),
                ),
                width: SizeConfig.screenWidth * 0.4,
                height: SizeConfig.defaultSize * 6,
                color: AERO_RED,
                textColor: LIGHT_COLOR,
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    ),
  ),
];
