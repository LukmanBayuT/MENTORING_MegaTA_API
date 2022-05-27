import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projectairquality/services/secure_storage.dart';
import 'package:projectairquality/views/aq_details.dart';

class AirQuality extends StatefulWidget {
  const AirQuality({Key? key}) : super(key: key);

  @override
  State<AirQuality> createState() => _AirQualityState();
}

class _AirQualityState extends State<AirQuality> {
  SecureStorage secureStorage = SecureStorage();
  final Completer<GoogleMapController> _controller = Completer();
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  CameraPosition initialCameraPosition = const CameraPosition(
      zoom: 12, tilt: 20, target: LatLng(-7.2756141, 112.6426429));

  String? kecTandes;
  String? kecAsemworo;
  String? kecSukomanunggal;
  String? kecBenowo;
  String? kecLakarsantri;
  String? kecSambikerep;
  String? kecPakal;

  void readTandes() async {
    kecTandes = await secureStorage.readSecureData('kecTandes');
    setState(() {});
  }

  void readAsemworo() async {
    kecAsemworo = await secureStorage.readSecureData('kecAsemworo');
    setState(() {});
  }

  void readSukomanunggal() async {
    kecSukomanunggal = await secureStorage.readSecureData('kecSukomanunggal');
    setState(() {});
  }

  void readBenowo() async {
    kecBenowo = await secureStorage.readSecureData('kecBenowo');
    setState(() {});
  }

  void readSambikerep() async {
    kecSambikerep = await secureStorage.readSecureData('kecSambikerep');
    setState(() {});
  }

  void readPakal() async {
    kecPakal = await secureStorage.readSecureData('kecPakal');
    setState(() {});
  }

  @override
  void initState() {
    readTandes();
    readAsemworo();
    readSukomanunggal();
    readBenowo();
    readSambikerep();
    readPakal();
    super.initState();
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
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
                  title: 'Kecamatan Tandes',
                  snippet: 'Kualitas Air Pada Daerah ini adalah $kecTandes'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
              onTap: () {}),
          Marker(
            markerId: const MarkerId('Kecamatan Asemworo'),
            position: const LatLng(-7.2388207, 112.6714753),
            infoWindow: InfoWindow(
                title: 'Kecamatan Asemworo',
                snippet: 'Kualitas Air Pada Daerah ini adalah $kecAsemworo'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
          Marker(
            markerId: const MarkerId('Kecamatan Sukomanunggal'),
            position: const LatLng(-7.2704832, 112.6818934),
            infoWindow: const InfoWindow(
              title: 'Kecamatan Sukomanunggal',
            ),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
          Marker(
              markerId: const MarkerId('Kecamatan Benowo'),
              position: const LatLng(-7.2285631, 112.6115998),
              infoWindow: const InfoWindow(
                title: 'Kecamatan Benowo',
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
              onTap: () {}),
          Marker(
            markerId: const MarkerId('Kecamatan Lakarsantri'),
            position: const LatLng(-7.3226681, 112.6178609),
            infoWindow: const InfoWindow(
              title: 'Kecamatan Lakarsantri',
            ),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
          Marker(
            markerId: const MarkerId('Kecamatan Sambikerep'),
            position: const LatLng(-7.2751222, 112.6377688),
            infoWindow: const InfoWindow(
              title: 'Kecamatan Sambikerep',
            ),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
          Marker(
            markerId: const MarkerId('Kecamatan Pakal'),
            position: const LatLng(-7.2318214, 112.5427117),
            infoWindow: const InfoWindow(
              title: 'Kecamatan Pakal',
            ),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          ),
        },
      ),
    );
  }
}
