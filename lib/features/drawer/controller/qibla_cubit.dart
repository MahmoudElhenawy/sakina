import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class QiblaCubit extends Cubit<QiblaState> {
  QiblaCubit() : super(QiblaInitial());

  Future<void> checkLocationPermission() async {
    emit(QiblaLoading());

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(QiblaError('الرجاء تفعيل خدمة الموقع'));
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(QiblaError('الرجاء السماح بالوصول للموقع'));
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(QiblaError('الرجاء تفعيل صلاحية الموقع من الإعدادات'));
      return;
    }

    emit(QiblaReady());
  }
}

abstract class QiblaState {}

class QiblaInitial extends QiblaState {}

class QiblaLoading extends QiblaState {}

class QiblaReady extends QiblaState {}

class QiblaError extends QiblaState {
  final String message;
  QiblaError(this.message);
}
