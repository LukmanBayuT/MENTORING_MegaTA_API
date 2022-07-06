// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:projectairquality/model/get_temp_models.dart';
import 'package:http/http.dart' as http;
import 'package:projectairquality/services/secure_storage.dart';

class ApiTemperature {
  SecureStorage secureStorage = SecureStorage();
  Future<TemperatureModel> getTemp() async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)'
    };
    var url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=78f7dcf53c7347428eb80556222306&q=Surabaya&aqi=yes');

    var req = http.Request('GET', url);
    req.headers.addAll(headersList);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      // var jsonTemp = jsonDecode(resBody);
      // var tempIni = jsonTemp['current']['temp_c'];
      // var windIni = jsonTemp['current']['wind_mph'];
      // var humidityIni = jsonTemp['current']['humidity'];
      // await secureStorage.writeSecureData('temp', tempIni.toString());
      // await secureStorage.writeSecureData('wind', windIni.toString());
      // await secureStorage.writeSecureData('hum', humidityIni.toString());
      // print(tempIni);
      // print(windIni);
      // print(humidityIni);
    } else {
      print(res.reasonPhrase);
    }
    return temperatureModelFromJson(resBody);
  }
}
