import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_cast_weatherapp/controller/global_controller.dart';
import 'package:sky_cast_weatherapp/widgets/current_weather.dart';
import 'package:sky_cast_weatherapp/widgets/header.dart';
import 'package:sky_cast_weatherapp/widgets/hourly_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          (() => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const HeaderWidget(),
                      // for our current temperature
                      CurrentWeatherWidget(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      HourlyDataWidget(
                        weatherDataHourly:
                            globalController.getData().getHourlyWeather(),
                      )
                    ],
                  ),
                )),
        ),
      ),
    );
  }
}
