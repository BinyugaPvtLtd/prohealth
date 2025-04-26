import 'package:flutter/material.dart';

class SmIntakeProviderManager extends ChangeNotifier{
  bool _isContactTrue = false;
  bool _isContactCallLive = false;
  bool _isEyeScreenVisible = false;
  bool get isContactTrue => _isContactTrue;
  bool get isContactCallLive => _isContactCallLive;
  bool get isEyeScreenVisible => _isEyeScreenVisible;

  void toogleContactProvider(){
    _isContactTrue = !_isContactTrue;
    notifyListeners();
  }
  void toogleContactProviderclear(){
    _isContactTrue = false;
    notifyListeners();
  }
  void toogleContactCallLiveProvider(){
    _isContactCallLive = !_isContactCallLive;
    notifyListeners();
  }
  void toogleEyeScreenProvider(){
    _isEyeScreenVisible = !_isEyeScreenVisible;
    notifyListeners();
  }
}