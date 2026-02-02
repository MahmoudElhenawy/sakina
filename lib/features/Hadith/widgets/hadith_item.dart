import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sakina/core/utils/constant.dart';
import '../models/hadith_chapter_model.dart';

class HadithItem extends StatelessWidget {
  final HadithChapterModel chapter;
  final VoidCallback onTap;

  const HadithItem({super.key, required this.chapter, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      splashColor: AppColors.secondaryColor.withOpacity(0.12),
      highlightColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.borderMedium.withOpacity(0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowStrong,
              blurRadius: 20,
              offset: const Offset(0, 8),
              spreadRadius: -4,
            ),
            BoxShadow(
              color: AppColors.shadowGold,
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/Vector.svg',
                  width: 44,
                  height: 44,
                  colorFilter: ColorFilter.mode(
                    AppColors.goldMedium,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  chapter.id.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Expanded(
              child: Text(
                chapter.arabic,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
