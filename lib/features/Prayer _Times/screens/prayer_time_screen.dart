import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/Prayer%20_Times/controller/prayer_time_cubit.dart';
import 'package:sakina/features/Prayer%20_Times/screens/prayer_time_body.dart';

class PrayerTimeScreen extends StatelessWidget {
  const PrayerTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PrayerTimeCubit()..loadPrayerTimes(),
      child: Scaffold(
        backgroundColor: AppColors.cardBackground.withOpacity(0.95),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'مواقيت الصلاة',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColors.goldLight,
            ),
          ),
          centerTitle: true,
          actions: [
            BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(Icons.refresh, color: AppColors.goldMedium),
                  onPressed: () {
                    context.read<PrayerTimeCubit>().loadPrayerTimes();
                  },
                );
              },
            ),
          ],
        ),
        body: const PrayerTimeBody(),
      ),
    );
  }
}
