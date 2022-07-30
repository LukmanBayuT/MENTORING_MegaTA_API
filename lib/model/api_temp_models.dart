// To parse this JSON data, do
//
//     final temperatureDetails = temperatureDetailsFromJson(jsonString);

import 'dart:convert';

TemperatureModels temperatureDetailsFromJson(String str) =>
    TemperatureModels.fromJson(json.decode(str));

String temperatureDetailsToJson(TemperatureModels data) =>
    json.encode(data.toJson());

class TemperatureModels {
  TemperatureModels({
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

  factory TemperatureModels.fromJson(Map<String, dynamic> json) =>
      TemperatureModels(
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
    this.windCdir,
    this.rh,
    this.pod,
    this.timestampUtc,
    this.pres,
    this.solarRad,
    this.ozone,
    this.weather,
    this.windGustSpd,
    this.timestampLocal,
    this.snowDepth,
    this.clouds,
    this.ts,
    this.windSpd,
    this.pop,
    this.windCdirFull,
    this.slp,
    this.dni,
    this.dewpt,
    this.snow,
    this.uv,
    this.windDir,
    this.cloudsHi,
    this.precip,
    this.vis,
    this.dhi,
    this.appTemp,
    this.datetime,
    this.temp,
    this.ghi,
    this.cloudsMid,
    this.cloudsLow,
  });

  final String? windCdir;
  final int? rh;
  final Pod? pod;
  final DateTime? timestampUtc;
  final double? pres;
  final double? solarRad;
  final double? ozone;
  final Weather? weather;
  final double? windGustSpd;
  final DateTime? timestampLocal;
  final int? snowDepth;
  final int? clouds;
  final int? ts;
  final double? windSpd;
  final int? pop;
  final String? windCdirFull;
  final double? slp;
  final double? dni;
  final double? dewpt;
  final int? snow;
  final double? uv;
  final int? windDir;
  final int? cloudsHi;
  final double? precip;
  final double? vis;
  final double? dhi;
  final double? appTemp;
  final String? datetime;
  final double? temp;
  final double? ghi;
  final int? cloudsMid;
  final int? cloudsLow;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        windCdir: json["wind_cdir"],
        rh: json["rh"],
        pod: podValues.map![json["pod"]],
        timestampUtc: DateTime.parse(json["timestamp_utc"]),
        pres: json["pres"].toDouble(),
        solarRad: json["solar_rad"].toDouble(),
        ozone: json["ozone"].toDouble(),
        weather: Weather.fromJson(json["weather"]),
        windGustSpd: json["wind_gust_spd"].toDouble(),
        timestampLocal: DateTime.parse(json["timestamp_local"]),
        snowDepth: json["snow_depth"],
        clouds: json["clouds"],
        ts: json["ts"],
        windSpd: json["wind_spd"].toDouble(),
        pop: json["pop"],
        windCdirFull: json["wind_cdir_full"],
        slp: json["slp"].toDouble(),
        dni: json["dni"].toDouble(),
        dewpt: json["dewpt"].toDouble(),
        snow: json["snow"],
        uv: json["uv"].toDouble(),
        windDir: json["wind_dir"],
        cloudsHi: json["clouds_hi"],
        precip: json["precip"].toDouble(),
        vis: json["vis"].toDouble(),
        dhi: json["dhi"].toDouble(),
        appTemp: json["app_temp"].toDouble(),
        datetime: json["datetime"],
        temp: json["temp"].toDouble(),
        ghi: json["ghi"].toDouble(),
        cloudsMid: json["clouds_mid"],
        cloudsLow: json["clouds_low"],
      );

  Map<String, dynamic> toJson() => {
        "wind_cdir": windCdir,
        "rh": rh,
        "pod": podValues.reverse![pod],
        "timestamp_utc": timestampUtc!.toIso8601String(),
        "pres": pres,
        "solar_rad": solarRad,
        "ozone": ozone,
        "weather": weather!.toJson(),
        "wind_gust_spd": windGustSpd,
        "timestamp_local": timestampLocal!.toIso8601String(),
        "snow_depth": snowDepth,
        "clouds": clouds,
        "ts": ts,
        "wind_spd": windSpd,
        "pop": pop,
        "wind_cdir_full": windCdirFull,
        "slp": slp,
        "dni": dni,
        "dewpt": dewpt,
        "snow": snow,
        "uv": uv,
        "wind_dir": windDir,
        "clouds_hi": cloudsHi,
        "precip": precip,
        "vis": vis,
        "dhi": dhi,
        "app_temp": appTemp,
        "datetime": datetime,
        "temp": temp,
        "ghi": ghi,
        "clouds_mid": cloudsMid,
        "clouds_low": cloudsLow,
      };
}

enum Pod { N, D }

final podValues = EnumValues({"d": Pod.D, "n": Pod.N});

class Weather {
  Weather({
    this.icon,
    this.code,
    this.description,
  });

  final String? icon;
  final int? code;
  final Description? description;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        icon: json["icon"],
        code: json["code"],
        description: descriptionValues.map![json["description"]],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "code": code,
        "description": descriptionValues.reverse![description],
      };
}

enum Description {
  OVERCAST_CLOUDS,
  BROKEN_CLOUDS,
  SCATTERED_CLOUDS,
  FEW_CLOUDS,
  CLEAR_SKY
}

final descriptionValues = EnumValues({
  "Broken clouds": Description.BROKEN_CLOUDS,
  "Clear Sky": Description.CLEAR_SKY,
  "Few clouds": Description.FEW_CLOUDS,
  "Overcast clouds": Description.OVERCAST_CLOUDS,
  "Scattered clouds": Description.SCATTERED_CLOUDS
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
