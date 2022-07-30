import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectairquality/const/const.dart';
import 'package:projectairquality/views/laporan/laporan_kebakaran.dart';

class LaporanList extends StatefulWidget {
  const LaporanList({Key? key}) : super(key: key);

  @override
  State<LaporanList> createState() => _LaporanListState();
}

class _LaporanListState extends State<LaporanList> {
  //! disini kita mengassign database dengan menyambungkan firebase firestore kedalam aplikasi kita pada line 27
  var db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height / 1.2,
              child: StreamBuilder(
                //! dengan menggunakan stream builder, kita assign variable db tadi kedalam stream
                stream: db.collection('laporan').snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Text('Snapshot ada Error');
                  }
                  //! kita buat variable _data untuk memudahkan penulisan code
                  var _data = snapshot.data!.docs;

                  return ListView.builder(
                      itemCount: _data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: Get.width,
                            height: Get.height / 3,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      child: Image.network(
                                        //! contoh penggunaan variable _data
                                        _data[index].data()['urlPict'] ??
                                            'https://www.freeiconspng.com/thumbs/load-icon-png/loading-icon-3.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      'Nama Pelapor',
                                      style: h1bx,
                                    ),
                                    Text(
                                      _data[index].data()['name'].toString(),
                                      style: h1b,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      _data[index].data()['tempat'].toString(),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(_data[index]
                                        .data()['deskripsi']
                                        .toString()),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
            SizedBox(
              width: Get.width / 1.1,
              height: Get.height / 15,
              child: ElevatedButton(
                  onPressed: () {
                    //! menggunakan navigasi getX untuk menuju ke laporan SUb
                    Get.to(() => const LaporanKebakaranSub());
                  },
                  child: Text(
                    'Submit Laporan',
                    style: h1w,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
