import 'package:flutter/material.dart';
import 'package:flutter_game/tranfer.dart';
import 'package:provider/provider.dart';
import '../provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainProvider provider = context.read<MainProvider>();
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
                Consumer<CountTimeProvider>(builder: (context, data, child) {
                  String textTime = tranfer(data.counter);
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
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.all(8.0),
                primary: Colors.black,
                backgroundColor: Theme.of(context).buttonColor,
              ),
              onPressed: () {
                provider.newisSelected = !provider.newisSelected;
                context.read<MyThemeModel>().changeTheme();
              },
              child: Consumer<MainProvider>(
                builder: (context, data, child) {
                  return Row(
                    children: [
                      Icon(
                        Icons.flag,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Consumer<MainProvider>(
                        builder: (context, data, child) {
                          return Text(
                            '${data.flag}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
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
                Text(
                  tranfer(provider.time),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
