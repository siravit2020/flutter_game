import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'provider.dart';
import 'screens/screen.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Set the fit size (fill in the screen size of the device in the design,in dp)
    return ScreenUtilInit(
      designSize: Size(412, 870),
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MainProvider()),
          ChangeNotifierProvider(create: (_) => CountTimeProvider()),

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
                '/': (context) => SplashScreen(),
                '/second': (context) => LevelScreen(),
                '/main': (context) => HomePage(),
              },
            ),
          ),
        ),
      ),
    );
  }
}
