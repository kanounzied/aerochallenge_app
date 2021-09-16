import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'dart:math' as math;
import 'package:aerochallenge_app/wing_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartPage extends StatelessWidget {

  const StartPage({ Key key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    List<Color> colors = [AERO_RED, AERO_YELLOW, AERO_Blue];

    SizeConfig sizeConfig = new SizeConfig();
    sizeConfig.init(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: DARK_COLOR,
          title: Padding(
            padding: EdgeInsets.only(top: SizeConfig.defaultSize * 1.5),
            child: Center(
              child: Image.asset(
                'assets/LogoWhite.png',
                width: SizeConfig.screenWidth * 0.4,
              ),
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
                flex: 6,
                child: Center(
                  child: Text('salem')
                )
              ),
              Expanded(
                flex: 1,
                child: Center(child: Text('salem'),),
                )
            ],
          ),
      )
    );
  }
}