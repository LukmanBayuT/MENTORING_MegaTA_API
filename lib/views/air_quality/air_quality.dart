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
      zoom: 11, tilt: 20, target: LatLng(-7.2756141, 112.6426429));

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
  String? kecGen = 'Kecamatan Genteng';
  String? kecKen = 'Kecamatan Kenjeran';
  String? kecMul = 'Kecamatan Mulyorejo';
  String? kecRung = 'Kecamatan Rungkut';
  String? kecSaw = 'Kecamatan Sawahan';
  String? kecWiy = 'Kecamatan Wiyung';
  String? kecWon = 'Kecamatan Wonokromo';

  String? latGen = '-7.259088';
  String? longGen = '112.747986';
  String? latKen = '-7.220266';
  String? longKen = '112.768842';
  String? latMul = '-7.269315';
  String? longMul = '112.792676';
  String? latRung = '-7.319019';
  String? longRung = '112.804593';
  String? latSaw = '-7.2630131';
  String? longSaw = '112.7211714';
  String? latWiy = '-7.315256';
  String? longWiy = '112.685417';
  String? latWon = '-7.302664';
  String? longWon = '112.733089';

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
    super.initState();
  }

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
                            ispu: data[16].data()['ispu'],
                            alamat: kecTan,
                            lat: latTan,
                            long: longTan,
                            co: data[16].data()['co'],
                            no2: data[16].data()['no2'],
                            o3: data[16].data()['o3'],
                            pm10: data[16].data()['pm10'],
                            pm25: data[16].data()['pm25'],
                            so2: data[16].data()['so2'],
                            pk: data[16].data()['pk'],
                          ));
                    },
                    title: 'Kecamatan Tandes',
                    snippet: 'ISPU : ${data[16].data()['ispu'].toString()}'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              ),
              Marker(
                markerId: const MarkerId('Kecamatan Lakarsantri'),
                position: const LatLng(-7.3226681, 112.6178609),
                infoWindow: InfoWindow(
                    onTap: () {
                      Get.to(() => AirQualityDetails(
                            ispu: data[12].data()['ispu'],
                            alamat: kecLakar,
                            lat: latLak,
                            long: longLak,
                            co: data[12].data()['co'],
                            no2: data[12].data()['no2'],
                            o3: data[12].data()['o3'],
                            pm10: data[12].data()['pm10'],
                            pm25: data[12].data()['pm25'],
                            so2: data[12].data()['so2'],
                            pk: data[12].data()['pk'],
                          ));
                    },
                    title: 'Kecamatan Lakarsantri',
                    snippet: 'ISPU : ${data[12].data()['ispu'].toString()}'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              ),
              Marker(
                markerId: const MarkerId('Kecamatan Genteng'),
                position: const LatLng(-7.259088, 112.747986),
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
                            pk: data[3].data()['pk'],
                          ));
                    },
                    title: 'Kecamatan Genteng',
                    snippet: 'ISPU : ${data[3].data()['ispu'].toString()}'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              ),
              Marker(
                markerId: const MarkerId('Kecamatan Kenjeran'),
                position: const LatLng(-7.220266, 112.768842),
                infoWindow: InfoWindow(
                    onTap: () {
                      Get.to(() => AirQualityDetails(
                            ispu: data[4].data()['ispu'],
                            alamat: kecLakar,
                            lat: latLak,
                            long: longLak,
                            co: data[4].data()['co'],
                            no2: data[4].data()['no2'],
                            o3: data[4].data()['o3'],
                            pm10: data[4].data()['pm10'],
                            pm25: data[4].data()['pm25'],
                            so2: data[4].data()['so2'],
                            pk: data[4].data()['pk'],
                          ));
                    },
                    title: 'Kecamatan Kenjeran',
                    snippet: 'ISPU : ${data[4].data()['ispu'].toString()}'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              ),
              Marker(
                markerId: const MarkerId('Kecamatan Mulyorejo'),
                position: const LatLng(-7.269315, 112.792676),
                infoWindow: InfoWindow(
                    onTap: () {
                      Get.to(() => AirQualityDetails(
                            ispu: data[6].data()['ispu'],
                            alamat: kecLakar,
                            lat: latLak,
                            long: longLak,
                            co: data[6].data()['co'],
                            no2: data[6].data()['no2'],
                            o3: data[6].data()['o3'],
                            pm10: data[6].data()['pm10'],
                            pm25: data[6].data()['pm25'],
                            so2: data[6].data()['so2'],
                            pk: data[6].data()['pk'],
                          ));
                    },
                    title: 'Kecamatan Mulyorejo',
                    snippet: 'ISPU : ${data[6].data()['ispu'].toString()}'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              ),
              Marker(
                markerId: const MarkerId('Kecamatan Rungkut'),
                position: const LatLng(-7.319019, 112.804593),
                infoWindow: InfoWindow(
                    onTap: () {
                      Get.to(() => AirQualityDetails(
                            ispu: data[7].data()['ispu'],
                            alamat: kecLakar,
                            lat: latLak,
                            long: longLak,
                            co: data[7].data()['co'],
                            no2: data[7].data()['no2'],
                            o3: data[7].data()['o3'],
                            pm10: data[7].data()['pm10'],
                            pm25: data[7].data()['pm25'],
                            so2: data[7].data()['so2'],
                            pk: data[7].data()['pk'],
                          ));
                    },
                    title: 'Kecamatan Rungkut',
                    snippet: 'ISPU : ${data[7].data()['ispu'].toString()}'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              ),
              Marker(
                markerId: const MarkerId('Kecamatan Sawahan'),
                position: const LatLng(-7.2630131, 112.7211714),
                infoWindow: InfoWindow(
                    onTap: () {
                      Get.to(() => AirQualityDetails(
                            ispu: data[8].data()['ispu'],
                            alamat: kecLakar,
                            lat: latLak,
                            long: longLak,
                            co: data[8].data()['co'],
                            no2: data[8].data()['no2'],
                            o3: data[8].data()['o3'],
                            pm10: data[8].data()['pm10'],
                            pm25: data[8].data()['pm25'],
                            so2: data[8].data()['so2'],
                            pk: data[8].data()['pk'],
                          ));
                    },
                    title: 'Kecamatan Sawahan',
                    snippet: 'ISPU : ${data[8].data()['ispu'].toString()}'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              ),
              Marker(
                markerId: const MarkerId('Kecamatan Wiyung'),
                position: const LatLng(-7.315256, 112.685417),
                infoWindow: InfoWindow(
                    onTap: () {
                      Get.to(() => AirQualityDetails(
                            ispu: data[10].data()['ispu'],
                            alamat: kecLakar,
                            lat: latLak,
                            long: longLak,
                            co: data[10].data()['co'],
                            no2: data[10].data()['no2'],
                            o3: data[10].data()['o3'],
                            pm10: data[10].data()['pm10'],
                            pm25: data[10].data()['pm25'],
                            so2: data[10].data()['so2'],
                            pk: data[10].data()['pk'],
                          ));
                    },
                    title: 'Kecamatan Wiyung',
                    snippet: 'ISPU : ${data[10].data()['ispu'].toString()}'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed),
              ),
              Marker(
                markerId: const MarkerId('Kecamatan Wonokromo'),
                position: const LatLng(-7.2630131, 112.7211714),
                infoWindow: InfoWindow(
                    onTap: () {
                      Get.to(() => AirQualityDetails(
                            ispu: data[11].data()['ispu'],
                            alamat: kecLakar,
                            lat: latLak,
                            long: longLak,
                            co: data[11].data()['co'],
                            no2: data[11].data()['no2'],
                            o3: data[11].data()['o3'],
                            pm10: data[11].data()['pm10'],
                            pm25: data[11].data()['pm25'],
                            so2: data[11].data()['so2'],
                            pk: data[11].data()['pk'],
                          ));
                    },
                    title: 'Kecamatan Wonokromo',
                    snippet: 'ISPU : ${data[11].data()['ispu'].toString()}'),
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
