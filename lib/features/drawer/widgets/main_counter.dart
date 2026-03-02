import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/drawer/controller/tasbih_cubit.dart';

class MainCounter extends StatelessWidget {
  final TasbihState state;

  const MainCounter({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final target = state.selectedZekr?.target ?? 33;
    final displayCount = state.count % target;
    final progress = displayCount / target;

    return GestureDetector(
      onTap: state.selectedZekr != null
          ? () {
              context.read<TasbihCubit>().increment();
              HapticFeedback.mediumImpact();
            }
          : null,
      child: Container(
        width: 280,
        height: 280,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: state.selectedZekr != null
                ? [AppColors.goldMedium, AppColors.goldLight]
                : [Colors.grey.shade400, Colors.grey.shade300],
          ),
          boxShadow: [
            BoxShadow(
              color: state.selectedZekr != null
                  ? AppColors.shadowGold
                  : Colors.grey.withOpacity(0.3),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
            BoxShadow(
              color: state.selectedZekr != null
                  ? AppColors.goldMedium.withOpacity(0.3)
                  : Colors.transparent,
              blurRadius: 60,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Progress circle
            Positioned.fill(
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 8,
                backgroundColor: Colors.white.withOpacity(0.3),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),

            // Center content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    displayCount.toString(),
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(color: Colors.black26, blurRadius: 10)],
                    ),
                  ),
                  Text(
                    'من $target',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
