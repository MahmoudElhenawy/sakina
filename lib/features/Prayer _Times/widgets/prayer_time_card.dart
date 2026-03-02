import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/Prayer%20_Times/models/prayer_time_model.dart';

class PrayerTimeCard extends StatelessWidget {
  final PrayerTimeModel prayer;

  const PrayerTimeCard({super.key, required this.prayer});

  IconData _getPrayerIcon(String name) {
    switch (name) {
      case 'الفجر':
        return Icons.wb_twilight;
      case 'الشروق':
        return Icons.wb_sunny;
      case 'الظهر':
        return Icons.wb_sunny_outlined;
      case 'العصر':
        return Icons.wb_cloudy;
      case 'المغرب':
        return Icons.nights_stay;
      case 'العشاء':
        return Icons.nightlight;
      default:
        return Icons.access_time;
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('hh:mm a', 'ar');

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: prayer.isNext
            ? AppColors.goldMedium.withOpacity(0.1)
            : AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: prayer.isNext
              ? AppColors.goldMedium.withOpacity(0.5)
              : AppColors.borderMedium.withOpacity(0.5),
          width: prayer.isNext ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowStrong,
            blurRadius: 15,
            offset: const Offset(0, 5),
            spreadRadius: -3,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.goldMedium.withOpacity(0.2),
                  AppColors.goldLight.withOpacity(0.1),
                ],
              ),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.goldMedium.withOpacity(0.4),
                width: 1.5,
              ),
            ),
            child: Icon(
              _getPrayerIcon(prayer.name),
              color: AppColors.goldLight,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              prayer.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: prayer.isNext ? FontWeight.bold : FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Text(
            timeFormat.format(prayer.time),
            style: TextStyle(
              fontSize: 18,
              fontWeight: prayer.isNext ? FontWeight.bold : FontWeight.w500,
              color: prayer.isNext
                  ? AppColors.goldLight
                  : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
