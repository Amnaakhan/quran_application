import 'package:get/get.dart';

import '../../repository/surah_repository.dart';
import '../api_responce_model/surah_model.dart';

class SurahViewModel extends GetxController {
  final SurahRepository _repository = SurahRepository();

  var surahList = <SurahModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchSurahs();
    super.onInit();
  }

  void fetchSurahs() async {
    try {
      isLoading(true);
      final data = await _repository.getSurahs();
      surahList.value = data;
    } catch (e) {
      print('Error fetching surahs: $e');
    } finally {
      isLoading(false);
    }
  }
}
