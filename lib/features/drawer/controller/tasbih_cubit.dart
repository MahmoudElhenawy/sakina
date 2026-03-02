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
  final String transliteration;
  final int target;
  final String? reward;

  ZekrType({
    required this.arabic,
    required this.transliteration,
    required this.target,
    this.reward,
  });

  static List<ZekrType> getAllAzkar() {
    return [
      ZekrType(
        arabic: 'سُبْحَانَ اللهِ',
        transliteration: 'Subhan Allah',
        target: 33,
        reward: 'من سبح الله دبر كل صلاة ثلاثا وثلاثين',
      ),
      ZekrType(
        arabic: 'الْحَمْدُ لِلَّهِ',
        transliteration: 'Alhamdulillah',
        target: 33,
        reward: 'من حمد الله دبر كل صلاة ثلاثا وثلاثين',
      ),
      ZekrType(
        arabic: 'اللهُ أَكْبَرُ',
        transliteration: 'Allahu Akbar',
        target: 34,
        reward: 'من كبر الله دبر كل صلاة أربعا وثلاثين',
      ),
      ZekrType(
        arabic: 'لَا إِلَهَ إِلَّا اللهُ',
        transliteration: 'La ilaha illa Allah',
        target: 100,
        reward: 'من قالها مائة مرة في يوم كانت له حرزا من الشيطان',
      ),
      ZekrType(
        arabic: 'سُبْحَانَ اللهِ وَبِحَمْدِهِ',
        transliteration: 'Subhan Allah wa bihamdihi',
        target: 100,
        reward: 'من قالها مائة مرة حطت خطاياه وإن كانت مثل زبد البحر',
      ),
      ZekrType(
        arabic: 'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللهِ',
        transliteration: 'La hawla wa la quwwata illa billah',
        target: 100,
        reward: 'كنز من كنوز الجنة',
      ),
      ZekrType(
        arabic: 'أَسْتَغْفِرُ اللهَ',
        transliteration: 'Astaghfirullah',
        target: 100,
        reward: 'من استغفر الله مائة مرة في اليوم',
      ),
      ZekrType(
        arabic: 'سُبْحَانَ اللهِ الْعَظِيمِ وَبِحَمْدِهِ',
        transliteration: 'Subhan Allahil Azeem wa bihamdihi',
        target: 10,
        reward: 'غرست له نخلة في الجنة',
      ),
      ZekrType(
        arabic: 'لَا إِلَهَ إِلَّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ',
        transliteration: 'La ilaha illa Allahu wahdahu la sharika lah',
        target: 10,
        reward: 'كانت له عدل عشر رقاب',
      ),
      ZekrType(
        arabic: 'اللَّهُمَّ صَلِّ وَسَلِّمْ عَلَى نَبِيِّنَا مُحَمَّد',
        transliteration: 'Allahumma salli wa sallim ala nabiyyina Muhammad',
        target: 10,
        reward: 'من صلى علي صلاة صلى الله عليه بها عشرا',
      ),
      ZekrType(
        arabic: 'حَسْبِيَ اللهُ لَا إِلَهَ إِلَّا هُوَ',
        transliteration: 'Hasbiyallahu la ilaha illa huwa',
        target: 7,
        reward: 'من قالها كفاه الله ما أهمه',
      ),
    ];
  }
}
