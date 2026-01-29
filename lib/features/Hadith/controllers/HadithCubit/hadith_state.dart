import '../../models/hadith_model.dart';
import '../../models/hadith_chapter_model.dart';

abstract class HadithState {}

class HadithLoading extends HadithState {}

class HadithChaptersLoaded extends HadithState {
  final List<HadithChapterModel> chapters;
  final List<HadithChapterModel> filtered;

  HadithChaptersLoaded(this.chapters, this.filtered);
}

class HadithsLoaded extends HadithState {
  final String title;
  final List<HadithModel> hadiths;

  HadithsLoaded({required this.title, required this.hadiths});
}

class HadithError extends HadithState {
  final String message;
  HadithError(this.message);
}
