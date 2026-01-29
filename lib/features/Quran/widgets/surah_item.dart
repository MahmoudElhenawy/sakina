import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/Quran/models/surah_model.dart';

class SurahItem extends StatelessWidget {
  final SurahModel surah;
  final VoidCallback onTap;

  const SurahItem({super.key, required this.surah, required this.onTap});

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
              color: Colors.black.withOpacity(0.35),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            // رقم السورة داخل SVG
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/Vector.svg',
                  width: 44,
                  height: 44,
                  colorFilter: const ColorFilter.mode(
                    AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  surah.id.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFF9FAF8),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFF9FAF8),
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    '${surah.totalVerses} آيات',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    surah.type == "meccan" ? 'مكية' : 'مدنية',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.secondaryColor,
                  size: 24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
