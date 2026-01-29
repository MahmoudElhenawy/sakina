import 'package:flutter/material.dart';
import 'package:sakina/core/utils/constant.dart';
import 'quran_navigation_button.dart';
import 'quran_page_indicator.dart';

class QuranBottomBar extends StatelessWidget {
  final PageController controller;
  final int totalPages;

  const QuranBottomBar({
    super.key,
    required this.controller,
    required this.totalPages,
  });

  void _nextPage() {
    if (controller.hasClients) {
      controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (controller.hasClients) {
      controller.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          final currentPage = controller.hasClients
              ? (controller.page?.round() ?? 0)
              : 0;

          final canGoNext = currentPage < totalPages - 1;
          final canGoPrevious = currentPage > 0;

          return Container(
            height: 72,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.cardBackground, AppColors.primaryColor],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.borderMedium, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowStrong,
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                  spreadRadius: -5,
                ),
                BoxShadow(
                  color: AppColors.shadowGold,
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuranNavigationButton(
                  icon: Icons.chevron_right,
                  isEnabled: canGoPrevious,
                  onPressed: _previousPage,
                  tooltip: 'الصفحة السابقة',
                ),

                QuranPageIndicator(
                  currentPage: currentPage + 1,
                  totalPages: totalPages,
                ),

                QuranNavigationButton(
                  icon: Icons.chevron_left,
                  isEnabled: canGoNext,
                  onPressed: _nextPage,
                  tooltip: 'الصفحة التالية',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
