import 'package:flutter/material.dart';
import 'package:sakina/core/utils/constant.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;

  const GlassContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}

class GlassButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const GlassButton({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.goldMedium.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    );
  }
}
