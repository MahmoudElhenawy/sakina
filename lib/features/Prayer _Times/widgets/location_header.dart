import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sakina/core/utils/constant.dart';

class LocationHeader extends StatelessWidget {
  final String locationName;

  const LocationHeader({super.key, required this.locationName});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hijriDate = _getHijriDate(now);
    final gregorianDate = DateFormat('EEEE، d MMMM yyyy', 'ar').format(now);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.goldMedium, AppColors.goldLight],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowGold,
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                locationName,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            gregorianDate,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            hijriDate,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  String _getHijriDate(DateTime date) {
    final hijriYear = ((date.year - 622) * 1.030684).round();
    return '$hijriYear هـ';
  }
}
