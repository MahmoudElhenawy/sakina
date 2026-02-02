import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sakina/features/Adhkar/models/adhkar_model.dart';

class AzkarRepository {
  Future<List<AzkarModel>> getAllAzkar() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/azkar.json',
      );
      final data = json.decode(response);

      final List<dynamic> rows = data['rows'];

      return rows.map((row) {
        return AzkarModel.fromJson({
          'category': row[0],
          'zekr': row[1],
          'description': row[2],
          'count': row[3] is int
              ? row[3]
              : int.tryParse(row[3].toString()) ?? 1,
          'reference': row[4],
        });
      }).toList();
    } catch (e) {
      throw Exception('فشل تحميل الأذكار: $e');
    }
  }

  Future<List<AzkarModel>> getAzkarByCategory(String category) async {
    final allAzkar = await getAllAzkar();
    return allAzkar.where((azkar) => azkar.category == category).toList();
  }

  Future<List<String>> getCategories() async {
    final allAzkar = await getAllAzkar();
    final categories = allAzkar.map((e) => e.category).toSet().toList();
    return categories;
  }
}
