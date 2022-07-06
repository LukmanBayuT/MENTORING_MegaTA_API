import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../services/secure_storage.dart';
import 'aq_details.dart';

class AirQuality extends StatefulWidget {
  const AirQuality({Key? key}) : super(key: key);

  @override
  State<AirQuality> createState() => _AirQualityState();
}

class _AirQualityState extends State<AirQuality> {
  CameraPosition initialCameraPosition = const CameraPosition(
      zoom: 12, tilt: 20, target: LatLng(-7.2756141, 112.6426429));

  String? kecAsem = 'Kecamatan Asemworo';
  // num? kecAsemworo;
  String? kecBen = 'Kecamatan Benowo';
  // num? kecBenowo;
  String? kecLakar = 'Kecamatan Lakarsantri';
  // num? kecLakarsantri;
  String? kecPak = 'Kecamatan Pakal';
  // num? kecPakal;
  String? kecSambi = 'Kecamatan Sambikerep';
  // num? kecSambikerep;
  String? kecSuko = 'Kecamatan Sukomanunggal';
  // num? kecSukomanunggal;
  String? kecTan = 'Kecamatan Tandes';
  // num? kecTandes;
  String? latAsm = '-7.2388207';
  String? latBen = '-7.2285631';
  String? latLak = '-7.3226681';
  String? latPak = '-7.2318214';
  String? latSam = '-7.2751222';
  String? latSuko = '-7.2704832';
  String? latTan = '-7.2570032';
  String? longAsm = '112.6714753';
  String? longBen = '112.6115998';
  String? longLak = '112.6178609';
  String? longPak = '112.5427117';
  String? longSam = '112.6377688';
  String? longSuko = '112.6818934';
  String? longTan = '112.6557509';
  SecureStorage secureStorage = SecureStorage();

  final Completer<GoogleMapController> _controller = Completer();
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // readTandes();
    // readAsemworo();
    // readSukomanunggal();
    // readBenowo();
    // readSambikerep();
    // readPakal();
    // readLakarsantri();
    super.initState();
  }

  // void readTandes() async {
  //   var kecTandesStr = await secureStorage.readSecureData('kecTandes');
  //   var kecTandesParse = int.parse(kecTandesStr);
  //   kecTandes = kecTandesParse;
  //   setState(() {});
  // }

  // void readAsemworo() async {
  //   var kecAsemworoStr = await secureStorage.readSecureData('kecAsemworo');
  //   var kecAsemworoParse = int.parse(kecAsemworoStr);
  //   kecAsemworo = kecAsemworoParse;
  //   setState(() {});
  // }

  // void readSukomanunggal() async {
  //   var kecSukomanunggalStr =
  //       await secureStorage.readSecureData('kecSukomanunggal');
  //   var kecSukomanunggalParse = int.parse(kecSukomanunggalStr);
  //   kecSukomanunggal = kecSukomanunggalParse;
  //   setState(() {});
  // }

  // void readBenowo() async {
  //   var kecBenowoStr = await secureStorage.readSecureData('kecBenowo');
  //   var kecBenowoParseStr = int.parse(kecBenowoStr);
  //   kecBenowo = kecBenowoParseStr;
  //   setState(() {});
  // }

  // void readSambikerep() async {
  //   var kecSambikerepStr = await secureStorage.readSecureData('kecSambikerep');
  //   var kecSambikerepParse = int.parse(kecSambikerepStr);
  //   kecSambikerep = kecSambikerepParse;
  //   setState(() {});
  // }

  // void readPakal() async {
  //   var kecPakalStr = await secureStorage.readSecureData('kecPakal');
  //   var kecPakalParse = int.parse(kecPakalStr);
  //   kecPakal = kecPakalParse;
  //   setState(() {});
  // }

  // void readLakarsantri() async {
  //   var kecLakarsantriStr =
  //       await secureStorage.readSecureData('kecLakarsantri');
  //   var kecLakarParse = int.parse(kecLakarsantriStr);
  //   kecLakarsantri = kecLakarParse;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Air Quality',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: db.collection('ispu').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var data = snapshot.data!.docs;
          return GoogleMap(
            initialCameraPosition: initialCameraPosition,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: {
              Marker(
                visible: true,
                markerId: const MarkerId('Kecamatan Tandes'),
                position: const LatLng(-7.2570035, 112.6732605),
                infoWindow: InfoWindow(
                    onTap: () {
                      Get.to(() => AirQualityDetails(
                            ispu: data[7].data()['ispu'],
                            alamat: kecTan,
                            lat: latTan,
                            long: longTan,
                            co: data[7].data()['co'],
                            no2: data[7].data()['no2'],
                            o3: data[7].data()['o3'],
                            pm10: data[7].data()['pm10'],
                            pm25: data[7].data()['pm25'],
                            so2: data[7].data()['so2'],
                          ));
                    },
                    title: 'Kecamatan Tandes',
                    snippet: 'ISPU : ${data[7].data()['ispu'].toString()}'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              ),
              Marker(
                markerId: const MarkerId('Kecamatan Asemworo'),
                position: const LatLng(-7.2388207, 112.6714753),
                infoWindow: InfoWindow(
                    onTap: () {
                      Get.to(() => AirQualityDetails(
                            ispu: data[1].data()['ispu'],
                            alamat: kecAsem,
                            lat: latAsm,
                            long: longAsm,
                            co: data[1].data()['co'],
                            no2: data[1].data()['no2'],
                            o3: data[1].data()['o3'],
                            pm10: data[1].data()['pm10'],
                            pm25: data[1].data()['pm25'],
                            so2: data[1].data()['so2'],
                          ));
                    },
                    title: 'Kecamatan Asemworo',
                    snippet: 'ISPU : ${data[1].data()['ispu'].toString()}'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              ),
              Marker(
                markerId: const MarkerId('Kecamatan Sukomanunggal'),
                position: const LatLng(-7.2704832, 112.6818934),
                infoWindow: InfoWindow(
                    onTap: () {
                      Get.to(() => AirQualityDetails(
                            ispu: data[6].data()['ispu'],
                            alamat: kecSuko,
                            lat: latSuko,
                            long: longSuko,
                            co: data[6].data()['co'],
                            no2: data[6].data()['no2'],
                            o3: data[6].data()['o3'],
                            pm10: data[6].data()['pm10'],
                            pm25: data[6].data()['pm25'],
                            so2: data[6].data()['so2'],
                          ));
                    },
                    title: 'Kecamatan Sukomanunggal',
                    snippet: 'ISPU : ${data[6].data()['ispu'].toString()}'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              ),
              Marker(
                  markerId: const MarkerId('Kecamatan Benowo'),
                  position: const LatLng(-7.2285631, 112.6115998),
                  infoWindow: InfoWindow(
                      onTap: () {
                        Get.to(() => AirQualityDetails(
                              ispu: data[2].data()['ispu'],
                              alamat: kecBen,
                              lat: latBen,
                              long: longBen,
                              co: data[2].data()['co'],
                              no2: data[2].data()['no2'],
                              o3: data[2].data()['o3'],
                              pm10: data[2].data()['pm10'],
                              pm25: data[2].data()['pm25'],
                              so2: data[2].data()['so2'],
                            ));
                      },
                      title: 'Kecamatan Benowo',
                      snippet: 'ISPU : ${data[2].data()['ispu'].toString()}'),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed),
                  onTap: () {}),
              Marker(
                markerId: const MarkerId('Kecamatan Lakarsantri'),
                position: const LatLng(-7.3226681, 112.6178609),
                infoWindow: InfoWindow(
                    onTap: () {
                      Get.to(() => AirQualityDetails(
                            ispu: data[3].data()['ispu'],
                            alamat: kecLakar,
                            lat: latLak,
                            long: longLak,
                            co: data[3].data()['co'],
                            no2: data[3].data()['no2'],
                            o3: data[3].data()['o3'],
                            pm10: data[3].data()['pm10'],
                            pm25: data[3].data()['pm25'],
                            so2: data[3].data()['so2'],
                          ));
                    },
                    title: 'Kecamatan Lakarsantri',
                    snippet: 'ISPU : ${data[3].data()['ispu'].toString()}'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              ),
              Marker(
                markerId: const MarkerId('Kecamatan Sambikerep'),
                position: const LatLng(-7.2751222, 112.6377688),
                infoWindow: InfoWindow(
                    onTap: () {
                      Get.to(() => AirQualityDetails(
                            ispu: data[5].data()['ispu'],
                            alamat: kecSambi,
                            lat: latSam,
                            long: longSam,
                            co: data[5].data()['co'],
                            no2: data[5].data()['no2'],
                            o3: data[5].data()['o3'],
                            pm10: data[5].data()['pm10'],
                            pm25: data[5].data()['pm25'],
                            so2: data[5].data()['so2'],
                          ));
                    },
                    title: 'Kecamatan Sambikerep',
                    snippet: 'ISPU : ${data[5].data()['ispu'].toString()}'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              ),
              Marker(
                markerId: const MarkerId('Kecamatan Pakal'),
                position: const LatLng(-7.2318214, 112.5427117),
                infoWindow: InfoWindow(
                    onTap: () {
                      Get.to(() => AirQualityDetails(
                            ispu: data[4].data()['ispu'],
                            alamat: kecPak,
                            lat: latPak,
                            long: longPak,
                            co: data[4].data()['co'],
                            no2: data[4].data()['no2'],
                            o3: data[4].data()['o3'],
                            pm10: data[4].data()['pm10'],
                            pm25: data[4].data()['pm25'],
                            so2: data[4].data()['so2'],
                          ));
                    },
                    title: 'Kecamatan Pakal',
                    snippet: 'ISPU : ${data[4].data()['ispu'].toString()}'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              ),
            },
          );
        },
      ),
    );
  }
}
