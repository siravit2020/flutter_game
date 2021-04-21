import 'package:flutter/material.dart';
import 'package:flutter_game/provider.dart';

Future<void> showMyDialog(BuildContext context, Function function) async {
  MainProvider provider = context.read<MainProvider>();
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Game Over'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Tyr again'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
              provider.restart();
            },
          ),
          TextButton(
            child: Text('cancel'),
            onPressed: () {
              Navigator.of(context).pop();
              context.read<CountTimeProvider>().countTime();
            },
          ),
        ],
      );
    },
  );
}
