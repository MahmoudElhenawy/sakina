import 'package:equatable/equatable.dart';

class QuranReaderState extends Equatable {
  final double fontSize;

  const QuranReaderState({required this.fontSize});

  @override
  List<Object> get props => [fontSize];
}
