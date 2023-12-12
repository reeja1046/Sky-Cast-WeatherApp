import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sky_cast_weatherapp/api/fetch_weather.dart';
import 'package:sky_cast_weatherapp/model/weather_data.dart';

class GlobalController extends GetxController {
  //Create various variables
  final RxBool _isloading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

// insatnce for them to be called
  RxBool checkLoading() => _isloading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;

 WeatherData getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isloading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    //return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error('Location service is not enabled');
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission is denied");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    //getting current position
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;

//Calling our weather api
      return FetchWeatherApi()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isloading.value = false;
      });
    });
  }
}
