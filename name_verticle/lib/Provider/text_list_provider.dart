import 'package:flutter/material.dart';

class TextProvider extends ChangeNotifier {
  final List<String> textList = [];

  void add(String item) {
    textList.add(item);
    notifyListeners();
  }

  void removeText(String item) {
    textList.remove(item);
    notifyListeners();
  }
}
