import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double textSize;

  const Logo({
    Key key,
    @required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "M",
          style: (TextStyle(
            fontFamily: 'AllertaStencil',
            fontSize: textSize,
            color: Colors.deepPurple[900],
          )),
        ),
        Text(
          "i",
          style: (TextStyle(
            fontFamily: 'AllertaStencil',
            fontSize: textSize,
            color: Colors.purpleAccent,
          )),
        ),
        Text(
          "n",
          style: (TextStyle(
            fontFamily: 'AllertaStencil',
            fontSize: textSize,
            color: Colors.deepPurple,
          )),
        ),
        Text(
          "e",
          style: (TextStyle(
            fontFamily: 'AllertaStencil',
            fontSize: textSize,
            color: Colors.purpleAccent[400],
          )),
        ),
        Text(
          "s",
          style: (TextStyle(
            fontFamily: 'AllertaStencil',
            fontSize: textSize,
            color: Colors.deepPurple[900],
          )),
        ),
        Text(
          "w",
          style: (TextStyle(
            fontFamily: 'AllertaStencil',
            fontSize: textSize,
            color: Colors.purple,
          )),
        ),
        Text(
          "e",
          style: (TextStyle(
            fontFamily: 'AllertaStencil',
            fontSize: textSize,
            color: Colors.deepPurple[700],
          )),
        ),
        Text(
          "e",
          style: (TextStyle(
            fontFamily: 'AllertaStencil',
            fontSize: textSize,
            color: Colors.purpleAccent,
          )),
        ),
        Text(
          "p",
          style: (TextStyle(
            fontFamily: 'AllertaStencil',
            fontSize: textSize,
            color: Colors.deepPurple[900],
          )),
        ),
        Text(
          "e",
          style: (TextStyle(
            fontFamily: 'AllertaStencil',
            fontSize: textSize,
            color: Colors.deepPurple,
          )),
        ),
        Text(
          "r",
          style: (TextStyle(
            fontFamily: 'AllertaStencil',
            fontSize: textSize,
            color: Colors.purpleAccent,
          )),
        ),
      ],
    );
  }
}
