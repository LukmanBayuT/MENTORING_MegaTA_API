import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                  //List Data Olah Disini
                  var _data = snapshot.data!.docs;

                  return ListView.builder(
                      itemCount: _data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: Get.width,
                            height: Get.height / 4,
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
