import 'package:sakina/features/Quran/models/surah_model.dart';

abstract class QuranState {}

class QuranInitial extends QuranState {}

class QuranLoading extends QuranState {}

class QuranLoaded extends QuranState {
  final List<SurahModel> allSurahs;
  final List<SurahModel> filteredSurahs;

  QuranLoaded({required this.allSurahs, required this.filteredSurahs});
}

class QuranError extends QuranState {
  final String message;
  QuranError(this.message);
}
