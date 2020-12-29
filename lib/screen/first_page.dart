import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_game/widgets/logo_text.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SvgPicture.asset("assets/icons/flag.svg",height: 50,width: 50,color: Colors.deepPurple[700],),
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
                )),
          ],
        ),
      ),
    );
  }
}
