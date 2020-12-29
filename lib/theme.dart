import 'package:flutter/material.dart';


ThemeData themeData(BuildContext context) {
  return ThemeData(

      buttonColor: Colors.grey[100],
      primaryColor: Colors.deepPurple,

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: Colors.deepPurple),
      ));
}


ThemeData redThemeData(BuildContext context) {
  return ThemeData(
      buttonColor: Colors.red[100],
      primaryColor: Colors.red,

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: Colors.deepPurple),
      ));
}

AppBarTheme appBarTheme = AppBarTheme(color: Colors.transparent, elevation: 0);
