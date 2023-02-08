import 'dart:convert';

import 'package:flutter_webtoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev/';
  final String today = 'today';

  Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse('$baseUrl$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<WebtoonModel> webtoonInstances = [];
      final List<dynamic> webToons = jsonDecode(response.body);
      for (var webtoon in webToons) {
        print(WebtoonModel.fromJson(webtoon));
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
