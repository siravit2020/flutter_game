import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_game/screens/splash/widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              SizedBox(
                height: 20,
              ),
              Logo(
                textSize: 30,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: SvgPicture.asset(
                  "assets/icons/play.svg",
                  height: 30,
                  width: 30,
                  color: Colors.deepPurple[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
