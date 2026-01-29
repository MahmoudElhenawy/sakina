import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakina/core/utils/app_routers.dart';
import 'package:sakina/core/utils/app_style.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/splash/widgets/typing_animation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: -20, end: 0),
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, value),
                    child: child,
                  );
                },
                child: Text(
                  'سَكِينَة',
                  style: Styles.textStyle30.copyWith(
                    fontSize: 56,
                    color: const Color(0xFFF9FAF8),
                    letterSpacing: 1.2,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TypingText(
                text: 'قريب من الله… أقرب للسلام',
                style: Styles.textStyle20.copyWith(
                  color: AppColors.secondaryColor,
                  height: 1.6,
                ),
                repeatCount: 1,
                onCompleted: () {
                  GoRouter.of(context).go(AppRouter.homeScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
