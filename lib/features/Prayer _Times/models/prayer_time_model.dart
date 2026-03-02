class PrayerTimeModel {
  final String name;
  final DateTime time;
  final bool isNext;

  PrayerTimeModel({
    required this.name,
    required this.time,
    this.isNext = false,
  });
}
