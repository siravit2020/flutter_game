import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'providers/provider.dart';
import 'screens/screen.dart';
import 'themes/theme.dart';

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
          ChangeNotifierProvider(create: (_) => MyThemeModel())
        ],
        child: MaterialApp(
          theme: themeData(context),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/second': (context) => LevelScreen(),
            '/main': (context) => HomePage(),
          },
        ),
      ),
    );
  }
}
