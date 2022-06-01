import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectairquality/const/const.dart';
import 'package:projectairquality/views/main_menu.dart';

class FinishedPage extends StatefulWidget {
  const FinishedPage({Key? key}) : super(key: key);

  @override
  State<FinishedPage> createState() => _FinishedPageState();
}

class _FinishedPageState extends State<FinishedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Flexible(
              flex: 2,
              child: Center(
                child: Icon(
                  Icons.check_circle_rounded,
                  size: 150,
                  color: Colors.amber,
                ),
              )),
          Flexible(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Laporan Berhasil',
                style: h1b,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Terimakasih Telah Melapor!',
                style: h2b,
              ),
            ],
          )),
          Flexible(
              child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 15,
            child: ElevatedButton(
              onPressed: () {
                Get.offAll(() => const MainMenu());
              },
              child: Text(
                'Kembali Ke Halaman Awal',
                style: h1w.copyWith(fontSize: 18),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
