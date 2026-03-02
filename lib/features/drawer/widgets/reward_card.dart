import 'package:flutter/material.dart';
import 'package:sakina/core/utils/constant.dart';

class RewardCard extends StatelessWidget {
  final String reward;

  const RewardCard({super.key, required this.reward});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.goldMedium.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.goldMedium.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.star, color: AppColors.goldMedium, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              reward,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary.withOpacity(0.8),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
