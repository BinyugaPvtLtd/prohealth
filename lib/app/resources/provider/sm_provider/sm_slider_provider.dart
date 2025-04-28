import 'package:flutter/material.dart';

class SmIntakeProviderManager extends ChangeNotifier{
  bool _isContactTrue = false;
  bool _isContactCallLive = false;
  bool _isEyeScreenVisible = false;
  bool _isLeftSidebarOpen = false;
  int _initialIndex = 0;

  // Referal filter
  bool _isFilterOpen = false;
  bool _MContainerVisible = false;
  bool _OContainerVisible = false;
  bool _RContainerVisible = false;
  bool _AContainerVisible = false;
  bool _IContainerVisible = false;
  bool _ICContainerVisible = false;
  bool _PContainerVisible = false;// Track filter panel state


  int get initialIndex => _initialIndex;
  bool get isContactTrue => _isContactTrue;
  bool get isContactCallLive => _isContactCallLive;
  bool get isEyeScreenVisible => _isEyeScreenVisible;
  bool get isLeftSidebarOpen => _isLeftSidebarOpen;

  // Referal filter
  bool get isFilterOpen => _isFilterOpen;
  bool get MContainerVisible => _MContainerVisible;
  bool get OContainerVisible => _OContainerVisible;
  bool get RContainerVisible => _RContainerVisible;
  bool get AContainerVisible => _AContainerVisible;
  bool get IContainerVisible => _IContainerVisible;
  bool get ICContainerVisible => _ICContainerVisible;
  bool get PContainerVisible => _PContainerVisible;

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
  void toogleLeftSidebarProvider(){
    _isLeftSidebarOpen = !_isLeftSidebarOpen;
    notifyListeners();
  }
  void indexChnage(int index){
    _initialIndex = index;
    notifyListeners();
  }

  /// SM referal
  void toggleFilter() {
      _isFilterOpen = !_isFilterOpen;
      notifyListeners();// Toggle panel visibility
  }
  void toggleContainerM() {
      _MContainerVisible = !_MContainerVisible;
      notifyListeners();
  }

  void toggleContainerO() {
      _OContainerVisible = !_OContainerVisible;
      notifyListeners();
  }

  void toggleContainerR() {
      _RContainerVisible = !_RContainerVisible;
      notifyListeners();
  }

  void toggleContainerA() {
      _AContainerVisible = !_AContainerVisible;
      notifyListeners();
  }

  void toggleContainerI() {
      _IContainerVisible = !_IContainerVisible;
      notifyListeners();
  }

  void toggleContainerIC() {
      _ICContainerVisible = !_ICContainerVisible;
      notifyListeners();

  }

  void toggleContainerP() {
      _PContainerVisible = !_PContainerVisible;
      notifyListeners();
  }

}