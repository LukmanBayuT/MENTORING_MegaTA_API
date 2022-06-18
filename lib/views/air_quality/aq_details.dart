import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectairquality/const/const.dart';

class AirQualityDetails extends StatefulWidget {
  AirQualityDetails({Key? key, required this.ispu, required this.alamat})
      : super(key: key);

  num? ispu;
  String? alamat;

  @override
  State<AirQualityDetails> createState() => _AirQualityDetailsState();
}

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

class _AirQualityDetailsState extends State<AirQualityDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.alamat.toString(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
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
      ),
    );
  }

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
                style: h1,
              ),
              Text(
                widget.ispu.toString(),
                style: h1w,
              ),
              Text(
                'ISPU',
                style: h1,
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
                style: h1,
              ),
              Text(
                widget.ispu.toString(),
                style: h1w,
              ),
              Text(
                'ISPU',
                style: h1,
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
                style: h1,
              ),
              Text(
                widget.ispu.toString(),
                style: h1w,
              ),
              Text(
                'ISPU',
                style: h1,
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
                style: h1,
              ),
              Text(
                widget.ispu.toString(),
                style: h1w,
              ),
              Text(
                'ISPU',
                style: h1,
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
                style: h1,
              ),
              Text(
                widget.ispu.toString(),
                style: h1w,
              ),
              Text(
                'ISPU',
                style: h1,
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
