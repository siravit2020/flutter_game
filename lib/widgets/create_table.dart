import 'dart:math';
import 'package:flutter/material.dart';
import '../variable.dart';

void createTable() {
  for (int i = 0; i < countBox; i++) {
    newList[i] = 0;
    visible[i] = false;
    flagList[i] = false;
  }
  for (int point = 1; point <= countBomb; point++) {
    randomBomb();
  }
}

void randomBomb() {
  var number = Random().nextInt(203);
  if (newList[number] != 10)
    newList[number] = 10;
  else
    randomBomb();
}

void createNumber() {
  for (int point = 0; point < 204; point++) {
    if (newList[point] == 10) {
      //countBomb++;
      //newList[point] = 10;
      if (!maxRight.contains(point)) {
        try {
          if (newList[point + 1] != 10) newList[point + 1]++;
        } catch (e) {}
        try {
          if (newList[point + 13] != 10) newList[point + 13]++;
        } catch (e) {}
        try {
          if (newList[point - 11] != 10) newList[point - 11]++;
        } catch (e) {}
      }

      if (!maxLeft.contains(point)) {
        try {
          if (newList[point - 1] != 10) newList[point - 1]++;
        } catch (e) {}
        try {
          if (newList[point - 13] != 10) newList[point - 13]++;
        } catch (e) {}
        try {
          if (newList[point + 11] != 10) newList[point + 11]++;
        } catch (e) {}
      }

      try {
        if (newList[point - 12] != 10) newList[point - 12]++;
      } catch (e) {}

      try {
        if (newList[point + 12] != 10) newList[point + 12]++;
      } catch (e) {}
    }
  }
}

void createBorderEmpty() {
  for (int i = 0; i < countBox; i++) {
    try {
      if (newList[i + 1] != 0 && newList[i + 1] < 9) {
        newAdd.add(i + 1);
      }
    } catch (e) {}
    try {
      if (newList[i - 1] != 0 && newList[i - 1] < 9) {
        newAdd.add(i - 1);
      }
    } catch (e) {}
    try {
      if (newList[i - 12] != 0 && newList[i - 12] < 9) {
        newAdd.add(i - 12);
      }
    } catch (e) {}

    try {
      if (newList[i + 12] != 0 && newList[i + 12] < 9) {
        newAdd.add(i + 12);
      }
    } catch (e) {}
  }
}

void restart(Function function) {
  newList = List.filled(countBox,null);
  visible = List.filled(countBox,null);
  flagList = List.filled(countBox,null);
  newisSelected = false;
  color = Colors.white;
  showResultTrue = false;
  flag.setFlag(countBomb);
  counter.cancel();
  counter.increment();
  themeModel.setTheme();
  createTable();
  createNumber();
  createBorderEmpty();
  function();
}

Future<void> showMyDialog(BuildContext context, Function function) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Game Over'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Tyr again'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
              restart(() {
                function();
              });
            },
          ),
          TextButton(
            child: Text('cancel'),
            onPressed: () {
              Navigator.of(context).pop();
              counter.increment();
            },
          ),
        ],
      );
    },
  );
}
