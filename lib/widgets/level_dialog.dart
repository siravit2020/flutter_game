import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/variable.dart';
import 'package:flutter_game/widgets/create_table.dart';

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
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.white,
        height: 200,
        width: 200,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: FlatButton(
                textColor: Colors.purpleAccent,
                minWidth: double.infinity,
                padding: EdgeInsets.zero,
                onPressed: () {
                  countBomb = 10;
                  level = "Easy";
                  restart(() {
                    setState(() {});
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Easy",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 0,
              ),
            ),
            Expanded(
              child: FlatButton(
                textColor: Colors.deepPurple,
                minWidth: double.infinity,
                padding: EdgeInsets.zero,
                onPressed: () {
                  countBomb = 20;
                  level = "Normal";
                  restart(() {
                    setState(() {});
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Normal",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 0,
              ),
            ),
            Expanded(
              child: FlatButton(
                textColor: Colors.deepPurple[900],
                minWidth: double.infinity,
                padding: EdgeInsets.zero,
                onPressed: () {
                  countBomb = 30;
                  level = "Hard";
                  restart(() {
                    setState(() {});
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Hard",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
