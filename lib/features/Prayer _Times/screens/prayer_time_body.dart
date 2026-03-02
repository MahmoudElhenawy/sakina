import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/Prayer%20_Times/controller/prayer_time_cubit.dart';
import 'package:sakina/features/Prayer%20_Times/widgets/location_header.dart';
import 'package:sakina/features/Prayer%20_Times/widgets/next_prayer_card.dart';
import 'package:sakina/features/Prayer%20_Times/widgets/prayer_time_card.dart';

class PrayerTimeBody extends StatelessWidget {
  const PrayerTimeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      builder: (context, state) {
        if (state is PrayerTimeLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.goldMedium),
          );
        }

        if (state is PrayerTimeError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: AppColors.goldMedium.withOpacity(0.5),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColors.textPrimary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<PrayerTimeCubit>().loadPrayerTimes();
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('إعادة المحاولة'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.goldMedium,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is PrayerTimeLoaded) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                LocationHeader(locationName: state.locationName),
                const SizedBox(height: 20),
                if (state.nextPrayerIndex != -1)
                  NextPrayerCard(prayer: state.prayers[state.nextPrayerIndex]),
                const SizedBox(height: 20),
                ...state.prayers.map((prayer) {
                  return PrayerTimeCard(prayer: prayer);
                }),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
