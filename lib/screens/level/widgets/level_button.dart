import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../variable.dart';
class LevelButton extends StatelessWidget {
  const LevelButton({
    Key key,
    this.title,
    this.color,
    this.bomb,
  }) : super(key: key);
  final String title;
  final Color color;
  final int bomb;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(0.3.sw, 0.3.sw / 3),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: color)),
        padding: EdgeInsets.all(8.0),
        primary: color,
        backgroundColor: Colors.white,
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/main');
        countBomb = bomb;
        level = title;
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.0.sp,
        ),
      ),
    );
  }
}