import 'package:flutter_bloc/flutter_bloc.dart';

class TasbihCubit extends Cubit<TasbihState> {
  TasbihCubit() : super(TasbihState());

  void increment() {
    final newCount = state.count + 1;
    final target = state.selectedZekr?.target ?? 33;
    final newRounds = newCount % target == 0 ? state.rounds + 1 : state.rounds;

    emit(state.copyWith(count: newCount, rounds: newRounds));
  }

  void selectZekr(ZekrType zekr) {
    emit(state.copyWith(selectedZekr: zekr, count: 0, rounds: 0));
  }

  void resetCount() {
    emit(state.copyWith(count: 0));
  }

  void resetAll() {
    emit(TasbihState(selectedZekr: state.selectedZekr));
  }
}

class TasbihState {
  final int count;
  final int rounds;
  final ZekrType? selectedZekr;

  TasbihState({this.count = 0, this.rounds = 0, this.selectedZekr});

  TasbihState copyWith({int? count, int? rounds, ZekrType? selectedZekr}) {
    return TasbihState(
      count: count ?? this.count,
      rounds: rounds ?? this.rounds,
      selectedZekr: selectedZekr ?? this.selectedZekr,
    );
  }
}

class ZekrType {
  final String arabic;
  final int target;
  final String? reward;

  ZekrType({required this.arabic, required this.target, this.reward});

  static List<ZekrType> getAllAzkar() {
    return [
      ZekrType(
        arabic: 'سُبْحَانَ اللهِ',
        target: 33,
        reward: 'من سبح الله دبر كل صلاة ثلاثا وثلاثين',
      ),
      ZekrType(
        arabic: 'الْحَمْدُ لِلَّهِ',
        target: 33,
        reward: 'من حمد الله دبر كل صلاة ثلاثا وثلاثين',
      ),
      ZekrType(
        arabic: 'اللهُ أَكْبَرُ',
        target: 34,
        reward: 'من كبر الله دبر كل صلاة أربعا وثلاثين',
      ),
      ZekrType(
        arabic: 'لَا إِلَهَ إِلَّا اللهُ',
        target: 100,
        reward: 'من قالها مائة مرة في يوم كانت له حرزا من الشيطان',
      ),
      ZekrType(
        arabic: 'سُبْحَانَ اللهِ وَبِحَمْدِهِ',
        target: 100,
        reward: 'من قالها مائة مرة حطت خطاياه وإن كانت مثل زبد البحر',
      ),
      ZekrType(
        arabic: 'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللهِ',
        target: 100,
        reward: 'كنز من كنوز الجنة',
      ),
      ZekrType(
        arabic: 'أَسْتَغْفِرُ اللهَ',
        target: 100,
        reward: 'من استغفر الله مائة مرة في اليوم',
      ),
      ZekrType(
        arabic: 'سُبْحَانَ اللهِ الْعَظِيمِ وَبِحَمْدِهِ',
        target: 10,
        reward: 'غرست له نخلة في الجنة',
      ),
      ZekrType(
        arabic: 'لَا إِلَهَ إِلَّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ',
        target: 10,
        reward: 'كانت له عدل عشر رقاب',
      ),
      ZekrType(
        arabic: 'اللَّهُمَّ صَلِّ وَسَلِّمْ عَلَى نَبِيِّنَا مُحَمَّد',
        target: 10,
        reward: 'من صلى علي صلاة صلى الله عليه بها عشرا',
      ),
      ZekrType(
        arabic: 'حَسْبِيَ اللهُ لَا إِلَهَ إِلَّا هُوَ',
        target: 7,
        reward: 'من قالها كفاه الله ما أهمه',
      ),
    ];
  }
}
