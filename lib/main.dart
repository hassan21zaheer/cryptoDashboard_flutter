import 'package:crypto_dashboard_flutter/pages/home/homepage.dart';
import 'package:crypto_dashboard_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Crypto Dashboard Mobile UI",
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: TextTheme(
                caption: TextStyle(
                  color: kCaptionColor,
                  fontSize: 16.0,
                ),
            ),
            scaffoldBackgroundColor: kPrimaryColor,
            appBarTheme: AppBarTheme(
              elevation: 0.0,
              color: kPrimaryColor,
            ),
          ),
          home: HomePage(),
        );
    //   },
    // );
  }
}
