import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:projectairquality/services/api_services_news.dart';

class BeritaPages extends StatelessWidget {
  const BeritaPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height / 1.3,
      child: FutureBuilder(
        future: GetNewsApi().getNews(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var articles = snapshot.data.articles;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                            width: Get.width / 4,
                            child: Image.network(articles[index].urlToImage)),
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
    );
  }
}
