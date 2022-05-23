// To parse this JSON data, do
//
//     final kecamatanTandes = kecamatanTandesFromJson(jsonString);

import 'dart:convert';

Kecamatan kecamatanFromJson(String str) => Kecamatan.fromJson(json.decode(str));

String kecamatanToJson(Kecamatan data) => json.encode(data.toJson());

class Kecamatan {
  Kecamatan({
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

  factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
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
    this.moldLevel,
    this.aqi,
    this.pm10,
    this.co,
    this.o3,
    this.predominantPollenType,
    this.so2,
    this.pollenLevelTree,
    this.pollenLevelWeed,
    this.no2,
    this.pm25,
    this.pollenLevelGrass,
  });

  final int? moldLevel;
  final int? aqi;
  final double? pm10;
  final double? co;
  final double? o3;
  final String? predominantPollenType;
  final double? so2;
  final int? pollenLevelTree;
  final int? pollenLevelWeed;
  final double? no2;
  final double? pm25;
  final int? pollenLevelGrass;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        moldLevel: json["mold_level"],
        aqi: json["aqi"],
        pm10: json["pm10"].toDouble(),
        co: json["co"].toDouble(),
        o3: json["o3"].toDouble(),
        predominantPollenType: json["predominant_pollen_type"],
        so2: json["so2"].toDouble(),
        pollenLevelTree: json["pollen_level_tree"],
        pollenLevelWeed: json["pollen_level_weed"],
        no2: json["no2"].toDouble(),
        pm25: json["pm25"].toDouble(),
        pollenLevelGrass: json["pollen_level_grass"],
      );

  Map<String, dynamic> toJson() => {
        "mold_level": moldLevel,
        "aqi": aqi,
        "pm10": pm10,
        "co": co,
        "o3": o3,
        "predominant_pollen_type": predominantPollenType,
        "so2": so2,
        "pollen_level_tree": pollenLevelTree,
        "pollen_level_weed": pollenLevelWeed,
        "no2": no2,
        "pm25": pm25,
        "pollen_level_grass": pollenLevelGrass,
      };
}
