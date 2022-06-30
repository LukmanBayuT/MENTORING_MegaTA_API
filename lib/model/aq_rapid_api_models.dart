// To parse this JSON data, do
//
//     final aqData = aqDataFromJson(jsonString);

import 'dart:convert';

AqData aqDataFromJson(String str) => AqData.fromJson(json.decode(str));

String aqDataToJson(AqData data) => json.encode(data.toJson());

class AqData {
  AqData({
    this.data,
    this.cityName,
    this.lon,
    this.timezone,
    this.lat,
    this.countryCode,
    this.stateCode,
  });

  final List<Datum>? data;
  final String? cityName;
  final double? lon;
  final String? timezone;
  final double? lat;
  final String? countryCode;
  final String? stateCode;

  factory AqData.fromJson(Map<String, dynamic> json) => AqData(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        cityName: json["city_name"],
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        lat: json["lat"].toDouble(),
        countryCode: json["country_code"],
        stateCode: json["state_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "city_name": cityName,
        "lon": lon,
        "timezone": timezone,
        "lat": lat,
        "country_code": countryCode,
        "state_code": stateCode,
      };
}

class Datum {
  Datum({
    this.aqi,
    this.pm10,
    this.pm25,
    this.o3,
    this.timestampLocal,
    this.so2,
    this.no2,
    this.timestampUtc,
    this.datetime,
    this.co,
    this.ts,
  });

  final int? aqi;
  final double? pm10;
  final double? pm25;
  final double? o3;
  final DateTime? timestampLocal;
  final double? so2;
  final double? no2;
  final DateTime? timestampUtc;
  final String? datetime;
  final double? co;
  final int? ts;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        aqi: json["aqi"],
        pm10: json["pm10"].toDouble(),
        pm25: json["pm25"].toDouble(),
        o3: json["o3"].toDouble(),
        timestampLocal: DateTime.parse(json["timestamp_local"]),
        so2: json["so2"].toDouble(),
        no2: json["no2"].toDouble(),
        timestampUtc: DateTime.parse(json["timestamp_utc"]),
        datetime: json["datetime"],
        co: json["co"].toDouble(),
        ts: json["ts"],
      );

  Map<String, dynamic> toJson() => {
        "aqi": aqi,
        "pm10": pm10,
        "pm25": pm25,
        "o3": o3,
        "timestamp_local": timestampLocal!.toIso8601String(),
        "so2": so2,
        "no2": no2,
        "timestamp_utc": timestampUtc!.toIso8601String(),
        "datetime": datetime,
        "co": co,
        "ts": ts,
      };
}
