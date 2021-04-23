import 'package:flutter/material.dart';
import 'package:flutter_game/utils/tranfer.dart';
import 'package:provider/provider.dart';
import '../../../providers/provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('rebuild header');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            CountTimeWidget(),
            SizedBox(width: 15),
            Flag(),
            SizedBox(width: 15),
            BestTime(),
          ],
        ),
      ],
    );
  }
}

class CountTimeWidget extends StatelessWidget {
  const CountTimeWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CountTimeProvider>();
    String textTime = tranfer(provider.counter);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(
            Icons.access_time,
            color: Colors.green,
          ),
        ),
        Text(
          textTime,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class Flag extends StatelessWidget {
  const Flag({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MyThemeModel>();
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: EdgeInsets.all(8.0),
        primary: Colors.black,
        backgroundColor:
            provider.flag ? Colors.red[100] : Theme.of(context).buttonColor,
      ),
      onPressed: () {
        MainProvider provider = context.read<MainProvider>();
        provider.newisSelected = !provider.newisSelected;
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
              Text(
                '${data.flag}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BestTime extends StatelessWidget {
  const BestTime({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainProvider>();
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(
            Icons.emoji_events_outlined,
            color: Colors.orange,
          ),
        ),
        Text(
          tranfer(provider.bestTime),
          style: TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
