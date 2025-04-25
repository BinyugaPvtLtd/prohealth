import 'package:flutter/material.dart';

class SmIntakeProviderManager extends ChangeNotifier{
  bool _isContactTrue = false;
  bool get isContactTrue => _isContactTrue;

  void toogleContactProvider(){
    _isContactTrue = !_isContactTrue;
    notifyListeners();
  }
  void toogleContactProviderclear(){
    _isContactTrue = false;
    notifyListeners();
  }
}