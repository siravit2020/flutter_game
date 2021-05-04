import 'package:flutter/material.dart';
import 'package:flutter_game/screens/level/widgets/level_button.dart';


class LevelScreen extends StatefulWidget {
  LevelScreen({Key key}) : super(key: key);

  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LevelButton(
                title: 'Easy',
                color: Colors.purpleAccent,
                bomb: 2,
              ),
              LevelButton(
                title: 'Normal',
                color: Colors.deepPurpleAccent,
                bomb: 20,
              ),
              LevelButton(
                title: 'Hard',
                color: Colors.deepPurple[900],
                bomb: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


