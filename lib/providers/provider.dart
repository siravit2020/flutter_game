import 'dart:async';
import 'dart:math';
export 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/constants/variable.dart';
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

  void clear() {
    counter = 0;
    t.cancel();
  }
}

class MainProvider extends ChangeNotifier {
  int flag;
  bool finsih = false;
  bool end = false;
  List<int> boxList;
  List<int> bombList = [];
  List<int> maxLeft = [];
  List<int> maxRight = [];
  List<bool> visible;
  List<bool> flagList;
  String level;
  bool newisSelected;
  int countBomb = 10;
  bool showResultTrue;
  int bestTime = 0;

  Future<void> getBestTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bestTime = (prefs.getInt(level) ?? 600);
    print('time $bestTime');
    //prefs.clear();
    return;
  }

  void increment() {
    flag++;
    notifyListeners();
  }

  void decrement() {
    flag--;
    notifyListeners();
  }

  Future<void> createTable() async {
    int left = 0;
    int right = countColumn - 1;
    for (int i = 0; i < countRow; i++) {
      maxLeft.add(left);
      maxRight.add(right);
      left += countColumn;
      right += countColumn;
    }
    for (int point = 1; point <= countBomb; point++) {
      randomBomb();
    }
    return;
  }

  void randomBomb() {
    var number = Random().nextInt(203);
    if (boxList[number] != 10) {
      boxList[number] = 10;
      bombList.add(number);
    } else
      randomBomb();
  }

  Future<void> createNumber() async {
    bombList.forEach((point) {
      if (!maxRight.contains(point)) {
        try {
          if (boxList[point + 1] != 10) boxList[point + 1]++;
        } catch (e) {}
        try {
          if (boxList[point + 13] != 10) boxList[point + 13]++;
        } catch (e) {}
        try {
          if (boxList[point - 11] != 10) boxList[point - 11]++;
        } catch (e) {}
      }

      if (!maxLeft.contains(point)) {
        try {
          if (boxList[point - 1] != 10) boxList[point - 1]++;
        } catch (e) {}
        try {
          if (boxList[point - 13] != 10) boxList[point - 13]++;
        } catch (e) {}
        try {
          if (boxList[point + 11] != 10) boxList[point + 11]++;
        } catch (e) {}
      }

      try {
        if (boxList[point - 12] != 10) boxList[point - 12]++;
      } catch (e) {}

      try {
        if (boxList[point + 12] != 10) boxList[point + 12]++;
      } catch (e) {}
    });

    return;
  }

  Future<void> reset() async {
    finsih = false;
    end = false;
    flag = countBomb;
    bombList = [];
    boxList = List.filled(countBox, 0);
    visible = List.filled(countBox, false);
    flagList = List.filled(countBox, false);
    newisSelected = false;
    showResultTrue = false;
    await createTable();
    await createNumber();
    notifyListeners();
  }

  Color colorProcess(int index) {
    switch (boxList[index]) {
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
    if (boxList[point] == 0 || boxList[point] == 8) {
      boxList[point] = 8;

      if (!maxRight.contains(point)) {
        try {
          visible[point + 1] = true;
          if (boxList[point + 1] == 0) {
            boxList[point + 1] = 8;
            visible[point] = true;
            check(point + 1);
          }
        } catch (e) {}
      }
      if (!maxLeft.contains(point)) {
        try {
          visible[point - 1] = true;
          if (boxList[point - 1] == 0) {
            boxList[point - 1] = 8;
            visible[point] = true;
            check(point - 1);
          }
        } catch (e) {}
      }
      try {
        visible[point - 12] = true;
        if (boxList[point - 12] == 0) {
          boxList[point - 12] = 8;
          visible[point] = true;
          check(point - 12);
        }
      } catch (e) {}
      try {
        visible[point + 12] = true;
        if (boxList[point + 12] == 0) {
          boxList[point + 12] = 8;
          visible[point] = true;
          check(point + 12);
        }
      } catch (e) {}
    } else if (boxList[point] == 10) {
      showResultTrue = true;
      showResult();
      print("end");
      end = true;
    } else if (visible.where((item) => item == false).length - countBomb == 0) {
      print("finish");
      showResultTrue = true;
      showResult();
      finsih = true;
    }
  }

  void showResult() {
    for (int i = 0; i < 204; i++) {
      visible[i] = true;
    }
  }

  Future<bool> initial() async {
    await reset();
    await getBestTime();
    await Future.delayed(const Duration(milliseconds: 1000));
    return true;
  }
}

class MyThemeModel extends ChangeNotifier {
  bool _flag = false;

  void changeColor() {
    _flag = !_flag;
    notifyListeners();
  }

  bool get flag => _flag;
}
