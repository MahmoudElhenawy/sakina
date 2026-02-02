import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/Adhkar/models/adhkar_model.dart';

class AzkarCard extends StatefulWidget {
  final AzkarModel azkar;
  final int currentIndex;
  final int totalCount;

  const AzkarCard({
    super.key,
    required this.azkar,
    required this.currentIndex,
    required this.totalCount,
  });

  @override
  State<AzkarCard> createState() => _AzkarCardState();
}

class _AzkarCardState extends State<AzkarCard> {
  late int _remainingCount;

  @override
  void initState() {
    super.initState();
    _remainingCount = widget.azkar.count;
  }

  void _decrementCount() {
    if (_remainingCount > 0) {
      setState(() {
        _remainingCount--;
      });
      HapticFeedback.lightImpact();
    }
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
                _buildTopDecoration(),
                const SizedBox(height: 20),
                _buildZekrBadge(),
                const SizedBox(height: 24),
                _buildZekrText(),
                if (widget.azkar.description.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  _buildDescription(),
                ],
                if (widget.azkar.reference.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  _buildReference(),
                ],
                const SizedBox(height: 24),
                if (widget.azkar.count > 1) _buildCounter(),
                const SizedBox(height: 20),
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

  Widget _buildZekrBadge() {
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
        'الذكر ${widget.currentIndex + 1} من ${widget.totalCount}',
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

  Widget _buildZekrText() {
    return Text(
      widget.azkar.zekr,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        fontSize: 22,
        height: 2.2,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
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

  Widget _buildDescription() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.goldMedium.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.goldMedium.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: AppColors.goldMedium, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.azkar.description,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 15,
                height: 1.8,
                color: AppColors.textPrimary.withOpacity(0.85),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReference() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu_book,
          color: AppColors.goldMedium.withOpacity(0.7),
          size: 16,
        ),
        const SizedBox(width: 6),
        Text(
          widget.azkar.reference,
          style: TextStyle(
            fontSize: 13,
            color: AppColors.goldMedium.withOpacity(0.7),
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildCounter() {
    return GestureDetector(
      onTap: _decrementCount,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _remainingCount > 0
              ? AppColors.goldMedium
              : AppColors.cardInner,
        ),
        child: Center(
          child: _remainingCount > 0
              ? Text(
                  '$_remainingCount',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.cardBackground,
                  ),
                )
              : const Icon(Icons.check, size: 40, color: AppColors.textPrimary),
        ),
      ),
    );
  }
}
