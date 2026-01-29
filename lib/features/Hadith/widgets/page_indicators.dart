import 'package:flutter/material.dart';
import 'package:sakina/core/utils/constant.dart';

class PageIndicators extends StatelessWidget {
  final int totalCount;
  final int currentPage;

  const PageIndicators({
    super.key,
    required this.totalCount,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalCount > 10 ? 10 : totalCount, (index) {
          int displayIndex = index;
          if (totalCount > 10 && index >= 5) {
            displayIndex = totalCount - 10 + index;
          }

          bool isActive = currentPage == displayIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: isActive ? 24 : 8,
            decoration: BoxDecoration(
              gradient: isActive
                  ? const LinearGradient(
                      colors: [AppColors.goldMedium, AppColors.goldLight],
                    )
                  : null,
              color: isActive ? null : AppColors.borderMedium.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4),
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: AppColors.goldMedium.withOpacity(0.4),
                        blurRadius: 8,
                      ),
                    ]
                  : null,
            ),
          );
        }),
      ),
    );
  }
}
