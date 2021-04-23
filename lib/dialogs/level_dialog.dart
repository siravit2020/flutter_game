import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/providers/provider.dart';

class LevelDialogBox extends StatelessWidget {
  LevelDialogBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.white,
        height: 200,
        width: 200,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ButtonLevel(
              title: 'Easy',
              count: 10,
              color: Colors.purpleAccent,
            ),
            ButtonLevel(
              title: 'Hard',
              count: 30,
              color: Colors.deepPurple[900],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 0,
              ),
            ),
            ButtonLevel(
              title: 'Normal',
              count: 20,
              color: Colors.deepPurple,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonLevel extends StatelessWidget {
  const ButtonLevel({
    Key key,
    this.title,
    this.count,
    this.color,
  }) : super(key: key);
  final String title;
  final int count;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: Size(double.infinity, 0),
          padding: EdgeInsets.all(8.0),
          primary: color,
          backgroundColor: Colors.white,
        ),
        onPressed: () async {
          context.read<CountTimeProvider>().cancel();
          
          context.read<MainProvider>()
            ..countBomb = count
            ..flag = count
            ..level = title;
          await context.read<MainProvider>().reset();
          Navigator.of(context).pop();
        },
        child: Text(
          title,
        ),
      ),
    );
  }
}
