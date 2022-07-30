import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projectairquality/model/api_model_news.dart';
import 'package:projectairquality/model/news_model.dart';

class GetNewsApi {
  Future<NewsApi> getNews() async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)'
    };
    var url = Uri.parse(
        'https://newsapi.org/v2/everything?q=air&sortBy=publishedAt&apiKey=75a62202a3c44ec187bc490e32db874c');

    var req = http.Request('GET', url);
    req.headers.addAll(headersList);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      print(resBody);
    } else {
      print(res.reasonPhrase);
    }
    return newsApiFromJson(resBody);
  }

  Future<NewsModels> getRealNews() async {
    var headers = {
      'X-RapidAPI-Key': '3a416c2ceamshbf5ffb8d1964617p1fe44ajsn9ad309dab626',
      'X-RapidAPI-Host': 'newscatcher.p.rapidapi.com',
      'useQueryString': 'true'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://newscatcher.p.rapidapi.com/v1/search_enterprise?q=Air Quality&lang=id&sort_by=relevancy&page=1&media=true'));
    request.bodyFields = {};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var news = await response.stream.bytesToString();
    var decode = jsonDecode(news);

    if (response.statusCode == 200) {
      print(decode);
    } else {
      print(response.reasonPhrase);
    }
    return newsModelsFromJson(news);
  }
}
