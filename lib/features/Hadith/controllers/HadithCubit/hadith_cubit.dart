import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'hadith_state.dart';
import '../../models/hadith_chapter_model.dart';
import '../../repo/hadith_repositor.dart';

class HadithCubit extends Cubit<HadithState> {
  final HadithRepository repo;

  HadithCubit(this.repo) : super(HadithLoading());

  List<HadithChapterModel> _allChapters = [];

  Future<void> loadChapters() async {
    try {
      emit(HadithLoading());
      _allChapters = await repo.loadChapters();
      emit(HadithChaptersLoaded(_allChapters, _allChapters));
    } catch (e, s) {
      debugPrint('❌ loadChapters error: $e');
      debugPrintStack(stackTrace: s);
      emit(HadithError(e.toString()));
    }
  }

  void search(String query) {
    if (state is! HadithChaptersLoaded) return;

    final q = query.trim();
    if (q.isEmpty) {
      emit(HadithChaptersLoaded(_allChapters, _allChapters));
      return;
    }

    final filtered = _allChapters.where((c) => c.arabic.contains(q)).toList();

    emit(HadithChaptersLoaded(_allChapters, filtered));
  }

  Future<void> loadHadiths(HadithChapterModel chapter) async {
    try {
      emit(HadithLoading());
      final hadiths = await repo.loadHadiths(chapter.id);
      emit(HadithsLoaded(title: chapter.arabic, hadiths: hadiths));
    } catch (e) {
      emit(HadithError(e.toString()));
    }
  }
}
