import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectairquality/model/model_kecamatan.dart';
import 'package:projectairquality/services/secure_storage.dart';

class ApiServicesAirQuality {
  SecureStorage secureStorage = SecureStorage();
  Future<Kecamatan> fetchDataTandes() async {
    var kecamatanTandesResponse = await http.get(Uri.parse(
        'https://api.weatherbit.io/v2.0/current/airquality?lat=-7.2570032&lon=112.6557509&key=0220a374f93244ebb6ab6ce81b77803f'));
    var output1 = kecamatanTandesResponse.body;
    Map<String, dynamic> kecTandesJson = jsonDecode(output1);
    var kecTandesAqi = kecTandesJson['data'][0]['aqi'];
    await secureStorage.writeSecureData('kecTandes', kecTandesAqi.toString());
    return kecamatanFromJson(kecamatanTandesResponse.body);
  }

  Future<Kecamatan> fetchDataAsemworo() async {
    var kecamatanAsemworoResponse = await http.get(Uri.parse(
        'https://api.weatherbit.io/v2.0/current/airquality?lat=-7.2388207&lon=112.6714753&key=0220a374f93244ebb6ab6ce81b77803f'));
    var output1 = kecamatanAsemworoResponse.body;
    Map<String, dynamic> kecAsemworoJson = jsonDecode(output1);
    var kecAsemworoAqi = kecAsemworoJson['data'][0]['aqi'];
    secureStorage.writeSecureData('kecAsemworo', kecAsemworoAqi.toString());
    return kecamatanFromJson(kecamatanAsemworoResponse.body);
  }

  Future<Kecamatan> fetchDataSukomanunggal() async {
    var kecamatanSukomanunggalResponse = await http.get(Uri.parse(
        'https://api.weatherbit.io/v2.0/current/airquality?lat=-7.2704832&lon=112.6818934&key=0220a374f93244ebb6ab6ce81b77803f'));
    var output1 = kecamatanSukomanunggalResponse.body;
    Map<String, dynamic> kecSukomanunggalJson = jsonDecode(output1);
    var kecSukomanunggalAqi = kecSukomanunggalJson['data'][0]['aqi'];
    secureStorage.writeSecureData(
        'kecSukomanunggal', kecSukomanunggalAqi.toString());
    return kecamatanFromJson(kecamatanSukomanunggalResponse.body);
  }

  Future<Kecamatan> fetchDataBenowo() async {
    var kecamatanBenowoResponse = await http.get(Uri.parse(
        'https://api.weatherbit.io/v2.0/current/airquality?lat=-7.2285631&lon=112.6115998&key=0220a374f93244ebb6ab6ce81b77803f'));
    var output1 = kecamatanBenowoResponse.body;
    Map<String, dynamic> kecBenowoJson = jsonDecode(output1);
    var kecBenowoAqi = kecBenowoJson['data'][0]['aqi'];
    secureStorage.writeSecureData('kecBenowo', kecBenowoAqi.toString());
    return kecamatanFromJson(kecamatanBenowoResponse.body);
  }

  Future<Kecamatan> fetchDataLakarsantri() async {
    var kecamatanLakarsantriResponse = await http.get(Uri.parse(
        'https://api.weatherbit.io/v2.0/current/airquality?lat=-7.3226681&lon=112.6178609&key=0220a374f93244ebb6ab6ce81b77803f'));
    var output1 = kecamatanLakarsantriResponse.body;
    Map<String, dynamic> kecLakarsantriJson = jsonDecode(output1);
    var kecLakarsantriAqi = kecLakarsantriJson['data'][0]['aqi'];
    print(kecLakarsantriAqi);
    secureStorage.writeSecureData(
        'kecLakarsantri', kecLakarsantriAqi.toString());
    return kecamatanFromJson(kecamatanLakarsantriResponse.body);
  }

  Future<Kecamatan> fetchDataSambikerep() async {
    var kecamatanSambikerepResponse = await http.get(Uri.parse(
        'https://api.weatherbit.io/v2.0/current/airquality?lat=-7.2751222&lon=112.6377688&key=0220a374f93244ebb6ab6ce81b77803f'));
    var output1 = kecamatanSambikerepResponse.body;
    Map<String, dynamic> kecSambikerepJson = jsonDecode(output1);
    var kecSambikerepAqi = kecSambikerepJson['data'][0]['aqi'];
    secureStorage.writeSecureData('kecSambikerep', kecSambikerepAqi.toString());
    return kecamatanFromJson(kecamatanSambikerepResponse.body);
  }

  Future<Kecamatan> fetchDataPakal() async {
    var kecamatanPakalResponse = await http.get(Uri.parse(
        'https://api.weatherbit.io/v2.0/current/airquality?lat=-7.2318214&lon=112.5427117&key=0220a374f93244ebb6ab6ce81b77803f'));
    var output1 = kecamatanPakalResponse.body;
    Map<String, dynamic> kecPakalJson = jsonDecode(output1);
    var kecPakalAqi = kecPakalJson['data'][0]['aqi'];
    secureStorage.writeSecureData('kecPakal', kecPakalAqi.toString());
    return kecamatanFromJson(kecamatanPakalResponse.body);
  }
}
