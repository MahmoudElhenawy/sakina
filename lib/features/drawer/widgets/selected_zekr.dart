import 'package:flutter/material.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/drawer/controller/tasbih_cubit.dart';

class SelectedZekr extends StatelessWidget {
  final TasbihState state;

  const SelectedZekr({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.selectedZekr == null) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.goldMedium.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.goldMedium.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.touch_app, color: AppColors.goldMedium, size: 24),
            const SizedBox(width: 12),
            const Text(
              'اختر ذكراً للبدء',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.goldLight,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.goldMedium.withOpacity(0.15),
            AppColors.goldLight.withOpacity(0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.goldMedium.withOpacity(0.4),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Text(
            state.selectedZekr!.arabic,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.goldLight,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
