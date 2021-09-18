import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:flutter/material.dart';

class AeroButton extends StatelessWidget {
  AeroButton({this.content, this.onPressed, this.height, this.width, this.color, this.textColor});

  double width;
  double height;
  Color color;
  Color textColor;
  Widget content;
  Function onPressed;

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
        onPressed: onPressed,
        child: content,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(width, height)),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeConfig.defaultSize * 1.8),
              side: BorderSide(color: Colors.black38),
            ),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              color: textColor,
              fontSize: 20
            )
          ),
        ),
      );
  }
}
