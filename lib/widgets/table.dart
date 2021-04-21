import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/svg.dart';
import '../provider.dart';
import '../variable.dart';
import 'custom_dialog_box.dart';
import 'package:flutter_game/tranfer.dart';

class TableShow extends StatelessWidget {
  TableShow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainProvider provider = context.watch<MainProvider>();
    if (provider.finsih) _showDialogFinish(context);
    print('rebuild table ${Random().nextInt(90)}');
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

              colorText = provider.colorProcess(index);

              return InkWell(
                onLongPress: () {
                  provider.onLongPress(index);
                },
                onTap: () {
                  provider.onTab(index);
                },
                child: Ink(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.all(
                        const Radius.circular(4.0),
                      ),
                      color: ((provider.newList[index] == 10) &&
                              provider.showResultTrue)
                          ? Colors.deepPurpleAccent.withOpacity(0.3)
                          : (provider.newList[index] != 8)
                              ? provider.color
                              : Colors.deepPurple[400].withOpacity(0.1),
                      boxShadow: [
                        if ((provider.newList[index] != 8))
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
                          child: provider.visible[index]
                              ? provider.newList[index] != 10
                                  ? Text(
                                      (provider.newList[index] != 0 &&
                                              provider.newList[index] != 8)
                                          ? '${provider.newList[index]}'
                                          : '',
                                      style: TextStyle(color: colorText),
                                    )
                                  : SvgPicture.asset("assets/icons/bomb.svg",
                                      height: 16, width: 16)
                              : SizedBox(),
                        ),
                        if (provider.flagList[index])
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

  _showDialogFinish(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    MainProvider provider = context.read<MainProvider>();
    CountTimeProvider time = context.read<CountTimeProvider>();
    if (time.counter < provider.best) {
      provider.best = time.counter;
      await prefs.setInt(provider.level, time.counter);
      time.stop();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
              level: provider.level,
              currentTime: tranfer(time.counter),
              bestTime: tranfer(provider.best),
              title: "New record");
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
              level: provider.level,
              currentTime: tranfer(time.counter),
              bestTime: tranfer(provider.best),
              title: "Excellent");
        },
      );
    }
  }
}

void showResult(BuildContext context) {
  MainProvider provider = context.read<MainProvider>();
  for (int i = 0; i < 204; i++) {
    provider.visible[i] = true;
  }
}
