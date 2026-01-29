import '../models/verse_model.dart';

class QuranPaginator {
  static List<List<VerseModel>> paginate(
    List<VerseModel> verses, {
    int versesPerPage = 7,
  }) {
    final pages = <List<VerseModel>>[];

    for (int i = 0; i < verses.length; i += versesPerPage) {
      pages.add(
        verses.sublist(
          i,
          i + versesPerPage > verses.length ? verses.length : i + versesPerPage,
        ),
      );
    }

    return pages;
  }
}
