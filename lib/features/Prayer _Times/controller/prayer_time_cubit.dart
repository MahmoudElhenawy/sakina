import 'package:adhan/adhan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sakina/features/Prayer%20_Times/models/prayer_time_model.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit() : super(PrayerTimeInitial());

  Future<void> loadPrayerTimes() async {
    try {
      emit(PrayerTimeLoading());

      // Check location permission
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(PrayerTimeError('الرجاء تفعيل خدمة الموقع'));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(PrayerTimeError('الرجاء السماح بالوصول للموقع'));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(PrayerTimeError('الرجاء تفعيل صلاحية الموقع من الإعدادات'));
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Calculate prayer times
      final coordinates = Coordinates(position.latitude, position.longitude);
      final params = CalculationMethod.egyptian.getParameters();
      params.madhab = Madhab.shafi;

      final prayerTimes = PrayerTimes.today(coordinates, params);

      // Create prayer times list
      final prayers = [
        PrayerTimeModel(name: 'الفجر', time: prayerTimes.fajr),
        PrayerTimeModel(name: 'الشروق', time: prayerTimes.sunrise),
        PrayerTimeModel(name: 'الظهر', time: prayerTimes.dhuhr),
        PrayerTimeModel(name: 'العصر', time: prayerTimes.asr),
        PrayerTimeModel(name: 'المغرب', time: prayerTimes.maghrib),
        PrayerTimeModel(name: 'العشاء', time: prayerTimes.isha),
      ];

      // Find next prayer
      final now = DateTime.now();
      int nextPrayerIndex = prayers.indexWhere((p) => p.time.isAfter(now));

      if (nextPrayerIndex != -1) {
        prayers[nextPrayerIndex] = PrayerTimeModel(
          name: prayers[nextPrayerIndex].name,
          time: prayers[nextPrayerIndex].time,
          isNext: true,
        );
      }

      // Get location name
      final locationName = await _getLocationName(position);

      emit(
        PrayerTimeLoaded(
          prayers: prayers,
          locationName: locationName,
          nextPrayerIndex: nextPrayerIndex,
        ),
      );
    } catch (e) {
      emit(PrayerTimeError('حدث خطأ: ${e.toString()}'));
    }
  }

  Future<String> _getLocationName(Position position) async {
    try {
      // يمكنك استخدام geocoding package للحصول على اسم المدينة
      // لكن هنا هنرجع الإحداثيات فقط
      return '${position.latitude.toStringAsFixed(2)}, ${position.longitude.toStringAsFixed(2)}';
    } catch (e) {
      return 'موقعك الحالي';
    }
  }

  String getTimeRemaining(DateTime prayerTime) {
    final now = DateTime.now();
    final difference = prayerTime.difference(now);

    if (difference.isNegative) {
      return 'مضى';
    }

    final hours = difference.inHours;
    final minutes = difference.inMinutes.remainder(60);

    if (hours > 0) {
      return 'بعد $hours ساعة و $minutes دقيقة';
    } else {
      return 'بعد $minutes دقيقة';
    }
  }
}

abstract class PrayerTimeState {}

class PrayerTimeInitial extends PrayerTimeState {}

class PrayerTimeLoading extends PrayerTimeState {}

class PrayerTimeLoaded extends PrayerTimeState {
  final List<PrayerTimeModel> prayers;
  final String locationName;
  final int nextPrayerIndex;

  PrayerTimeLoaded({
    required this.prayers,
    required this.locationName,
    required this.nextPrayerIndex,
  });
}

class PrayerTimeError extends PrayerTimeState {
  final String message;

  PrayerTimeError(this.message);
}
