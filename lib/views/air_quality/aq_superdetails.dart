import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:projectairquality/const/const.dart';
import 'package:projectairquality/model/bar_charts_model.dart';
import 'package:projectairquality/services/api_services.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:projectairquality/services/secure_storage.dart';

class AqSuperDetails extends StatefulWidget {
  String? lat;
  String? long;
  AqSuperDetails({
    Key? key,
    required this.lat,
    required this.long,
  }) : super(key: key);

  @override
  State<AqSuperDetails> createState() => _AqSuperDetailsState();
}

class _AqSuperDetailsState extends State<AqSuperDetails> {
  SecureStorage secureStorage = SecureStorage();
  int? pm25;
  int? pm10;
  int? no2;
  int? so2;
  int? co;
  int? o3;
  getData() async {
    pm25 = int.parse(await secureStorage.readSecureData('pm25'));
    pm10 = int.parse(await secureStorage.readSecureData('pm10'));
    no2 = int.parse(await secureStorage.readSecureData('no2'));
    so2 = int.parse(await secureStorage.readSecureData('so2'));
    co = int.parse(await secureStorage.readSecureData('co'));
    o3 = int.parse(await secureStorage.readSecureData('o3'));
  }

  @override
  void initState() {
    super.initState();
    ApiServicesAirQuality().fetchDataAll(widget.lat!, widget.long!);
    getData();
  }

  @override
  Widget build(BuildContext context) {
    List<BarCharts> data = [
      BarCharts(
        jenis: 'PM 25',
        angka: pm25,
        color: charts.ColorUtil.fromDartColor(Colors.amber),
      ),
      BarCharts(
        jenis: 'PM 10',
        angka: pm10,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      BarCharts(
        jenis: 'NO2',
        angka: no2,
        color: charts.ColorUtil.fromDartColor(Colors.greenAccent),
      ),
      BarCharts(
        jenis: 'SO2',
        angka: so2,
        color: charts.ColorUtil.fromDartColor(Colors.orangeAccent),
      ),
      BarCharts(
        jenis: 'CO',
        angka: co,
        color: charts.ColorUtil.fromDartColor(Colors.redAccent),
      ),
      BarCharts(
        jenis: 'O3',
        angka: o3,
        color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
      ),
    ];
    List<charts.Series<BarCharts, String>> series = [
      charts.Series(
        id: 'Financial',
        data: data,
        domainFn: (BarCharts series, _) => series.jenis!,
        measureFn: (BarCharts series, _) => series.angka,
        colorFn: (BarCharts series, _) => series.color!,
      )
    ];
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n d MMM').format(now);
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 2)),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              color: Colors.grey[200],
              child: FutureBuilder(
                future: ApiServicesAirQuality()
                    .fetchDataAll(widget.lat!, widget.long!),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  var details = snapshot.data;
                  var detailsData = details.data[0];
                  if (snapshot.data != null) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: Get.width,
                              height: Get.height / 3,
                              child: Card(
                                shape: roundedrec,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: Get.width / 2.5,
                                          height: Get.height / 4,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: Get.width / 3,
                                                height: Get.height / 8,
                                                child: const Card(
                                                  color: Colors.amber,
                                                ),
                                              ),
                                              Text(
                                                "Kualitas Udara saat ini",
                                                textAlign: TextAlign.center,
                                                style: h1bx,
                                              ),
                                              Text(
                                                detailsData.aqi.toString(),
                                                textAlign: TextAlign.center,
                                                style: h1b,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width / 2.5,
                                          height: Get.height / 3.5,
                                          child: Column(
                                            children: [
                                              Text(
                                                formattedDate,
                                                textAlign: TextAlign.center,
                                                style: h1bx,
                                              ),
                                              Text(
                                                details.cityName,
                                                textAlign: TextAlign.center,
                                                style: h1b,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              SizedBox(
                                                width: Get.width / 2.5,
                                                height: Get.height / 8,
                                                child: Card(
                                                  color: Colors.greenAccent,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        detailsData.co
                                                            .toString()
                                                            .substring(0, 2),
                                                        style: h1w,
                                                      ),
                                                      Container(
                                                        width: Get.width / 100,
                                                        height: Get.height / 10,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        'CO',
                                                        style: h1w,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 1.1,
                            height: Get.height / 13,
                            child: Card(
                              shape: roundedrec,
                              child: Row(
                                children: const [],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 1.1,
                            height: Get.height / 2.5,
                            child: Card(
                                color: unguKeren,
                                shape: roundedrec,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: charts.BarChart(
                                    series,
                                    animate: true,
                                  ),
                                )),
                          )
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
