import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:sakina/core/utils/constant.dart';

class QiblaCompass extends StatelessWidget {
  const QiblaCompass({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QiblahDirection>(
      stream: FlutterQiblah.qiblahStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.goldMedium),
          );
        }

        if (!snapshot.hasData) {
          return const Center(
            child: Text(
              'غير قادر على الحصول على اتجاه القبلة',
              style: TextStyle(color: AppColors.textPrimary),
            ),
          );
        }

        final qiblahDirection = snapshot.data!;

        return Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDirectionInfo(qiblahDirection),
                const SizedBox(height: 40),
                _buildCompass(qiblahDirection),
                const SizedBox(height: 40),
                _buildInstructions(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDirectionInfo(QiblahDirection qiblahDirection) {
    final direction = qiblahDirection.qiblah.toStringAsFixed(1);
    final offset = qiblahDirection.offset.abs().toStringAsFixed(1);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
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
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfoItem(
                label: 'اتجاه القبلة',
                value: '$direction°',
                icon: Icons.explore,
              ),
              _buildInfoItem(
                label: 'الانحراف',
                value: '$offset°',
                icon: Icons.my_location,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Column(
      children: [
        Icon(icon, color: AppColors.goldMedium, size: 32),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.goldLight,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textPrimary.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildCompass(QiblahDirection qiblahDirection) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Compass background
          Transform.rotate(
            angle: (qiblahDirection.direction * (pi / 180) * -1),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.goldMedium.withOpacity(0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowGold,
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/compass.png',
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Qibla needle
          Transform.rotate(
            angle: (qiblahDirection.qiblah * (pi / 180) * -1),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.goldMedium.withOpacity(0.5),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/needle.png',
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Center Kaaba icon
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColors.goldMedium, AppColors.goldLight],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowGold,
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Icon(Icons.location_on, color: Colors.white, size: 32),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructions() {
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
          Icon(Icons.info_outline, color: AppColors.goldMedium, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'حرك هاتفك حتى تتطابق الإبرة مع اتجاه القبلة',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary.withOpacity(0.8),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
