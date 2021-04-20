import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  final double textSize;
  const Logo({
    Key key, this.textSize,
  }) : super(key: key);

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text('M', Colors.deepPurple[900]),
        text('i', Colors.purpleAccent),
        text('n', Colors.deepPurple),
        text('e', Colors.purpleAccent[400]),
        text('s', Colors.purpleAccent[900]),
        text('w', Colors.purple),
        text('e', Colors.deepPurple[700]),
        text('e', Colors.purpleAccent),
        text('p', Colors.deepPurple[900]),
        text('e', Colors.deepPurple),
        text('r', Colors.purpleAccent),
      ],
    );
    
  }

  Text text(String title, Color color) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'AllertaStencil',
        fontSize: widget.textSize,
        color: color,
      ),
    );
  }
}
