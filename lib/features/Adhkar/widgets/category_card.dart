import 'package:flutter/material.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/Adhkar/models/azkar_category_model.dart';

class CategoryCard extends StatelessWidget {
  final AzkarCategoryModel category;
  final VoidCallback onTap;

  const CategoryCard({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowStrong.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppColors.goldMedium.withOpacity(0.15),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                _buildLeadingIcon(),
                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.goldMedium.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${category.count} ذكر',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.goldMedium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.goldMedium,
                  size: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeadingIcon() {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.goldMedium.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Center(
        child: Icon(
          Icons.auto_awesome_mosaic_rounded,
          color: AppColors.goldMedium,
          size: 28,
        ),
      ),
    );
  }
}
