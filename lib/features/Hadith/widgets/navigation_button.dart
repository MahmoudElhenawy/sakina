import 'package:flutter/material.dart';
import 'package:sakina/core/utils/constant.dart';

class NavigationButton extends StatelessWidget {
  final bool isNext;
  final VoidCallback onTap;

  const NavigationButton({
    super.key,
    required this.isNext,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: isNext ? 8 : null,
      left: isNext ? null : 8,
      top: 0,
      bottom: 0,
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.goldMedium, AppColors.goldLight],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowGold,
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              isNext ? Icons.arrow_forward_ios : Icons.arrow_back_ios_new,
              color: AppColors.cardBackground,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
