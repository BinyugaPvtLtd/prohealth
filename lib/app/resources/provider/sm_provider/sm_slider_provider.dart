import 'package:flutter/material.dart';

class SmIntakeProviderManager extends ChangeNotifier{
  bool _isContactTrue = false;
  bool _isRightSliderOpen = false;
  bool _isContactCallLive = false;
  bool _isEyeScreenVisible = false;
  bool _isLeftSidebarOpen = false;
  bool _isAutoSyncScreenVisible = false;
  int _initialIndex = 0;
  String _marketerId = 'all';
  String _referralSourceId = 'all';
  String _pcpId = 'all';


  // Referal filter
  bool _isFilterOpen = false;
  bool _MContainerVisible = false;
  bool _OContainerVisible = false;
  bool _RContainerVisible = false;
  bool _AContainerVisible = false;
  bool _IContainerVisible = false;
  bool _ICContainerVisible = false;
  bool _PContainerVisible = false;// Track filter panel state
  bool _isAppBarVisible = false;


  bool get isAppVarVisible => _isAppBarVisible;
  int get initialIndex => _initialIndex;
  bool get isContactTrue => _isContactTrue;
  bool get isRightSliderOpen => _isRightSliderOpen;
  bool get isContactCallLive => _isContactCallLive;
  bool get isEyeScreenVisible => _isEyeScreenVisible;
  bool get isLeftSidebarOpen => _isLeftSidebarOpen;
  bool get isAutoSyncScreenOpen => _isAutoSyncScreenVisible;

  // Referal filter
  bool get isFilterOpen => _isFilterOpen;
  bool get MContainerVisible => _MContainerVisible;
  bool get OContainerVisible => _OContainerVisible;
  bool get RContainerVisible => _RContainerVisible;
  bool get AContainerVisible => _AContainerVisible;
  bool get IContainerVisible => _IContainerVisible;
  bool get ICContainerVisible => _ICContainerVisible;
  bool get PContainerVisible => _PContainerVisible;

  String get marketerId => _marketerId;
  String get referralSourceId => _referralSourceId;
  String get pcpId => _pcpId;




  int _currentPagepp = 1;
  int _currentPageaa = 1;
  int _currentPagemm = 1;

  int get currentPage => _currentPagepp;
  int get currentPageaa => _currentPageaa;
  int get currentPagemm => _currentPagemm;

  void setCurrentPage(int pagepp) {
    _currentPagepp = pagepp;
    notifyListeners();
  }

  void aaCurrentPage(int pageaa) {
    _currentPageaa = pageaa;
    notifyListeners();
  }
  void mmCurrentPage(int pagemm) {
    _currentPagemm = pagemm;
    notifyListeners();
  }

  void toogleContactProvider(){
    _isContactTrue = !_isContactTrue;
    notifyListeners();
  }
  void toogleRightSliderProvider(){
    _isRightSliderOpen = !_isRightSliderOpen;
    notifyListeners();
  }
  void toogleContactProviderclear(){
    _isContactTrue = false;
    notifyListeners();
  }
  void toogleContactProviderTrue(){
    _isContactTrue = true;
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
  void toogleAutoSyncScreenProvider(){
    _isAutoSyncScreenVisible = !_isAutoSyncScreenVisible;
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

  void toogleAppBar(){
    _isAppBarVisible = !_isAppBarVisible;
    notifyListeners();
  }

  void filterIdIntegration({required String marketerId, required String sourceId, required String pcpId}){
    _marketerId = marketerId;
    _referralSourceId = sourceId;
    _pcpId = pcpId;
    notifyListeners();
  }

}





