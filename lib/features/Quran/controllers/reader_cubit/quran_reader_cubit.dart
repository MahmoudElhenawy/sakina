import 'package:flutter_bloc/flutter_bloc.dart';
import 'quran_reader_state.dart';

class QuranReaderCubit extends Cubit<QuranReaderState> {
  QuranReaderCubit() : super(const QuranReaderState(fontSize: 23));

  void increaseFont() {
    if (state.fontSize < 32) {
      emit(QuranReaderState(fontSize: state.fontSize + 2));
    }
  }

  void decreaseFont() {
    if (state.fontSize > 18) {
      emit(QuranReaderState(fontSize: state.fontSize - 2));
    }
  }
}
