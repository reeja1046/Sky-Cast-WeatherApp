import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sky_cast_weatherapp/controller/global_controller.dart';
import 'package:sky_cast_weatherapp/model/weather_data_current.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key, required this.weatherDataCurrent});

  final WeatherDataCurrent weatherDataCurrent;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    super.initState();
    getAddress(globalController.getLatitude().value,
        globalController.getLongitude().value);
  }

  Future<void> getAddress(double lat, double lon) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      Placemark place = placemarks[0];
      setState(() {
        city = place.locality ?? 'Unknown location';
      });
    } catch (e) {
      print("Error in fetching address: $e");
      setState(() {
        city = 'Unknown location';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row for city and temperature
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  city,
                  style: const TextStyle(fontSize: 35, color: Colors.white),
                ),
                Text(
                  date,
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                Text(
                  "${widget.weatherDataCurrent.current.temp!.toInt()}°",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                      color: Colors.white),
                ),
                Text(
                  widget.weatherDataCurrent.current.weather![0].description!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
