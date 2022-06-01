import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:projectairquality/const/const.dart';

class AirQualityDetails extends StatefulWidget {
  AirQualityDetails({Key? key, required this.ispu, required this.alamat})
      : super(key: key);

  num? ispu;
  String? alamat;

  @override
  State<AirQualityDetails> createState() => _AirQualityDetailsState();
}

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
              Flexible(
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
                              'Kelompok orang secara umum akan mulai mengalami dampak terdahadap kesehatannya, kelompok orang yang sensitif kemungkinan akan mengalami dampak kesehatan yang lebih serius.',
                              style: h2b,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/icons/1.png'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 8,
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Text(
                              'Tingkat kualitas udara yang sangat baik, tidak memberikan efek negatif terhadap manusia, hewan, tumbuhan.',
                              style: h2b,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/icons/2.png'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 8,
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Text(
                              'Tingkat kualitas udara masih dapat diterima pada kesehatan manusia, hewan dan tumbuhan. ',
                              style: h2b,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/icons/3.png'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 8,
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Text(
                              'Tingkat kualitas udara yang bersifat merugikan pada manusia, hewan dan tumbuhan. ',
                              style: h2b,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/icons/4.png'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 8,
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Text(
                              'Tingkat kualitas udara yang dapat meningkatkan resiko kesehatan pada sejumlah segmen populasi yang terpapar. ',
                              style: h2b,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/icons/5.png'),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 8,
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Text(
                              'Tingkat kualitas udara yang dapat merugikan kesehatan serius pada populasi dan perlu penanganan cepat. ',
                              style: h2b,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
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
