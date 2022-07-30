import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  //! mengassign firebase storage, yang akan digunakan sebagai penampung / wadah dari picture yang akan kita upload kedalam firebase
  FirebaseStorage storage = FirebaseStorage.instance;
  //! menggunakan package PlatformFIle untuk mengambil gambar dari storage dan uploadTask
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  bool isLoading = false;
  bool isUploaded = false;

  final deskripsi = TextEditingController();
  final laporCont = TextEditingController();

  String? alamat;
  String? namaTempat;
  String? urlPict;

  // void _getFromCam1() async {
  //   XFile? pickedFile1 = await ImagePicker().pickImage(
  //     source: ImageSource.camera,
  //     maxHeight: 1080,
  //     maxWidth: 1080,
  //   );
  //   if (mounted) {
  //     setState(() {
  //       if (pickedFile1 != null) {
  //         image1 = File(pickedFile1.path);
  //       } else {
  //         null;
  //       }
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lapor'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
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
                      pickedFile != null
                          ? GestureDetector(
                              onTap: selectFile,
                              child: Card(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    height:
                                        MediaQuery.of(context).size.height / 8,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.file(File(pickedFile!.path!),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: selectFile,
                              child: Card(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  child: const Center(
                                    child: Icon(
                                      Icons.photo_camera_front_sharp,
                                      size: 60,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      // buildProgress(),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width / 1.1,
                      //   height: MediaQuery.of(context).size.height / 20,
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       uploadFile();

                      //       setState(() {
                      //         isUploaded = true;
                      //       });
                      //     },
                      //     child: Text(
                      //       'Upload',
                      //       style: h1w,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                              width: MediaQuery.of(context).size.width / 1.1,
                              height: MediaQuery.of(context).size.height / 15,
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
                                      width: MediaQuery.of(context).size.width /
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
                                            overflow: TextOverflow.ellipsis,
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
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: MediaQuery.of(context).size.height / 6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                  controller: deskripsi,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: 'Deskripsikan Situasimu')),
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
                        uploadFile();
                      },
                      child: isUploaded
                          ? Text(
                              'Submit',
                              style: h1w,
                            )
                          : Text(
                              'Upload Dulu',
                              style: h1w,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //! membuat widget dan fungsi untuk mempermudah pengerjaan aplikasi line 292 - 394

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
        stream: uploadTask?.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            double progress = data.bytesTransferred / data.totalBytes;
            return SizedBox(
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                  ),
                  Center(
                    child: Text(
                      '${(100 * progress).roundToDouble()}%',
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox(
              height: 50,
            );
          }
        },
      );

  Future createLaporan(String name, deskripsi, namaTempat, alamat, url) async {
    final docLaporan = FirebaseFirestore.instance.collection('laporan').doc();
    final json = {
      'name': name,
      'tempat': namaTempat,
      'alamat': alamat,
      'deskripsi': deskripsi,
      'urlPict': url,
    };

    await docLaporan.set(json);
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(
      file,
      SettableMetadata(
        customMetadata: {
          'name': laporCont.text,
          'desc': deskripsi.text,
          'address': namaTempat!,
          'address2': alamat!,
        },
      ),
    );

    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload =
        await snapshot.ref.getDownloadURL().then((value) => urlPict = value);
    urlPict = urlDownload;
    setState(() {});
    debugPrint('download Link : $urlDownload');
    debugPrint(urlPict);

    createLaporan(
      laporCont.text,
      deskripsi.text,
      namaTempat,
      alamat,
      urlDownload,
    );
    goToFinish();
  }

//! fungsi package show place picker adalah untuk mengambil posisi kita di bumi ini, dengan menggunakan key google API yang bisa dilihat di line 379
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
