import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/providers/provider.dart';

class RestartDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 25, 10, 25),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "New game ?",
            style: TextStyle(
              fontSize: 20,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonDialog(yes: true),
              SizedBox(width: 20),
              ButtonDialog(yes: false),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonDialog extends StatelessWidget {
  const ButtonDialog({
    Key key,
    this.yes,
  }) : super(key: key);
  final bool yes;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        primary: Colors.black,
        backgroundColor: Colors.grey[100],
      ),
      onPressed: () async{
        Navigator.of(context).pop();
        if (yes) {
          context.read<CountTimeProvider>().cancel();
          await context.read<MainProvider>().reset();
          
        }
      },
      child: Text(
        yes ? 'Yes' : 'No',
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
