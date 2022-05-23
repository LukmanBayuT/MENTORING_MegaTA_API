import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projectairquality/model/model_kecamatan.dart';
import 'package:projectairquality/services/secure_storage.dart';

class ApiServicesAirQuality {
  SecureStorage secureStorage = SecureStorage();
  Future<Kecamatan> fetchDataTandes() async {
    var kecamatanTandesResponse = await http.get(Uri.parse(
        'https://api.weatherbit.io/v2.0/current/airquality?lat=-7.2570032&lon=112.6557509&key=0220a374f93244ebb6ab6ce81b77803f'));
    print(kecamatanTandesResponse.body);
    var output1 = kecamatanTandesResponse.body;
    Map<String, dynamic> kecTandesJson = jsonDecode(output1);
    print(kecTandesJson['data'][0]['aqi']);
    var kecTandesAqi = kecTandesJson['data'][0]['aqi'];
    secureStorage.writeSecureData('kecTandes', kecTandesAqi.toString());
    return kecamatanFromJson(kecamatanTandesResponse.body);
  }
}
