import 'package:flutter/material.dart';
import '../model/language_model.dart';

class LanguageProvider extends ChangeNotifier {
  Language? _inputLanguage;
  Language? _outPutLanguage;

  Language? get inputLanguage => _inputLanguage;
  Language? get outputLanguage => _outPutLanguage;

  void setInputLanguage(Language selected) {
    _inputLanguage = selected;
    notifyListeners();
  }

  void setOutputLanguage(Language selected) {
    _outPutLanguage = selected;
    notifyListeners();
  }
}
