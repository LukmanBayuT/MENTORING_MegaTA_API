import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AirQuality extends StatefulWidget {
  const AirQuality({Key? key}) : super(key: key);

  @override
  State<AirQuality> createState() => _AirQualityState();
}

class _AirQualityState extends State<AirQuality> {
  final Completer<GoogleMapController> _controller = Completer();
  CameraPosition initialCameraPosition = const CameraPosition(
      zoom: 12, tilt: 20, target: LatLng(-7.2756141, 112.6426429));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Air Quality'),
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
              markerId: const MarkerId('Kecamatan Tandes'),
              position: const LatLng(-7.2570035, 112.6732605),
              infoWindow: const InfoWindow(
                title: 'Kecamatan Tandes',
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
              onTap: () {}),
          Marker(
            markerId: const MarkerId('Kecamatan Asemworo'),
            position: const LatLng(-7.2388207, 112.6714753),
            infoWindow: const InfoWindow(
              title: 'Kecamatan Asemworo',
            ),
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