//instance for getting api response
class WeatherDataDaily {
  List<Daily> daily;
  WeatherDataDaily({required this.daily});

  factory WeatherDataDaily.fromJson(Map<String, dynamic> json) =>
      WeatherDataDaily(
        daily: List<Daily>.from(
          json['daily'].map(
            (e) => Daily.fromJson(e),
          ),
        ),
      );
}


class Daily {
  int? dt;
  Temp? temp;
  List<Weather>? weather;

  Daily({
    this.dt,
    this.temp,
    this.weather,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json['dt'] as int?,
        temp: json['temp'] == null
            ? null
            : Temp.fromJson(json['temp'] as Map<String, dynamic>),
        weather: (json['weather'] as List<dynamic>?)
            ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'dt': dt,
        'temp': temp?.toJson(),
        'weather': weather?.map((e) => e.toJson()).toList(),
      };
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}

class Temp {
  int? min;
  int? max;

  Temp({this.min, this.max,});

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        min: (json['min'] as num?)?.round(),
        max: (json['max'] as num?)?.round(),
      );

  Map<String, dynamic> toJson() => {
        'min': min,
        'max': max,
      };
}
