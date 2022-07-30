import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectairquality/const/const.dart';
import 'package:projectairquality/services/api_services.dart';
import 'package:projectairquality/services/api_services_news.dart';
import 'package:projectairquality/services/api_temperature.dart';
import 'package:projectairquality/views/air_quality/air_quality.dart';
import 'package:projectairquality/views/authpages.dart/auth_pages.dart';
import 'package:projectairquality/views/berita/berita_pages.dart';
import 'package:projectairquality/views/kelola/kelola.dart';
import 'package:projectairquality/views/laporan/laporan_list.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
  }

  int index = 1;
  bool isBerita = false;
  bool isBeranda = true;
  bool isKelola = false;

  final user = FirebaseAuth.instance.currentUser;

  List<Widget> items = [
    Card(
        shape: roundedrec,
        child: Image.asset(
          'assets/gambar_beranda/1.jpg',
          fit: BoxFit.cover,
        )),
    Card(
        shape: roundedrec,
        child: Image.asset(
          'assets/gambar_beranda/2.jpg',
          fit: BoxFit.cover,
        )),
    Card(
        shape: roundedrec,
        child: Image.asset(
          'assets/gambar_beranda/3.jpg',
          fit: BoxFit.cover,
        )),
    Card(
        shape: roundedrec,
        child: Image.asset(
          'assets/gambar_beranda/4.jpg',
          fit: BoxFit.cover,
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height / 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 0;
                      isBerita = true;
                      isBeranda = false;
                      isKelola = false;
                    });
                  },
                  child: SizedBox(
                    width: Get.width / 3,
                    height: Get.height / 15,
                    child: Card(
                      color: (isBerita == true) ? Colors.amber : Colors.white,
                      shape: roundedrec,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.search),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Berita'),
                        ],
                      )),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 1;
                      isBerita = false;
                      isBeranda = true;
                      isKelola = false;
                    });
                  },
                  child: SizedBox(
                    width: Get.width / 3.5,
                    height: Get.height / 15,
                    child: Card(
                      color: (isBeranda == true) ? Colors.amber : Colors.white,
                      shape: roundedrec,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.home),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Beranda'),
                        ],
                      )),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 2;
                      isBerita = false;
                      isBeranda = false;
                      isKelola = true;
                    });
                  },
                  child: SizedBox(
                    width: Get.width / 3,
                    height: Get.height / 15,
                    child: Card(
                      color: (isKelola == true) ? Colors.amber : Colors.white,
                      shape: roundedrec,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.people),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Kelola'),
                        ],
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          (isBeranda == true && isBerita == false && isKelola == false)
              ? Beranda(items: items)
              : Container(),
          (isBeranda == false && isBerita == false && isKelola == true)
              ? const KelolaPages()
              : Container(),
          (isBeranda == false && isBerita == true && isKelola == false)
              ? const BeritaPages()
              : Container(),
        ],
      ),
    ));
  }
}

class Beranda extends StatelessWidget {
  const Beranda({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 1.25,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height / 4,
              child: CarouselSlider(
                items: items,
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ApiServicesAirQuality().fetchDataTandes();
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Fitur',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: Get.width / 2.2,
                    height: Get.height / 10,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(
                              child: Icon(
                                Icons.warning,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: Get.width / 4,
                            child: Text(
                              'Kerusakan Jalan',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const AirQuality());
                    },
                    child: SizedBox(
                      width: Get.width / 2.2,
                      height: Get.height / 10,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                child: Icon(
                                  Icons.water_drop,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Kualitas Udara',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const AuthPages());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: Get.width / 2.2,
                      height: Get.height / 10,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                child: Icon(
                                  Icons.report,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Laporan',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Berita Populer',
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: Get.width,
              height: Get.height / 4,
              child: FutureBuilder(
                future: GetNewsApi().getNews(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  var articles = snapshot.data.articles;
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                    width: Get.width / 4,
                                    child: Image.network(
                                        articles[index].urlToImage)),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Get.width * 0.6,
                                      child: Text(articles[index].title,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.6,
                                      height: Get.height / 13,
                                      child: Text(articles[index].description,
                                          overflow: TextOverflow.clip,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.normal)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
