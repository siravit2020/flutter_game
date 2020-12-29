import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/svg.dart';
import '../provider.dart';
import '../variable.dart';

class TableShow extends StatefulWidget {
  TableShow({Key key}) : super(key: key);

  @override
  _TableState createState() => _TableState();
}

class _TableState extends State<TableShow> {
  @override
  Widget build(BuildContext context) {
    FlagProvider flag = Provider.of<FlagProvider>(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(0),
          child: GridView.count(
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            crossAxisCount: countColumn,
            children: List.generate(countBox, (index) {
              Color colorText;

              if (newList[index] == 1) {
                colorText = Colors.purpleAccent;
              }
              if (newList[index] == 2) {
                colorText = Colors.purpleAccent[700];
              }
              if (newList[index] == 3) {
                colorText = Colors.deepPurpleAccent;
              }
              if (newList[index] == 4) {
                colorText = Colors.deepPurpleAccent[700];
              }
              if (newList[index] == 5) {
                colorText = Colors.purple[900];
              }
              if (newList[index] == 6) {
                colorText = Colors.deepPurple[900];
              }
              if (newList[index] == 7) {
                colorText = Colors.indigo[900];
              }
              return InkWell(
                onLongPress: () {
                  if (!visible[index]) {
                    flagList[index] = !flagList[index];
                    if (flagList[index]) {
                      flag.decrement();
                    } else
                      flag.increment();
                    setState(() {});
                  }
                },
                onTap: () {
                  if (newisSelected && !visible[index]) {
                    flagList[index] = !flagList[index];
                    if (flagList[index]) {
                      flag.decrement();
                    } else
                      flag.increment();
                  } else if (!newisSelected &&
                      !visible[index] &&
                      !flagList[index]) {
                    visible[index] = true;
                    check(index);
                  }
                  setState(() {});
                },
                child: Ink(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.all(
                        const Radius.circular(4.0),
                      ),
                      color: ((newList[index] == 10) && showResultTrue)
                          ? Colors.deepPurpleAccent.withOpacity(0.3)
                          : (newList[index] != 8)
                              ? color
                              : Colors.deepPurple[400].withOpacity(0.1),
                      boxShadow: [
                        if ((newList[index] != 8))
                          BoxShadow(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                      ],
                    ),
                    margin: EdgeInsets.all(2),
                    child: Stack(
                      children: [
                        Center(
                          child: visible[index]
                              ? newList[index] != 10
                                  ? Text(
                                      (newList[index] != 0 &&
                                              newList[index] != 8)
                                          ? '${newList[index]}'
                                          : '',
                                      style: TextStyle(color: colorText),
                                    )
                                  : SvgPicture.asset("assets/icons/bomb.svg",
                                      height: 16, width: 16)
                              : SizedBox(),
                        ),
                        if (flagList[index])
                          Center(
                            child: Icon(
                              Icons.flag,
                              color: Colors.red,
                              size: 20,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
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
      // showMyDialog(context, () {
      //   setState(() {});
      // });
      counter.stop();
      showResultTrue = true;
      showResult(() {
        setState(() {});
      });
      print("end");
    } else if (visible.where((item) => item == false).length - countBomb == 0) {
      print("finish");
      _incrementCounter();
      showResultTrue = true;
      showResult(() {
        setState(() {});
      });
    }
    setState(() {});
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (counter.counter < best) {
      best = counter.counter;
      await prefs.setInt('counter', counter.counter);
      counter.stop();
    }
  }
}

void showResult(Function function) {
  for (int i = 0; i < 204; i++) {
    visible[i] = true;
  }
  function();
}
