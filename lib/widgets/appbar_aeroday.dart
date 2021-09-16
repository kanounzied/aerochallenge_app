import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:flutter/material.dart';

class AppbarAeroday {
  static AppBar getAppbar() {
    return AppBar(
      toolbarHeight: SizeConfig.defaultSize * 7.0,
      backgroundColor: DARK_COLOR,
      title: Image.asset(
        'assets/LogoWhite.png',
        width: SizeConfig.screenWidth * 0.4,
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }
}
