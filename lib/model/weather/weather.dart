import 'datum.dart';

class Weather {
  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  List<Datum>? data;

  Weather({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.data,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        lat: (json['lat'] as num?)?.toDouble(),
        lon: (json['lon'] as num?)?.toDouble(),
        timezone: json['timezone'] as String?,
        timezoneOffset: json['timezone_offset'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lon': lon,
        'timezone': timezone,
        'timezone_offset': timezoneOffset,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
