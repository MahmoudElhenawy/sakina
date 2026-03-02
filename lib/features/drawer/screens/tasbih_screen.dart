import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina/core/utils/constant.dart';

import 'package:sakina/features/drawer/controller/tasbih_cubit.dart';
import 'package:sakina/features/drawer/widgets/tasbih_body.dart';

class TasbihScreen extends StatelessWidget {
  const TasbihScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TasbihCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.cardBackground.withOpacity(0.95),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text(
                'السبحة الإلكترونية',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: AppColors.goldLight,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh, color: AppColors.goldMedium),
                  onPressed: () => _showResetDialog(context),
                ),
              ],
            ),
            body: const TasbihBody(),
          );
        },
      ),
    );
  }

  void _showResetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: AppColors.goldMedium.withOpacity(0.3),
            width: 1,
          ),
        ),
        title: const Text(
          'إعادة تعيين',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.goldLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'ماذا تريد أن تعيد؟',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
            onPressed: () {
              context.read<TasbihCubit>().resetCount();
              Navigator.pop(dialogContext);
            },
            child: const Text(
              'العداد فقط',
              style: TextStyle(color: AppColors.goldMedium),
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<TasbihCubit>().resetAll();
              Navigator.pop(dialogContext);
            },
            child: const Text(
              'الكل',
              style: TextStyle(color: AppColors.goldLight),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              'إلغاء',
              style: TextStyle(color: AppColors.textPrimary.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
