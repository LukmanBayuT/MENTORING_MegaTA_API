import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectairquality/model/laporan_model.dart';

class LaporanList extends StatefulWidget {
  const LaporanList({Key? key}) : super(key: key);

  @override
  State<LaporanList> createState() => _LaporanListState();
}

class _LaporanListState extends State<LaporanList> {
  List<LaporanKebakaran> listLaporan = <LaporanKebakaran>[];

  submitLaporan() {
    listLaporan.add(LaporanKebakaran(
      namaTempat: 'harters',
      reason: 'hartete',
      gambar: 'hargee',
    ));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height / 1.3,
              child: ListView.builder(
                itemCount: listLaporan.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Text(listLaporan[index].namaTempat!),
                        Text(listLaporan[index].reason!),
                        Text(listLaporan[index].gambar!)
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: Get.width / 1.1,
              height: Get.height / 15,
              child: ElevatedButton(
                  onPressed: () {
                    submitLaporan();
                  },
                  child: const Text('Submit Laporan')),
            ),
          ],
        ),
      ),
    );
  }
}
