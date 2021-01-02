import 'package:flutter/material.dart';

import '../variable.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.purpleAccent)),
              color: Colors.white,
              textColor: Colors.purpleAccent,
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                Navigator.pushNamed(context, '/main');
                countBomb = 10;
                level = "Easy";
              },
              child: Text(
                "Easy",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.deepPurpleAccent)),
              color: Colors.white,
              textColor: Colors.deepPurpleAccent,
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                Navigator.pushNamed(context, '/main');
                countBomb = 20;
                level = "Normal";
              },
              child: Text(
                "Normal",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.deepPurple[900])),
              color: Colors.white,
              textColor: Colors.deepPurple[900],
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                Navigator.pushNamed(context, '/main');
                countBomb = 30;
                level = "Hard";
              },
              child: Text(
                "Hard",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
