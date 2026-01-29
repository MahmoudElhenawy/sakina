import 'package:flutter/material.dart';
import 'package:sakina/core/utils/constant.dart';

class QuranSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const QuranSearchBar({
    super.key,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground.withOpacity(0.35),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.secondaryColor.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, size: 20, color: AppColors.secondaryColor),
          const SizedBox(width: 12),

          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(color: Color(0xFFF9FAF8), fontSize: 15),
              cursorColor: AppColors.secondaryColor,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'ابحث عن سورة...',
              ),
            ),
          ),

          ValueListenableBuilder<TextEditingValue>(
            valueListenable: controller,
            builder: (context, value, _) {
              if (value.text.isEmpty) return const SizedBox();

              return GestureDetector(
                onTap: () {
                  controller.clear();
                  onChanged('');
                },
                child: const Icon(
                  Icons.close,
                  size: 18,
                  color: AppColors.secondaryColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
