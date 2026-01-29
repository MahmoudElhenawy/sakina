import 'package:flutter/material.dart';

class QuranReaderController extends ChangeNotifier {
  double fontSize = 23;

  void increaseFont() {
    if (fontSize < 32) {
      fontSize += 2;
      notifyListeners();
    }
  }

  void decreaseFont() {
    if (fontSize > 18) {
      fontSize -= 2;
      notifyListeners();
    }
  }
}
