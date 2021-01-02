import 'package:flutter_game/widgets/create_table.dart';
import 'package:flutter_game/widgets/header.dart';
import 'package:flutter_game/widgets/logo_text.dart';
import 'package:flutter_game/widgets/table.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../provider.dart';
import '../variable.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int time = 0;
  double r = 50;
  @override
  void initState() {
    createTable();
    createNumber();
    createBorderEmpty();
    counter = context.read<CounterProvider>();
    flag = context.read<FlagProvider>();
    themeModel = context.read<MyThemeModel>();
    flag.setFlag(countBomb);
    counter.increment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            splashRadius: 20,
            icon: Icon(Icons.settings, color: Colors.deepPurple),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              splashRadius: 20,
              icon: Icon(
                Icons.restore,
                color: Colors.deepPurple,
                size: 24,
              ),
              onPressed: () {
                if (showResultTrue) {
                  restart(() {
                    setState(() {});
                  });
                  
                } else {
                  counter.stop();
                  showMyDialog(context, () {
                    setState(() {});
                  });
                }
              },
            )
          ],
          title: Logo(
            textSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Header(
              function: () {
                setState(() {});
              },
            ),
            Container(child: TableShow()),
          ],
        ),
      ),
    );
  }
}
