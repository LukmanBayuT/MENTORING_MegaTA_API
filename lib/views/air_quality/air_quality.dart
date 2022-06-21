import 'dart:async';

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
  num? kecAsemworo;
  String? kecBen = 'Kecamatan Benowo';
  num? kecBenowo;
  String? kecLakar = 'Kecamatan Lakarsantri';
  num? kecLakarsantri;
  String? kecPak = 'Kecamatan Pakal';
  num? kecPakal;
  String? kecSambi = 'Kecamatan Sambikerep';
  num? kecSambikerep;
  String? kecSuko = 'Kecamatan Sukomanunggal';
  num? kecSukomanunggal;
  String? kecTan = 'Kecamatan Tandes';
  num? kecTandes;
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
    readTandes();
    readAsemworo();
    readSukomanunggal();
    readBenowo();
    readSambikerep();
    readPakal();
    readLakarsantri();
    super.initState();
  }

  void readTandes() async {
    var kecTandesStr = await secureStorage.readSecureData('kecTandes');
    var kecTandesParse = int.parse(kecTandesStr);
    kecTandes = kecTandesParse;
    setState(() {});
  }

  void readAsemworo() async {
    var kecAsemworoStr = await secureStorage.readSecureData('kecAsemworo');
    var kecAsemworoParse = int.parse(kecAsemworoStr);
    kecAsemworo = kecAsemworoParse;
    setState(() {});
  }

  void readSukomanunggal() async {
    var kecSukomanunggalStr =
        await secureStorage.readSecureData('kecSukomanunggal');
    var kecSukomanunggalParse = int.parse(kecSukomanunggalStr);
    kecSukomanunggal = kecSukomanunggalParse;
    setState(() {});
  }

  void readBenowo() async {
    var kecBenowoStr = await secureStorage.readSecureData('kecBenowo');
    var kecBenowoParseStr = int.parse(kecBenowoStr);
    kecBenowo = kecBenowoParseStr;
    setState(() {});
  }

  void readSambikerep() async {
    var kecSambikerepStr = await secureStorage.readSecureData('kecSambikerep');
    var kecSambikerepParse = int.parse(kecSambikerepStr);
    kecSambikerep = kecSambikerepParse;
    setState(() {});
  }

  void readPakal() async {
    var kecPakalStr = await secureStorage.readSecureData('kecPakal');
    var kecPakalParse = int.parse(kecPakalStr);
    kecPakal = kecPakalParse;
    setState(() {});
  }

  void readLakarsantri() async {
    var kecLakarsantriStr =
        await secureStorage.readSecureData('kecLakarsantri');
    var kecLakarParse = int.parse(kecLakarsantriStr);
    kecLakarsantri = kecLakarParse;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Air Quality',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: GoogleMap(
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
                        ispu: kecTandes,
                        alamat: kecTan,
                        lat: latTan,
                        long: longTan,
                      ));
                },
                title: 'Kecamatan Tandes',
                snippet: 'ISPU : $kecTandes'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
          Marker(
            markerId: const MarkerId('Kecamatan Asemworo'),
            position: const LatLng(-7.2388207, 112.6714753),
            infoWindow: InfoWindow(
                onTap: () {
                  Get.to(() => AirQualityDetails(
                        ispu: kecAsemworo,
                        alamat: kecAsem,
                        lat: latAsm,
                        long: longAsm,
                      ));
                },
                title: 'Kecamatan Asemworo',
                snippet: 'ISPU : $kecAsemworo'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
          Marker(
            markerId: const MarkerId('Kecamatan Sukomanunggal'),
            position: const LatLng(-7.2704832, 112.6818934),
            infoWindow: InfoWindow(
                onTap: () {
                  Get.to(() => AirQualityDetails(
                        ispu: kecSukomanunggal,
                        alamat: kecSuko,
                        lat: latSuko,
                        long: longSuko,
                      ));
                },
                title: 'Kecamatan Sukomanunggal',
                snippet: 'ISPU : $kecSukomanunggal'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
          Marker(
              markerId: const MarkerId('Kecamatan Benowo'),
              position: const LatLng(-7.2285631, 112.6115998),
              infoWindow: InfoWindow(
                  onTap: () {
                    Get.to(() => AirQualityDetails(
                          ispu: kecBenowo,
                          alamat: kecBen,
                          lat: latBen,
                          long: longBen,
                        ));
                  },
                  title: 'Kecamatan Benowo',
                  snippet: 'ISPU : $kecBenowo'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
              onTap: () {}),
          Marker(
            markerId: const MarkerId('Kecamatan Lakarsantri'),
            position: const LatLng(-7.3226681, 112.6178609),
            infoWindow: InfoWindow(
                onTap: () {
                  Get.to(() => AirQualityDetails(
                        ispu: kecLakarsantri,
                        alamat: kecLakar,
                        lat: latLak,
                        long: longLak,
                      ));
                },
                title: 'Kecamatan Lakarsantri',
                snippet: 'ISPU : $kecLakarsantri'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
          Marker(
            markerId: const MarkerId('Kecamatan Sambikerep'),
            position: const LatLng(-7.2751222, 112.6377688),
            infoWindow: InfoWindow(
                onTap: () {
                  Get.to(() => AirQualityDetails(
                        ispu: kecSambikerep,
                        alamat: kecSambi,
                        lat: latSam,
                        long: longSam,
                      ));
                },
                title: 'Kecamatan Sambikerep',
                snippet: 'ISPU : $kecSambikerep'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
          Marker(
            markerId: const MarkerId('Kecamatan Pakal'),
            position: const LatLng(-7.2318214, 112.5427117),
            infoWindow: InfoWindow(
                onTap: () {
                  Get.to(() => AirQualityDetails(
                        ispu: kecPakal,
                        alamat: kecPak,
                        lat: latPak,
                        long: longPak,
                      ));
                },
                title: 'Kecamatan Pakal',
                snippet: 'ISPU : $kecPakal'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
        },
      ),
    );
  }
}
