import 'package:carousel_slider/carousel_slider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:projectairquality/services/secure_storage.dart';

import '../../const/const.dart';
import '../../model/bar_charts_model.dart';
import '../../services/api_services.dart';

class AirQualityDetails extends StatefulWidget {
  AirQualityDetails({
    Key? key,
    required this.ispu,
    required this.alamat,
    required this.lat,
    required this.long,
    required this.co,
    required this.no2,
    required this.o3,
    required this.pm10,
    required this.pm25,
    required this.so2,
  }) : super(key: key);

  String? alamat;
  num? ispu;
  String? lat;
  String? long;
  num? co;
  num? no2;
  num? o3;
  num? pm10;
  num? pm25;
  num? so2;

  @override
  State<AirQualityDetails> createState() => _AirQualityDetailsState();
}

SecureStorage secureStorage = SecureStorage();

List<Widget> item0 = [
  Card(
    child: Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/icons/1.png'),
          SizedBox(
            width: Get.width / 2,
            child: Text(
              'Tingkat kualitas udara yang sangat baik, tidak memberikan efek negatif terhadap manusia, hewan, tumbuhan.',
              style: h2b,
            ),
          ),
        ],
      ),
    ),
  ),
  Card(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            width: Get.width / 1.6,
            child: Text(
              'Apa yang harus dilakukan : ',
              style: h2b,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: SizedBox(
              width: Get.width / 1.6,
              child: Text(
                'Sangat baik melakukan kegiatan di luar ',
                style: h2b,
              ),
            ),
          ),
        ),
      ],
    ),
  ),
];

List<Widget> item1 = [
  Card(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset('assets/icons/2.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            width: Get.width / 2,
            child: Text(
              'Tingkat kualitas udara masih dapat diterima pada kesehatan manusia, hewan dan tumbuhan. ',
              style: h2b,
            ),
          ),
        ),
      ],
    ),
  ),
  Card(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            child: Text(
              'Apa yang harus dilakukan : ',
              style: h2b,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            child: Text(
              'Kelompok sensitif : Kurangi aktivitas fisik yang terlalu lama atau berat. Setiap orang : Masih dapat beraktivitas di luar ',
              style: h2b,
            ),
          ),
        ),
      ],
    ),
  ),
  Card(
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: Get.width / 1.6,
        child: Center(
          child: Text(
            'Setiap orang : Masih dapat beraktivitas di luar',
            style: h2b,
          ),
        ),
      ),
    ),
  ),
];

List<Widget> item2 = [
  Card(
    child: Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/icons/3.png'),
          SizedBox(
            width: Get.width / 2,
            child: Text(
              'Tingkat kualitas udara yang bersifat merugikan pada manusia, hewan dan tumbuhan. ',
              style: h2b,
            ),
          ),
        ],
      ),
    ),
  ),
  Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            child: Text(
              'Apa yang harus dilakukan : ',
              style: h2b,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            child: Text(
              'Kelompok sensitif : Boleh melakukan aktivitas di luar, tetapi mengambil rehat lebih sering dan melakukan aktivitas ringan. Amati gejala berupa batuk atau nafas sesak.',
              style: h2b,
            ),
          ),
        ),
      ],
    ),
  ),
  Card(
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Center(
        child: SizedBox(
          child: Text(
            'Penderita Asma : harus mengikuti petunjuk kesehatan untuk asma dan menyimpan obat asma. Penderita Penyakit Jantung : gejala seperti palpitasi/jantung berdetak lebih cepat, sesak nafas, atau kelelahan yang tidak biasa mungkin mengindikasikan masalah serius.',
            style: h2b,
          ),
        ),
      ),
    ),
  ),
  Card(
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Center(
        child: SizedBox(
          width: Get.width / 1.6,
          child: Text(
            'Setiap orang : Mengurangi aktivitas fisik yang terlalu lama di luar ruangan.',
            style: h2b,
          ),
        ),
      ),
    ),
  ),
];

List<Widget> item3 = [
  Card(
    child: Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/icons/4.png'),
          SizedBox(
            width: Get.width / 2,
            child: Text(
              'Tingkat kualitas udara yang dapat meningkatkan resiko kesehatan pada sejumlah segmen populasi yang terpapar. ',
              style: h2b,
            ),
          ),
        ],
      ),
    ),
  ),
  Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            child: Text(
              'Apa yang harus dilakukan : ',
              style: h2b,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            child: Text(
              'Kelompok sensitif : Hindari semua aktivitas di luar. Perbanyak aktivitas di dalam ruangan atau lakukan penjadwalan ulang pada waktu dengan kualitas udara yang baik.',
              style: h2b,
            ),
          ),
        ),
      ],
    ),
  ),
  Card(
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Center(
        child: SizedBox(
          child: Text(
            'Setiap orang : Hindari aktivitas fisik yang terlalu lama di luar ruangan, pertimbangkan untuk melakukan aktivitas di dalam ruangan. ',
            style: h2b,
          ),
        ),
      ),
    ),
  ),
];

List<Widget> item4 = [
  Card(
    child: Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/icons/5.png'),
          SizedBox(
            width: Get.width / 2,
            child: Text(
              'Tingkat kualitas udara yang dapat merugikan kesehatan serius pada populasi dan perlu penanganan cepat. ',
              style: h2b,
            ),
          ),
        ],
      ),
    ),
  ),
  Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            child: Text(
              'Apa yang harus dilakukan : ',
              style: h2b,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            child: Text(
              'Kelompok sensitif : Tetap di dalam ruangan dan hanya melakukan sedikit aktivitas',
              style: h2b,
            ),
          ),
        ),
      ],
    ),
  ),
  Card(
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Center(
        child: SizedBox(
          child: Text(
            'Setiap orang : Hindari semua aktivitas di luar ',
            style: h2b,
          ),
        ),
      ),
    ),
  ),
];

bool isKeterangan = true;

class _AirQualityDetailsState extends State<AirQualityDetails> {
  Flexible control0(BuildContext context) {
    return Flexible(
        flex: 2,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Sehat',
                style: h1w,
              ),
              Text(
                widget.ispu.toString(),
                style: h1w,
              ),
              Text(
                'ISPU',
                style: h1w,
              )
            ],
          ),
        ));
  }

  Flexible control1(BuildContext context) {
    return Flexible(
        flex: 2,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Sedang',
                style: h1w,
              ),
              Text(
                widget.ispu.toString(),
                style: h1w,
              ),
              Text(
                'ISPU',
                style: h1w,
              )
            ],
          ),
        ));
  }

  Flexible control2(BuildContext context) {
    return Flexible(
        flex: 2,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Tidak Sehat',
                style: h1w,
              ),
              Text(
                widget.ispu.toString(),
                style: h1w,
              ),
              Text(
                'ISPU',
                style: h1w,
              )
            ],
          ),
        ));
  }

  Flexible control3(BuildContext context) {
    return Flexible(
        flex: 2,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Sangat Tidak Sehat',
                style: h1w,
              ),
              Text(
                widget.ispu.toString(),
                style: h1w,
              ),
              Text(
                'ISPU',
                style: h1w,
              )
            ],
          ),
        ));
  }

  Flexible control4(BuildContext context) {
    return Flexible(
        flex: 2,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Berbahaya',
                style: h1w.copyWith(color: Colors.red),
              ),
              Text(
                widget.ispu.toString(),
                style: h1w,
              ),
              Text(
                'ISPU',
                style: h1w.copyWith(color: Colors.red),
              )
            ],
          ),
        ));
  }

  int? pm25;
  int? pm10;
  int? no2;
  int? so2;
  int? co;
  int? o3;

  setData() async {
    setState(() {
      pm25 = widget.pm25!.toInt();
      pm10 = widget.pm10!.toInt();
      no2 = widget.no2!.toInt();
      so2 = widget.so2!.toInt();
      co = widget.co!.toInt();
      o3 = widget.o3!.toInt();
    });
  }

  @override
  void initState() {
    super.initState();
    implementData();
    ApiServicesAirQuality().fetchDataAll(widget.lat!, widget.long!);
    setData();
  }

  String? tempIni;
  String? windIni;
  String? humIni;

  implementData() async {
    setState(() async {
      tempIni = await secureStorage.readSecureData('temp');
      windIni = await secureStorage.readSecureData('wind');
      humIni = await secureStorage.readSecureData('hum');
    });
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            widget.alamat.toString(),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  isKeterangan = !isKeterangan;
                  setState(() {});
                },
                icon: const Icon(
                  Icons.info_outline_rounded,
                  color: Colors.amber,
                )),
          ],
        ),
        body: (isKeterangan)
            ? SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height),
                  child: Column(
                    children: [
                      (widget.ispu! <= 50) ? control0(context) : Container(),
                      (widget.ispu! >= 51 && widget.ispu! < 100)
                          ? control1(context)
                          : Container(),
                      (widget.ispu! > 100 && widget.ispu! < 200)
                          ? control2(context)
                          : Container(),
                      (widget.ispu! > 201 && widget.ispu! < 300)
                          ? control3(context)
                          : Container(),
                      (widget.ispu! >= 301) ? control4(context) : Container(),
                      (widget.ispu! <= 50) ? const EfekWidget1() : Container(),
                      (widget.ispu! >= 51 && widget.ispu! < 100)
                          ? const EfekWidget2()
                          : Container(),
                      (widget.ispu! > 100 && widget.ispu! < 200)
                          ? const EfekWidget3()
                          : Container(),
                      (widget.ispu! > 201 && widget.ispu! < 300)
                          ? const EfekWidget4()
                          : Container(),
                      (widget.ispu! >= 301) ? const EfekWidget5() : Container(),
                      SizedBox(
                        height: Get.height / 8,
                        child: CarouselSlider(
                          items: item0,
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 4.0,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 8,
                        child: CarouselSlider(
                          items: item1,
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 4.0,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 8,
                        child: CarouselSlider(
                          items: item2,
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 4.0,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 8,
                        child: CarouselSlider(
                          items: item3,
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 4.0,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 8,
                        child: CarouselSlider(
                          items: item4,
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 4.0,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
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
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        (widget.ispu! <= 50)
                                            ? SizedBox(
                                                width: Get.width / 3,
                                                height: Get.height / 8,
                                                child: Card(
                                                  child: Center(
                                                    child: Image.asset(
                                                        'assets/icons/1.png'),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        (widget.ispu! >= 51 &&
                                                widget.ispu! < 100)
                                            ? SizedBox(
                                                width: Get.width / 3,
                                                height: Get.height / 8,
                                                child: Card(
                                                  child: Center(
                                                    child: Image.asset(
                                                        'assets/icons/2.png'),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        (widget.ispu! > 100 &&
                                                widget.ispu! < 200)
                                            ? SizedBox(
                                                width: Get.width / 3,
                                                height: Get.height / 8,
                                                child: Card(
                                                  child: Center(
                                                    child: Image.asset(
                                                        'assets/icons/3.png'),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        (widget.ispu! > 201 &&
                                                widget.ispu! < 300)
                                            ? SizedBox(
                                                width: Get.width / 3,
                                                height: Get.height / 8,
                                                child: Card(
                                                  child: Center(
                                                    child: Image.asset(
                                                        'assets/icons/4.png'),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        (widget.ispu! >= 301)
                                            ? SizedBox(
                                                width: Get.width / 3,
                                                height: Get.height / 8,
                                                child: Card(
                                                  child: Center(
                                                    child: Image.asset(
                                                        'assets/icons/5.png'),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        Text(
                                          "Kualitas Udara saat ini",
                                          textAlign: TextAlign.center,
                                          style: h1bx,
                                        ),
                                        Text(
                                          widget.ispu.toString(),
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
                                          'Surabaya',
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
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  '28',
                                                  style: h1w,
                                                ),
                                                Container(
                                                  width: Get.width / 100,
                                                  height: Get.height / 10,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  '\u2103',
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/icons/udara.png'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: Get.width / 4,
                                        child: Text(
                                          'Kelembaban',
                                          style: h1b.copyWith(fontSize: 15),
                                        ),
                                      ),
                                      Text('100'),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                width: 3,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/icons/lembab.png'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: Get.width / 4,
                                        child: Text(
                                          'Udara',
                                          style: h1b.copyWith(fontSize: 15),
                                        ),
                                      ),
                                      Text('3.8'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
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
              ));
  }
}

class EfekWidget1 extends StatelessWidget {
  const EfekWidget1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            shape: roundedrec,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Efek Bagi Kesehatan',
                    style: h1b,
                  ),
                  Text(
                    'Kualitas Udara saat ini sangat baik, tidak berdampak negatif pada manusia, hewan, dan tumbuhan',
                    style: h2b,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class EfekWidget2 extends StatelessWidget {
  const EfekWidget2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            shape: roundedrec,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Efek Bagi Kesehatan',
                    style: h1b,
                  ),
                  Text(
                    'Kualitas Udara saat ini masih bisa diterima pada kesehatan manusia, hewan, dan tumbuhan',
                    style: h2b,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class EfekWidget3 extends StatelessWidget {
  const EfekWidget3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            shape: roundedrec,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Efek Bagi Kesehatan',
                    style: h1b,
                  ),
                  Text(
                    'kualitas udara saat ini bersifat merugikan manusia, hewan, dan tumbuhan',
                    style: h2b,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class EfekWidget4 extends StatelessWidget {
  const EfekWidget4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            shape: roundedrec,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Efek Bagi Kesehatan',
                    style: h1b,
                  ),
                  Text(
                    'kualitas udara saat ini dapat meningkatkan resiko kesehatan pada sejumlah segmen populasi yang terpapar',
                    style: h2b,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class EfekWidget5 extends StatelessWidget {
  const EfekWidget5({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            shape: roundedrec,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Efek Bagi Kesehatan',
                    style: h1b,
                  ),
                  Text(
                    'kualitas udara saat ini dapat merugikan kesehatan serius pada populasi dan perlu penanganan cepat.',
                    style: h2b,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
