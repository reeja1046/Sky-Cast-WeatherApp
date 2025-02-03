import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_cast_weatherapp/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.fill,
            ),
          ),
        )
        // Center(
        //   child: Text(
        //     'Sky Cast',
        //     style: TextStyle(
        //         fontSize: 35, color: Colors.blue, fontWeight: FontWeight.w600),
        //   ),
        // ),
        );
  }

  Future<void> startAnimation() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.to(() => const HomePage());
  }
}
