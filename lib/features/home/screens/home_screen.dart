import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakina/core/utils/app_routers.dart';
import 'package:sakina/core/utils/app_style.dart';
import 'package:sakina/core/utils/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.goldMedium.withOpacity(0.2),
                        AppColors.goldMedium.withOpacity(0.1),
                      ],
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.goldMedium, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.goldMedium.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.mosque_outlined,
                    size: 40,
                    color: AppColors.goldLight,
                  ),
                ),

                const SizedBox(height: 32),

                Text(
                  'صلِّ على النبي ﷺ',
                  style: Styles.textStyle30.copyWith(
                    fontSize: 36,
                    color: AppColors.goldLight,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                    shadows: [
                      Shadow(
                        color: AppColors.goldMedium.withOpacity(0.5),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 8),

                Container(
                  width: 100,
                  height: 3,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppColors.goldMedium,
                        Colors.transparent,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                const SizedBox(height: 28),

                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.borderMedium,
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowStrong,
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'قال رسول الله ﷺ',
                        style: Styles.textStyle20.copyWith(
                          fontSize: 16,
                          color: AppColors.secondaryText,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'من صلّى عليَّ صلاةً واحدة\nصلّى الله عليه بها عشرًا',
                        style: Styles.textStyle20.copyWith(
                          fontSize: 19,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                          height: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.goldMedium.withOpacity(0.15),
                        AppColors.goldMedium.withOpacity(0.1),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.goldMedium.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      GoRouter.of(context).go(AppRouter.navBarScreen);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.goldLight,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 16,
                      ),
                      side: BorderSide(color: AppColors.goldMedium, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'ابدأ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
