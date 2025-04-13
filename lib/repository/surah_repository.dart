
import '../MVVM/api_responce_model/surah_model.dart';
import '../Services/htttp_service.dart';

class SurahRepository {
  final HttpService _httpService = HttpService();

  Future<List<SurahModel>> getSurahs() => _httpService.fetchSurahList();
}
