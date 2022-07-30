// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projectairquality/model/api_temp_models.dart';

class ApiTemperature {
  Future<TemperatureModels> getTemp() async {
    var headers = {
      'X-RapidAPI-Key': '3a416c2ceamshbf5ffb8d1964617p1fe44ajsn9ad309dab626',
      'X-RapidAPI-Host': 'weatherbit-v1-mashape.p.rapidapi.com',
      'useQueryString': 'true'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://weatherbit-v1-mashape.p.rapidapi.com/forecast/3hourly?lat=-7.2755979&lon=112.572597&units=m'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var temperature = await response.stream.bytesToString();
    var jsonTemp = jsonDecode(temperature);

    if (response.statusCode == 200) {
      print(jsonTemp);
    } else {
      print(response.reasonPhrase);
    }
    return temperatureDetailsFromJson(temperature);
  }
}
