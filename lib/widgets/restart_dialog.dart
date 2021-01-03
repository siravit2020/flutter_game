import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/variable.dart';
import 'package:flutter_game/widgets/create_table.dart';

class restartDialog extends StatefulWidget {
  restartDialog({
    Key key,
  }) : super(key: key);

  @override
  _restartDialogState createState() => _restartDialogState();
}

class _restartDialogState extends State<restartDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10,25,10,25),
      decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
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
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.grey[100],
                textColor: Colors.black,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                onPressed: () {
                  Navigator.of(context).pop();
                  restart(() {
                    setState(() {});
                  });
                },
                child: Text(
                  'Yes',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(width: 20,),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.grey[100],
                textColor: Colors.black,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                onPressed: () {
                  Navigator.of(context).pop();
                  counter.increment();
                },
                child: Text(
                  'No',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
