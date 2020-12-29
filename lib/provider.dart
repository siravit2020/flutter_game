import 'dart:async';
export 'package:provider/provider.dart';
import 'package:flutter/material.dart';

const oneSec = const Duration(seconds: 1);

class CounterProvider extends ChangeNotifier {
  int counter;
  Timer t;
  CounterProvider({this.counter = 0});
  increment() {
    t = Timer.periodic(oneSec, (Timer t) {
      counter++;
      notifyListeners();
    });
  }

  stop() {
    t.cancel();
  }

  cancel() {
    counter = 0;
    t.cancel();
  }
}

class FlagProvider extends ChangeNotifier {
  int flag;
  FlagProvider({this.flag = 0});
  setFlag(count) {
    flag = count;
  }

  void increment() {
    flag++;
    notifyListeners();
  }

  void decrement() {
    flag--;
    notifyListeners();
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
