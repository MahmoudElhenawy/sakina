class HadithBookModel {
  final int id;
  final String titleArabic;
  final String author;

  HadithBookModel({
    required this.id,
    required this.titleArabic,
    required this.author,
  });

  factory HadithBookModel.fromJson(Map<String, dynamic> json) {
    return HadithBookModel(
      id: json['id'],
      titleArabic: json['arabic']['title'],
      author: json['arabic']['author'],
    );
  }
}
