import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'screen/screen.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider(counter: 0)),
        ChangeNotifierProvider(create: (_) => FlagProvider(flag: 0)),
      ],
      child: ChangeNotifierProvider(
        create: (context) => MyThemeModel(),
        child: Consumer<MyThemeModel>(
          builder: (context, theme, child) => MaterialApp(
            theme: themeData(context),
            darkTheme: redThemeData(context),
            themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => FirstPage(),
              '/second': (context) => SecondPage(),
              '/main': (context) => HomePage(),
            },
          ),
        ),
      ),
    );
  }
}
