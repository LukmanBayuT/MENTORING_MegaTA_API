import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectairquality/services/api_services_news.dart';
import 'package:url_launcher/url_launcher.dart';

class BeritaPages extends StatelessWidget {
  const BeritaPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height / 1.18,
      child: FutureBuilder(
        future: GetNewsApi().getRealNews(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.articles.length,
              itemBuilder: (BuildContext context, int index) {
                var articles = snapshot.data.articles[index];
                return GestureDetector(
                  onTap: () {
                    urlLauncher(articles.link);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: Get.width / 4,
                              child: Image.network(articles.media)),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width * 0.6,
                                child: Text(articles.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                width: Get.width * 0.6,
                                height: Get.height / 13,
                                child: Text(articles.summary,
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          )
                        ],
                      ),
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

  Future<void> urlLauncher(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}
