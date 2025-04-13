import 'dart:convert';
import 'package:http/http.dart' as http;

import '../MVVM/api_responce_model/surah_model.dart';

class HttpService {
  static const String _baseUrl = 'https://quranapi.pages.dev/api/surah.json';

  Future<List<SurahModel>> fetchSurahList() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      // Proper UTF-8 decoding to fix Arabic rendering
      final decodedBody = utf8.decode(response.bodyBytes);
      final List<dynamic> jsonList = json.decode(decodedBody);
      return jsonList.map((e) => SurahModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load surah list');
    }
  }
}
