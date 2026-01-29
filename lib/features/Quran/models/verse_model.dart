class VerseModel {
  final int id;
  final String text;

  const VerseModel({required this.id, required this.text});

  factory VerseModel.fromJson(Map<String, dynamic> json) {
    return VerseModel(id: json['id'], text: json['text']);
  }
}
