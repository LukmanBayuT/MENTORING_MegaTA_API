import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:place_picker/place_picker.dart';
import 'package:projectairquality/const/const.dart';
import 'package:projectairquality/views/laporan/finished_page.dart';

class LaporanKebakaran extends StatefulWidget {
  const LaporanKebakaran({Key? key}) : super(key: key);

  @override
  State<LaporanKebakaran> createState() => _LaporanKebakaranState();
}

class _LaporanKebakaranState extends State<LaporanKebakaran> {
  bool isLoading = false;

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
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                          decoration: InputDecoration.collapsed(
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
                              goToFinish();
                            },
                            child: (isLoading == true)
                                ? const Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.white),
                                  )
                                : Text(
                                    'Submit',
                                    style: h1b,
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
