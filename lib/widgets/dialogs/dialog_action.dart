import 'package:aerochallenge_app/config/responsive_size.dart';
import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/constants/app_constants.dart';
import 'package:aerochallenge_app/models/action.dart';
import 'package:flutter/material.dart';

import '../aero_button.dart';

class DialogAction extends StatefulWidget {
  const DialogAction({Key key, this.title, this.text, this.content, this.onPressed})
      : super(key: key);

  final String title;
  final String text;
  final Widget content;
  final Function onPressed;

  @override
  _DialogActionState createState() => _DialogActionState();
}

class _DialogActionState extends State<DialogAction> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(Constants.padding * SizeConfig.defaultSize),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding * SizeConfig.defaultSize,
              top: Constants.avatarRadius * SizeConfig.defaultSize +
                  Constants.padding * SizeConfig.defaultSize,
              right: Constants.padding * SizeConfig.defaultSize,
              bottom: Constants.padding * SizeConfig.defaultSize),
          margin: EdgeInsets.only(
              top: Constants.avatarRadius * SizeConfig.defaultSize),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  Constants.padding * SizeConfig.defaultSize),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 0),
                    blurRadius: SizeConfig.defaultSize),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: SizeConfig.defaultSize * 1.5),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 2.2 * SizeConfig.defaultSize,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 1.5 * SizeConfig.defaultSize,
              ),
              widget.content,
              SizedBox(
                height: 2.2 * SizeConfig.defaultSize,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: SizeConfig.screenWidth * 0.3,
                  child: AeroButton(
                    content: Center(
                      child: Text(
                        widget.text,
                        style: TextStyle(
                          color: LIGHT_COLOR,
                        ),
                      ),
                    ),
                    color: DARK_COLOR,
                    width: SizeConfig.defaultSize * 3,
                    height: SizeConfig.defaultSize * 4.5,
                    onPressed: widget.onPressed,
                  ),
                ),
              ),
            ],
          ),
        ), // bottom part
        Positioned(
          left: Constants.padding * SizeConfig.defaultSize,
          right: Constants.padding * SizeConfig.defaultSize,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius * SizeConfig.defaultSize,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(
                  Constants.avatarRadius * SizeConfig.defaultSize)),
              child: Image.asset("assets/model.jpeg"),
            ),
          ),
        ),
      ],
    );
  }
}
