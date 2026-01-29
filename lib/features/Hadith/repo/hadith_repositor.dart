import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/hadith_model.dart';
import '../models/hadith_chapter_model.dart';

class HadithRepository {
  Future<List<HadithChapterModel>> loadChapters() async {
    final data = await rootBundle.loadString('assets/data/bukhari.json');

    final decoded = json.decode(data);
    final List chapters = decoded['chapters'];

    return chapters.map((e) => HadithChapterModel.fromJson(e)).toList();
  }

  Future<List<HadithModel>> loadHadiths(int chapterId) async {
    final data = await rootBundle.loadString('assets/data/bukhari.json');

    final decoded = json.decode(data);
    final List hadiths = decoded['hadiths'];

    return hadiths
        .where((h) => h['chapterId'] == chapterId)
        .map((e) => HadithModel.fromJson(e))
        .toList();
  }
}
