import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina/features/Quran/repo/quran_repository.dart';

import 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  final QuranRepository repo;

  QuranCubit(this.repo) : super(QuranInitial());

  Future<void> loadSurahs() async {
    emit(QuranLoading());
    try {
      final surahs = await repo.loadSurahs();
      emit(QuranLoaded(allSurahs: surahs, filteredSurahs: surahs));
    } catch (e) {
      emit(QuranError('فشل تحميل السور'));
    }
  }

  void search(String query) {
    final current = state;
    if (current is! QuranLoaded) return;

    final q = query.trim();

    if (q.isEmpty) {
      emit(
        QuranLoaded(
          allSurahs: current.allSurahs,
          filteredSurahs: current.allSurahs,
        ),
      );
      return;
    }

    final filtered = current.allSurahs.where((surah) {
      return surah.name.contains(q) ||
          surah.transliteration.toLowerCase().contains(q.toLowerCase()) ||
          surah.id.toString() == q;
    }).toList();

    emit(QuranLoaded(allSurahs: current.allSurahs, filteredSurahs: filtered));
  }
}
