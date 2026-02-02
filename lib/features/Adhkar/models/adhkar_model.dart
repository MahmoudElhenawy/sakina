class AzkarModel {
  final String category;
  final String zekr;
  final String description;
  final int count;
  final String reference;

  AzkarModel({
    required this.category,
    required this.zekr,
    required this.description,
    required this.count,
    required this.reference,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      category: json['category'] ?? '',
      zekr: json['zekr'] ?? '',
      description: json['description'] ?? '',
      count: json['count'] ?? 1,
      reference: json['reference'] ?? '',
    );
  }
}
