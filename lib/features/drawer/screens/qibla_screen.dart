import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakina/core/utils/constant.dart';
import 'package:sakina/features/drawer/controller/qibla_cubit.dart';
import 'package:sakina/features/drawer/widgets/qibla_body.dart';

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QiblaCubit()..checkLocationPermission(),
      child: Scaffold(
        backgroundColor: AppColors.cardBackground.withOpacity(0.95),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'اتجاه القبلة',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColors.goldLight,
            ),
          ),
          centerTitle: true,
        ),
        body: const QiblaBody(),
      ),
    );
  }
}
