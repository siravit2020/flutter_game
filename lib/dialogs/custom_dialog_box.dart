import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/providers/provider.dart';
import 'package:flutter_game/dialogs/gameover_dialog.dart';

class FinishDialogBox extends StatefulWidget {
  final String level;
  final String currentTime;
  final String bestTime;
  final String title;

  FinishDialogBox({
    Key key,
    @required this.level,
    @required this.currentTime,
    @required this.bestTime,
    @required this.title,
  }) : super(key: key);

  @override
  _FinishDialogBoxState createState() => _FinishDialogBoxState();
}

class _FinishDialogBoxState extends State<FinishDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 30,
              color: Colors.deepPurple,
              shadows: [
                Shadow(
                  blurRadius: 7.0,
                  color: Colors.deepPurpleAccent.withOpacity(0.7),
                  offset: Offset(2.0, 3.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(Icons.signal_cellular_alt_rounded),
                  SizedBox(height: 10),
                  Text(widget.level)
                ],
              ),
              SizedBox(width: 50),
              Column(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(height: 10),
                  Text(widget.currentTime)
                ],
              ),
              SizedBox(width: 50),
              Column(
                children: [
                  Icon(Icons.emoji_events_outlined),
                  SizedBox(height: 10),
                  Text(widget.bestTime)
                ],
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Theme.of(context).buttonColor,
            textColor: Colors.black,
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            onPressed: () async{
              Navigator.of(context).pop();
              await context.read<MainProvider>().reset();
              context.read<CountTimeProvider>().cancel();
              context.read<CountTimeProvider>().countTime();
            },
            child: Text(
              'Play Again',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
    
  }
}
