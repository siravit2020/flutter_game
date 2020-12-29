import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider.dart';

const countBox = 204;
const countRow = 17;
const countColumn = 12;

List<int> newList = List<int>(countBox);
List<int> newAdd = List<int>(countBox);
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
List<bool> visible = List<bool>(countBox);
List<bool> flagList = List<bool>(countBox);

bool newisSelected = false;
Color color = Colors.white;
int countBomb = 10;
bool showResultTrue = false;
CounterProvider counter;
FlagProvider flag;
Future<int> getBestTime() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int time = (prefs.getInt('counter') ?? 600);
      //prefs.clear();
      return time;
    }

int best = 0;
