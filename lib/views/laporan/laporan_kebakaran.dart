import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:place_picker/place_picker.dart';
import 'package:projectairquality/const/const.dart';
import 'package:projectairquality/views/laporan/finished_page.dart';

class LaporanKebakaranSub extends StatefulWidget {
  const LaporanKebakaranSub({Key? key}) : super(key: key);

  @override
  State<LaporanKebakaranSub> createState() => _LaporanKebakaranSubState();
}

class _LaporanKebakaranSubState extends State<LaporanKebakaranSub> {
  bool isLoading = false;

  final deskripsi = TextEditingController();
  final laporCont = TextEditingController();

  String? alamat;
  String? namaTempat;
  File? image1;

  void _getFromCam1() async {
    XFile? pickedFile1 = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    if (mounted) {
      setState(() {
        if (pickedFile1 != null) {
          image1 = File(pickedFile1.path);
        } else {
          null;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lapor'),
          backgroundColor: Colors.white,
        ),
        body: (isLoading == false)
            ? SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Foto Kebakaran',
                                  style: h1b,
                                ),
                                image1 != null
                                    ? GestureDetector(
                                        onTap: _getFromCam1,
                                        child: Card(
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.1,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  8,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.file(image1!,
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: _getFromCam1,
                                        child: Card(
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.1,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            child: const Center(
                                              child: Icon(
                                                Icons.photo_camera_front_sharp,
                                                size: 60,
                                                color: Colors.amber,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                              ],
                            )),
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Nama Pelapor',
                                  style: h1b,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: laporCont,
                                  decoration: InputDecoration(
                                      // labelText: 'Nama Pelapor',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1, color: Colors.red),
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lokasi',
                                  style: h1b,
                                ),
                                GestureDetector(
                                  onTap: showPlacePicker,
                                  child: Card(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.1,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              15,
                                      child: Center(
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            const Icon(
                                              Icons.gps_fixed,
                                              size: 20,
                                              color: Colors.amber,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    namaTempat ?? 'Nama Tempat',
                                                    style: h2b,
                                                  ),
                                                  Text(
                                                    alamat ?? 'Alamat',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deskripsi',
                                  style: h1b,
                                ),
                                Card(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                          controller: deskripsi,
                                          decoration: const InputDecoration
                                                  .collapsed(
                                              hintText:
                                                  'Deskripsikan Situasimu')),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        Flexible(
                            child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: MediaQuery.of(context).size.height / 15,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isLoading = true;
                              });
                              createLaporan(
                                laporCont.text,
                                deskripsi.text,
                                namaTempat,
                                alamat,
                              ).then((value) => Timer(
                                  const Duration(seconds: 1), goToFinish));
                            },
                            child: (isLoading == true)
                                ? const Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.white),
                                  )
                                : Text(
                                    'Submit',
                                    style: h1w,
                                  ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              ));
  }

  Future createLaporan(String name, deskripsi, namaTempat, alamat) async {
    final docLaporan = FirebaseFirestore.instance.collection('laporan').doc();
    final json = {
      'name': name,
      'tempat': namaTempat,
      'alamat': alamat,
      'deskripsi': deskripsi,
    };

    await docLaporan.set(json);
  }

  void showPlacePicker() async {
    LocationResult? result = await Get.to(() => PlacePicker(
          "AIzaSyA1MgLuZuyqR_OGY3ob3M52N46TDBRI_9k",
        ));
    if (result != null) {
      setState(() {
        alamat = result.formattedAddress;
        namaTempat = result.name;
      });
    } else {
      setState(() {
        alamat = alamat;
        namaTempat = namaTempat;
      });
    }
  }

  void goToFinish() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Get.to(() => const FinishedPage()));
    setState(() {
      isLoading = false;
    });
  }
}
