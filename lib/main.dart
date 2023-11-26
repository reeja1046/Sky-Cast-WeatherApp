import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_cast_weatherapp/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Weather App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryTextTheme: Typography.blackMountainView,
          primaryColorDark: Colors.blue,
          primaryColorLight: Colors.white12),
      home: const HomeScreen(),
    );
  }
}
