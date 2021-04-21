import 'dart:async';
import 'dart:math';
export 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/variable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const oneSec = const Duration(seconds: 1);

class CountTimeProvider extends ChangeNotifier {
  Timer t;
  int counter;
  int count = 1;
  CountTimeProvider() {
    counter = 0;
  }
  countTime() {
    t = Timer.periodic(oneSec, (Timer t) {
      counter++;
      notifyListeners();
    });
  }

  void stop() {
    t.cancel();
  }

  void cancel() {
    counter = 0;
    t.cancel();
    notifyListeners();
  }
}

class MainProvider extends ChangeNotifier {
  int flag;
  bool finsih = false;
  List<int> newList = List.filled(countBox, 0);
  List<int> newAdd = List.filled(countBox, null);
  List<int> maxLeft = [
    0,
    12,
    24,
    36,
    48,
    60,
    72,
    84,
    96,
    108,
    120,
    132,
    144,
    156,
    168,
    180,
    192
  ];
  List<int> maxRight = [
    11,
    23,
    35,
    47,
    59,
    71,
    83,
    95,
    107,
    119,
    131,
    143,
    155,
    167,
    179,
    191,
    203
  ];
  List<bool> visible = List.filled(countBox, false);
  List<bool> flagList = List.filled(countBox, false);
  String level;
  bool newisSelected = false;
  Color color = Colors.white;
  int countBomb = 10;
  bool showResultTrue = false;
  int time;

  Future<void> getBestTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    time = (prefs.getInt(level) ?? 600);
    //prefs.clear();
    return;
  }

  int best = 0;

  void increment() {
    flag++;
    notifyListeners();
  }

  void decrement() {
    flag--;
    notifyListeners();
  }

  Future<void> createTable() async {
    for (int point = 1; point <= countBomb; point++) {
      randomBomb();
    }
    return;
  }

  void randomBomb() {
    var number = Random().nextInt(203);
    if (newList[number] != 10)
      newList[number] = 10;
    else
      randomBomb();
  }

  Future<void> createNumber() async {
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
    return;
  }

  Future<void> createBorderEmpty() async {
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
    return;
  }

  void restart() async {
    newList = List.filled(countBox, 0);
    visible = List.filled(countBox, false);
    flagList = List.filled(countBox, false);
    newisSelected = false;
    color = Colors.white;
    showResultTrue = false;
    //cancel();
    await createTable();
    await createNumber();
    await createBorderEmpty();
    MyThemeModel().setTheme();

    notifyListeners();
  }

  bool checkRestat() {
    if (showResultTrue) {
      restart();
      return true;
    }
    //stop();
    return false;
  }

  Color colorProcess(int index) {
    switch (newList[index]) {
      case 1:
        return Colors.purpleAccent;
        break;
      case 2:
        return Colors.purpleAccent[700];
        break;
      case 3:
        return Colors.deepPurpleAccent;
        break;
      case 4:
        return Colors.deepPurpleAccent[700];
        break;
      case 5:
        return Colors.purple[900];
        break;
      case 6:
        return Colors.deepPurple[900];
        break;
      case 7:
        return Colors.indigo[900];
        break;
      default:
        return Colors.black;
    }
  }

  void onLongPress(int index) {
    if (!visible[index]) {
      flagList[index] = !flagList[index];
      if (flagList[index]) {
        decrement();
      } else
        increment();
    }
    notifyListeners();
  }

  void onTab(int index) {
    if (newisSelected && !visible[index]) {
      flagList[index] = !flagList[index];
      if (flagList[index]) {
        decrement();
      } else
        increment();
    } else if (!newisSelected && !visible[index] && !flagList[index]) {
      visible[index] = true;
      check(index);
    }
    notifyListeners();
  }

  void check(int point) {
    if (newList[point] == 0 || newList[point] == 8) {
      newList[point] = 8;

      if (!maxRight.contains(point)) {
        try {
          visible[point + 1] = true;
          if (newList[point + 1] == 0) {
            newList[point + 1] = 8;
            visible[point] = true;
            check(point + 1);
          }
        } catch (e) {}
      }
      if (!maxLeft.contains(point)) {
        try {
          visible[point - 1] = true;
          if (newList[point - 1] == 0) {
            newList[point - 1] = 8;
            visible[point] = true;
            check(point - 1);
          }
        } catch (e) {}
      }
      try {
        visible[point - 12] = true;
        if (newList[point - 12] == 0) {
          newList[point - 12] = 8;
          visible[point] = true;
          check(point - 12);
        }
      } catch (e) {}
      try {
        visible[point + 12] = true;
        if (newList[point + 12] == 0) {
          newList[point + 12] = 8;
          visible[point] = true;
          check(point + 12);
        }
      } catch (e) {}
    } else if (newList[point] == 10) {
      // stop();
      showResultTrue = true;
      showResult();
      print("end");
    } else if (visible.where((item) => item == false).length - countBomb == 0) {
      print("finish");
      showResultTrue = true;
      showResult();
      finsih = true;
      //_incrementCounter();
    }
    notifyListeners();
  }

  void showResult() {
    for (int i = 0; i < 204; i++) {
      visible[i] = true;
    }
  }

  Future<bool> initial() async {
    await createTable();
    await createNumber();
    await createBorderEmpty();
    // await countTime();
    await getBestTime();
    await Future.delayed(const Duration(milliseconds: 2000));
    return true;
  }
}

class MyThemeModel extends ChangeNotifier {
  bool _isLightTheme = true;

  void changeTheme() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }

  void setTheme() {
    _isLightTheme = true;
    notifyListeners();
  }

  bool get isLightTheme => _isLightTheme;
}
