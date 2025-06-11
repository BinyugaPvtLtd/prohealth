import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/api_data/sm_data/sm_intake_data/intake_demographics/demographich_ai_data.dart';
import '../../../../data/api_data/sm_data/sm_model_data/sm_patient_refferal_data.dart';
import '../../../../presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';
import '../../../services/api/managers/sm_module_manager/intake/all_intake_manager.dart';
import '../../../services/api/managers/sm_module_manager/refferals_manager/refferals_patient_manager.dart';

class SmIntakeProviderManager extends ChangeNotifier{
  AIDemographichModelData? _fetchedData;
  bool _isContactTrue = false;
  bool _isRightSliderOpen = false;
  bool _isContactCallLive = false;
  bool _isEyeScreenVisible = false;
  bool _isLeftSidebarOpen = false;
  bool _isAutoSyncScreenVisible = false;
  int _initialIndex = 0;
  // String _marketerId = 'all';
  // String _referralSourceId = 'all';
  // String _pcpId = 'all';


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


  AIDemographichModelData get fetchedData => _fetchedData!;

  int _currentPagepp = 1;
  int _currentPageaa = 1;
  int _currentPagemm = 1;

  int get currentPage => _currentPagepp;
  int get currentPageaa => _currentPageaa;
  int get currentPagemm => _currentPagemm;


  Future<void> fetchAIdemoData({required BuildContext context}) async{
    final providerPatientId = Provider.of<DiagnosisProvider>(context,listen: false);
    _fetchedData = await getAIDemographichData(context: context, ptId: providerPatientId.patientId);
    notifyListeners();
    // setState(() {
    //   //fetchedData = Data;
    // });
    // fetchedData = data;
  }

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

  // void filterIdIntegration({required String marketerId, required String sourceId, required String pcpId}){
  //   _marketerId = marketerId;
  //   _referralSourceId = sourceId;
  //   _pcpId = pcpId;
  //   notifyListeners();
  //}


  // List<PatientModel> _allItems = [];
  //
  // List<PatientModel> get allItems => _allItems;
  //
  // final StreamController<List<PatientModel>> _streamController = StreamController<List<PatientModel>>.broadcast();
  //
  // Stream<List<PatientModel>> get patientReferralsStream => _streamController.stream;
  //
  // final TextEditingController _searchController = TextEditingController();
  //
  //
  //
  //
  // Future<void> filterIdIntegrationaa({
  //   required BuildContext context,
  //   required String marketerId,
  //   required String sourceId,
  //   required String pcpId,
  // }) async {
  //   try {
  //     final data = await getPatientReffrealsData(
  //       context: context,
  //       pageNo: 1,
  //       nbrOfRows: 9999,
  //       isIntake: 'false',
  //       isArchived: 'true',
  //       isScheduled: 'false',
  //       searchName: _searchController.text.isEmpty ? 'all' : _searchController.text,
  //       marketerId: marketerId,
  //       referralSourceId: sourceId,
  //       pcpId: pcpId,
  //     );
  //     _streamController.add(data);
  //   } catch (e) {
  //     print('Error fetching data: $e');
  //   }
  // }




  String _marketerId = 'all';
  String _referralSourceId = 'all';
  String _pcpId = 'all';

  final TextEditingController searchController = TextEditingController();
  final StreamController<List<PatientModel>> _streamController = StreamController<List<PatientModel>>.broadcast();

  RefferalFilterScreenType _currentScreen = RefferalFilterScreenType.pending;

  // Getter for screen type
  RefferalFilterScreenType get currentScreen => _currentScreen;

  // Stream getter
  Stream<List<PatientModel>> get patientReferralsStream => _streamController.stream;

  // Set current screen
  void setCurrentScreen(RefferalFilterScreenType screen) {
    _currentScreen = screen;
    notifyListeners();
  }

  void updateSearchText(String searchText) {
    searchController.text = searchText;
    notifyListeners();
  }

  Future<void> filterIdIntegration({
    required BuildContext context,
    required String marketerId,
    required String sourceId,
    required String pcpId,
  }) async {
    _marketerId = marketerId;
    _referralSourceId = sourceId;
    _pcpId = pcpId;
    notifyListeners();
    await _applyFilters(context: context);
  }

  Future<void> _applyFilters({required BuildContext context}) async {
    try {
      String isIntake = 'false';
      String isArchived = 'false';

      switch (_currentScreen) {
        case RefferalFilterScreenType.archive:
          isArchived = 'true';
          break;
        case RefferalFilterScreenType.intake:
          isIntake = 'true';
          break;
        case RefferalFilterScreenType.pending:
          break;
      }

      final data = await getPatientReffrealsData(
        context: context,
        pageNo: 1,
        nbrOfRows: 9999,
        isIntake: isIntake,
        isArchived: isArchived,
        isScheduled: 'false',
        searchName: searchController.text.isEmpty ? 'all' : searchController.text,
        marketerId: _marketerId,
        referralSourceId: _referralSourceId,
        pcpId: _pcpId, isNotAdmit: 'true',
      );

      _streamController.add(data);
    } catch (e) {
      print("Error applying filters: $e");
      _streamController.addError("Failed to load data");
    }
  }



}





enum RefferalFilterScreenType {
  pending,
  intake,
  archive,
}