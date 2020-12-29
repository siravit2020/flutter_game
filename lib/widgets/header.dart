import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider.dart';
import '../variable.dart';

class Header extends StatelessWidget {
  final Function function;

  const Header({Key key, @required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.access_time,
                    color: Colors.green,
                  ),
                ),
                Consumer<CounterProvider>(builder: (context, data, child) {
                  int secound = data.counter % 60;
                  int minute = data.counter ~/ 60;
                  String textTime = '$minute : $secound';
                  if (minute < 10 && secound < 10) {
                    textTime = '0$minute : 0$secound';
                  } else if (minute < 10) {
                    textTime = '0$minute : $secound';
                  } else if (secound < 10) {
                    textTime = '$minute : 0$secound';
                  }
                  return Text(
                    textTime,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  );
                }),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  ),
                  
              color: Theme.of(context).buttonColor,
              textColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                context.read<MyThemeModel>().changeTheme();
                newisSelected = !newisSelected;
                function();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.flag,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Consumer<FlagProvider>(builder: (context, data, child) {
                    return Text(
                      '${data.flag}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    );
                  }),
                ],
              ),
            ),
         
            SizedBox(
              width: 15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.emoji_events_outlined,
                    color: Colors.orange,
                  ),
                ),
                FutureBuilder<int>(
                  future: getBestTime(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    String textTime = "";
                    if (snapshot.data != null) {
                      best = snapshot.data;
                      int secound = snapshot.data % 60;
                      int minute = snapshot.data ~/ 60;
                      textTime = '$minute : $secound';
                      if (minute < 10 && secound < 10) {
                        textTime = '0$minute : 0$secound';
                      } else if (minute < 10) {
                        textTime = '0$minute : $secound';
                      } else if (secound < 10) {
                        textTime = '$minute : 0$secound';
                      }
                    }
                    return Text(
                      textTime,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
