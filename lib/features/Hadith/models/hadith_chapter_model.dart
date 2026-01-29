class HadithChapterModel {
  final int id;
  final int bookId;
  final String arabic;

  HadithChapterModel({
    required this.id,
    required this.bookId,
    required this.arabic,
  });

  factory HadithChapterModel.fromJson(Map<String, dynamic> json) {
    return HadithChapterModel(
      id: json['id'],
      bookId: json['bookId'],
      arabic: json['arabic'],
    );
  }
}
