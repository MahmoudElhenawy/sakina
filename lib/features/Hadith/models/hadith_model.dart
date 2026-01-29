class HadithModel {
  final int id;
  final String arabic;

  HadithModel({required this.id, required this.arabic});

  factory HadithModel.fromJson(Map<String, dynamic> json) {
    return HadithModel(id: json['id'], arabic: json['arabic']);
  }
}
