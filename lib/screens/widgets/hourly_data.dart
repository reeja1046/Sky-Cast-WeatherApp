import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sky_cast_weatherapp/controller/global_controller.dart';
import 'package:sky_cast_weatherapp/model/weather_data_hourly.dart';
import 'package:sky_cast_weatherapp/utils/custom_colors.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({
    super.key,
    required this.weatherDataHourly,
  });

  final RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text(
            'Today',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 160,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12
            ? 12
            : weatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
          return Obx(
            () => GestureDetector(
              onTap: () {
                cardIndex.value = index;
              },
              child: Container(
                width: 90,
                margin: const EdgeInsets.only(left: 20, right: 5),
                decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.5, 0),
                      blurRadius: 30,
                      spreadRadius: 1,
                      color: CustomColors.dividerLine.withAlpha(150),
                    ),
                  ],
                  gradient: cardIndex.value == index
                      ? const LinearGradient(
                          colors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor,
                          ],
                        )
                      : null,
                ),
                child: HourlyDetailsWidget(
                  temp: weatherDataHourly.hourly[index].temp!,
                  index: index,
                  cardIndex: cardIndex.value,
                  timeStamp: weatherDataHourly.hourly[index].dt!,
                  weatherIcon:
                      weatherDataHourly.hourly[index].weather![0].icon!,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HourlyDetailsWidget extends StatelessWidget {
  final int temp;
  final int index;
  final int cardIndex;
  final int timeStamp;
  final String weatherIcon;

  String getHourlyTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  const HourlyDetailsWidget({
    super.key,
    required this.temp,
    required this.timeStamp,
    required this.weatherIcon,
    required this.index,
    required this.cardIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            getHourlyTime(timeStamp),
            style: TextStyle(
              color: cardIndex == index
                  ? Colors.white
                  : CustomColors.textColorsBlack,
              fontWeight:
                  cardIndex == index ? FontWeight.bold : FontWeight.w500,
              fontSize: cardIndex == index ? 16 : 14,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            'assets/weather/$weatherIcon.png',
            height: 50,
            width: 50,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            '$tempº',
            style: TextStyle(
              color: cardIndex == index
                  ? Colors.white
                  : CustomColors.textColorsBlack,
              fontWeight:
                  cardIndex == index ? FontWeight.bold : FontWeight.w500,
              fontSize: cardIndex == index ? 16 : 14,
            ),
          ),
        )
      ],
    );
  }
}
