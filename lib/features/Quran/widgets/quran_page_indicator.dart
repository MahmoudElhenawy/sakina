import 'package:flutter/material.dart';
import 'package:sakina/core/utils/constant.dart';

class QuranPageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const QuranPageIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.goldMedium.withOpacity(0.2),
            AppColors.goldMedium.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMedium, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$currentPage',
            style: const TextStyle(
              color: AppColors.goldLight,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [Shadow(color: AppColors.shadowGold, blurRadius: 8)],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'من',
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$totalPages',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
