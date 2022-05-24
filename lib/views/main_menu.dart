import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectairquality/views/air_quality/air_quality.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'EMSIT',
          ),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Berita',
              icon: Icon(Icons.search),
            ),
            Tab(
              text: 'Beranda',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Kelola',
              icon: Icon(Icons.group),
            ),
          ]),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/halfrect.png'),
                        fit: BoxFit.fill)),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 4,
                    child: Image.asset('assets/card.png'),
                    // child: Card(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20)),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Column(
                    //       children: [
                    //         Text(
                    //           'Selamat Datang',
                    //           style: GoogleFonts.poppins(
                    //               fontSize: 30,
                    //               fontWeight: FontWeight.w700,
                    //               color: Colors.amber),
                    //         ),
                    //         Text('Jumat, 11 Maret 2022',
                    //             style: GoogleFonts.poppins(
                    //                 fontSize: 16,
                    //                 fontWeight: FontWeight.w400,
                    //                 color: Colors.black))
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Fitur',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
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
                            Text(
                              'Kerusakan Jalan',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
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
                        width: MediaQuery.of(context).size.width / 2.2,
                        height: MediaQuery.of(context).size.height / 8,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
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
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Berita Populer',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset('assets/exnews.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Berita Title',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold)),
                            Text('Berita Description',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal)),
                            Text('Berita Tanggal',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset('assets/exnews.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Berita Title',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold)),
                            Text('Berita Description',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal)),
                            Text('Berita Tanggal',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset('assets/exnews.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Berita Title',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold)),
                            Text('Berita Description',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal)),
                            Text('Berita Tanggal',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.normal)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
