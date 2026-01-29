import 'package:flutter/material.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/Hadith/models/hadith_model.dart';
import 'action_button.dart';

class HadithCard extends StatelessWidget {
  final HadithModel hadith;
  final int currentIndex;
  final int totalCount;

  const HadithCard({
    super.key,
    required this.hadith,
    required this.currentIndex,
    required this.totalCount,
  });

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
                _buildTopDecoration(),
                const SizedBox(height: 20),
                _buildHadithBadge(),
                const SizedBox(height: 24),
                _buildHadithText(),
                const SizedBox(height: 24),
                _buildActionButtons(),
                const SizedBox(height: 20),
                _buildBottomDecoration(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopDecoration() {
    return Container(
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
    );
  }

  Widget _buildHadithBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.goldMedium.withOpacity(0.2),
            AppColors.goldLight.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.goldMedium.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        'الحديث ${currentIndex + 1} من $totalCount',
        style: TextStyle(
          color: AppColors.goldLight,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(color: AppColors.goldMedium.withOpacity(0.5), blurRadius: 4),
          ],
        ),
      ),
    );
  }

  Widget _buildHadithText() {
    return Text(
      hadith.arabic,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      softWrap: true,
      style: TextStyle(
        fontSize: 20,
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
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButton(icon: Icons.share_outlined, label: 'مشاركة', onTap: () {}),
        ActionButton(
          icon: Icons.content_copy_outlined,
          label: 'نسخ',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildBottomDecoration() {
    return Container(
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
    );
  }
}
