import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/svg.dart';
import '../../../providers/provider.dart';
import '../../../constants/variable.dart';
import '../../../dialogs/custom_dialog_box.dart';
import 'package:flutter_game/utils/tranfer.dart';

class TableShow extends StatelessWidget {
  TableShow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainProvider provider = context.watch<MainProvider>();
    ColorThemeProvider theme = context.watch<ColorThemeProvider>();
    if (provider.finsih) _showDialogFinish(context);
    if (provider.end) context.read<CountTimeProvider>().stop();
    print('rebuild table ${Random().nextInt(90)}');
    return GridView.count(
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      crossAxisCount: countColumn,
      
      children: List.generate(
        provider.countBox,
        (index) {
          Color colorText;
          colorText = provider.colorProcess(index);
          final boxValue = provider.boxList[index];
          return InkWell(
            onLongPress: () {
              provider.onLongPress(index);
            },
            onTap: () {
              provider.onTab(index);
            },
            child: Ink(
              child: Container(
                //duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.all(
                    const Radius.circular(4.0),
                  ),
                  color: ((boxValue == 10) && provider.showResultTrue)
                      ? Colors.deepPurpleAccent.withOpacity(0.3)
                      : (boxValue != 8)
                          ? Colors.white
                          : Colors.deepPurple[400].withOpacity(0.1),
                  boxShadow: [
                    if (boxValue != 8)
                      BoxShadow(
                        color: theme.flag
                            ? Colors.red.withOpacity(0.2)
                            : Colors.deepPurple.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset:
                            Offset(0, 0), // changes position of shadow
                      ),
                  ],
                ),
                margin: EdgeInsets.all(2),
                child: Stack(
                  children: [
                    Center(
                      child: provider.visible[index]
                          ? boxValue != 10
                              ? Text(
                                  (boxValue != 0 && boxValue != 8)
                                      ? '$boxValue'
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
        },
      ),
    );
  }

  _showDialogFinish(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    MainProvider provider = context.read<MainProvider>();
    CountTimeProvider time = context.read<CountTimeProvider>();
    print('${time.counter} <> ${provider.bestTime}');
    if (time.counter < provider.bestTime) {
      provider.bestTime = time.counter;
      await prefs.setInt(provider.level, time.counter);
      time.stop();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return FinishDialogBox(
              level: provider.level,
              currentTime: dateTotime(time.counter),
              bestTime: dateTotime(provider.bestTime),
              title: "New record");
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return FinishDialogBox(
              level: provider.level,
              currentTime: dateTotime(time.counter),
              bestTime: dateTotime(provider.bestTime),
              title: "Excellent");
        },
      );
    }
    context.read<CountTimeProvider>().stop();
  }
}
