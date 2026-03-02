import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:sakina/core/utils/constant.dart';

import 'package:sakina/features/drawer/controller/qibla_cubit.dart';
import 'package:sakina/features/drawer/widgets/ocation_error_widget.dart';
import 'package:sakina/features/drawer/widgets/qibla_compass.dart';

class QiblaBody extends StatelessWidget {
  const QiblaBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QiblaCubit, QiblaState>(
      builder: (context, state) {
        if (state is QiblaLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.goldMedium),
          );
        }

        if (state is QiblaError) {
          return LocationErrorWidget(
            message: state.message,
            onRetry: () {
              context.read<QiblaCubit>().checkLocationPermission();
            },
          );
        }

        if (state is QiblaReady) {
          return FutureBuilder(
            future: FlutterQiblah.androidDeviceSensorSupport(),
            builder: (context, AsyncSnapshot<bool?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.goldMedium),
                );
              }

              if (snapshot.hasError) {
                return const LocationErrorWidget(
                  message: 'حدث خطأ في التحقق من دعم الجهاز',
                );
              }

              if (snapshot.data == false) {
                return const LocationErrorWidget(
                  message: 'جهازك لا يدعم البوصلة',
                );
              }

              return const QiblaCompass();
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
