import 'package:flutter/material.dart';
import 'package:sakina/core/utils/constant.dart';

class VerseItem extends StatelessWidget {
  final int verseNumber;
  final String text;

  const VerseItem({required this.verseNumber, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: RichText(
        textAlign: TextAlign.right,
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: const TextStyle(
                fontSize: 20,
                height: 2,
                color: Color(0xFFF9FAF8),
              ),
            ),
            TextSpan(
              text: '  ﴿$verseNumber﴾',
              style: TextStyle(fontSize: 16, color: AppColors.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
