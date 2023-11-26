import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryTextTheme: Typography.blackMountainView,
          primaryColorDark: Colors.blue,
          primaryColorLight: Colors.white12),
          // home: MainScreen(),
    );
  }
}
