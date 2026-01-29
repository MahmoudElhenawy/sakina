import 'package:flutter/material.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/Quran/models/verse_model.dart';

class QuranPage extends StatelessWidget {
  final List<VerseModel> verses;
  final double fontSize;

  const QuranPage({super.key, required this.verses, required this.fontSize});

  String _buildPageText() {
    return verses.map((v) => '${v.text} ﴿${v.id}﴾').join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 560),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.borderMedium, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowStrong,
                blurRadius: 30,
                offset: const Offset(0, 15),
                spreadRadius: -5,
              ),
              BoxShadow(
                color: AppColors.shadowGold,
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: Column(
              children: [
                Container(
                  height: 4,
                  width: 120,
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

                const SizedBox(height: 20),

                Text(
                  '﷽',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize + 10,
                    height: 1.6,
                    color: AppColors.goldLight,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: AppColors.goldMedium.withOpacity(0.5),
                        blurRadius: 10,
                      ),
                      const Shadow(
                        color: Colors.black38,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  _buildPageText(),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: fontSize,
                    height: 2.4,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                    wordSpacing: 1.2,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 1,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  height: 4,
                  width: 120,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
