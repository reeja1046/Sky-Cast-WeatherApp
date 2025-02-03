import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_cast_weatherapp/controller/global_controller.dart';
import 'package:sky_cast_weatherapp/screens/widgets/comfort_level.dart';
import 'package:sky_cast_weatherapp/screens/widgets/dailydata_forecast.dart';
import 'package:sky_cast_weatherapp/screens/widgets/hourly_data.dart';
import 'package:sky_cast_weatherapp/widgets/current_weather.dart';
import 'package:sky_cast_weatherapp/widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  TextEditingController placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Obx(() => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      // TextFormField(
                      //   controller: placeController,
                      //   decoration: InputDecoration(
                      //     labelText: 'Search',
                      //     labelStyle: const TextStyle(color: Colors.white),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(15.0),
                      //       borderSide: const BorderSide(
                      //         color:
                      //             Colors.white,
                      //       ),
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(15.0),
                      //       borderSide: const BorderSide(
                      //         color:
                      //             Colors.white,
                      //       ),
                      //     ),
                      //     contentPadding: const EdgeInsets.only(left: 15),
                      //     prefixIcon: const Icon(
                      //       Icons.search,
                      //       color: Colors.grey,
                      //     ),
                      //     suffixIcon: IconButton(
                      //       icon: const Icon(
                      //         Icons.clear,
                      //         color: Colors.grey,
                      //       ),
                      //       onPressed: () {
                      //         placeController.clear();
                      //       },
                      //     ),
                      //   ),
                      //   style: const TextStyle(
                      //     color: Colors.white,
                      //   ),
                      // ),
                      HeaderWidget(
                          weatherDataCurrent: globalController
                              .getWeatherData()
                              .getCurrentWeather()),
                      const SizedBox(
                        height: 20,
                      ),
                      CurrentWeatherWidget(
                          weatherDataCurrent: globalController
                              .getWeatherData()
                              .getCurrentWeather()),
                      const SizedBox(
                        height: 20,
                      ),
                      HourlyDataWidget(
                        weatherDataHourly: globalController
                            .getWeatherData()
                            .getHourlyWeather(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DailyDataForecast(
                        weatherDataDaily:
                            globalController.getWeatherData().getDailyWeather(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ComfortLevelWidget(
                        weatherDataCurrent: globalController
                            .getWeatherData()
                            .getCurrentWeather(),
                      ),
                    ],
                  ),
                )),
        ),
      ),
    );
  }
}
