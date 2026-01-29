import 'verse_model.dart';

class SurahModel {
  final int id;
  final String name;
  final String transliteration;
  final String type; // meccan / medinan
  final int totalVerses;
  final List<VerseModel> verses;

  const SurahModel({
    required this.id,
    required this.name,
    required this.transliteration,
    required this.type,
    required this.totalVerses,
    required this.verses,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      id: json['id'],
      name: json['name'],
      transliteration: json['transliteration'],
      type: json['type'],
      totalVerses: json['total_verses'],
      verses: (json['verses'] as List)
          .map((e) => VerseModel.fromJson(e))
          .toList(),
    );
  }
}
