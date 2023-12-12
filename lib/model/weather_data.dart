import 'package:sky_cast_weatherapp/model/weather_data_current.dart';
import 'package:sky_cast_weatherapp/model/weather_data_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  WeatherData([this.current, this.hourly]);

  //function to fetch these values
  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
}
