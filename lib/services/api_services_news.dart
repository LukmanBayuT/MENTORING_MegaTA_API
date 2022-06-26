import 'package:http/http.dart' as http;
import 'package:projectairquality/model/api_model_news.dart';

class GetNewsApi {
  Future<NewsApi> getNews() async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)'
    };
    var url = Uri.parse(
        'https://newsapi.org/v2/everything?q=air&from=2022-05-26&sortBy=publishedAt&apiKey=75a62202a3c44ec187bc490e32db874c');

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
}
