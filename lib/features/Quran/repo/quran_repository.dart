import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/surah_model.dart';

class QuranRepository {
  Future<List<SurahModel>> loadSurahs() async {
    final String response = await rootBundle.loadString(
      'assets/data/quran.json',
    );

    final List<dynamic> data = json.decode(response);

    return data.map((e) => SurahModel.fromJson(e)).toList();
  }
}
