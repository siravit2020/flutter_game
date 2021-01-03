import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LevelDialogBox extends StatefulWidget {
  LevelDialogBox({
    Key key,
  }) : super(key: key);

  @override
  _LevelDialogBoxState createState() => _LevelDialogBoxState();
}

class _LevelDialogBoxState extends State<LevelDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: FlatButton(
            color: Colors.red,
            minWidth: double.infinity,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            onPressed: () {
              /*...*/
            },
            child: Text(
              "Easy",
            ),
          ),
        ),
        ClipRRect(
          child: FlatButton(
            color: Colors.red,
            minWidth: double.infinity,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            onPressed: () {
              /*...*/
            },
            child: Text(
              "Normal",
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          child: FlatButton(
            minWidth: double.infinity,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            onPressed: () {
              /*...*/
            },
            child: Text(
              "Hard",
            ),
          ),
        ),
      ],
    );
  }
}
