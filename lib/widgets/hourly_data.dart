import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sky_cast_weatherapp/model/weather_data_hourly.dart';
import 'package:sky_cast_weatherapp/utils/custom_colors.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  const HourlyDataWidget({super.key, required this.weatherDataHourly});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text(
            'Today',
            style: TextStyle(fontSize: 18),
          ),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      color: Colors.black,
      height: 150,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        itemCount: weatherDataHourly.hourly.length > 12
            ? 12
            : weatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
          final hourlyData = weatherDataHourly.hourly[index];
          if (hourlyData != null) {
            final dt = hourlyData.dt;
            final temp = hourlyData.temp;
            final weatherIcon = hourlyData.weather?[0].icon;

            if (dt != null && temp != null && weatherIcon != null) {
              return GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.5, 0),
                            blurRadius: 30,
                            spreadRadius: 1,
                            color: CustomColors.dividerLine.withAlpha(150)),
                      ],
                      gradient: const LinearGradient(colors: [
                        CustomColors.firstGradientColor,
                        CustomColors.secondGradientColor
                      ])),
                  child: HourlyDetails(
                      timeStamp: weatherDataHourly.hourly[index].dt,
                      temp: weatherDataHourly.hourly[index].temp,
                      weatherIcon:
                          weatherDataHourly.hourly[index].weather![0].icon),
                ),
              );
            }
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}

//hourly details class
// ignore: must_be_immutable
class HourlyDetails extends StatelessWidget {
  int? temp;
  int? timeStamp;
  String? weatherIcon;
  HourlyDetails(
      {super.key,
      required this.timeStamp,
      required this.temp,
      required this.weatherIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        temp.toString(),
        style: TextStyle(fontSize: 30, color: Colors.amber),
      ),
    );
  }
}
