
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prohealth/app/constants/app_config.dart';
import 'package:prohealth/app/services/api/managers/hr_module_manager/add_employee/clinical_manager.dart';
import 'package:prohealth/app/services/api/managers/hr_module_manager/register_manager/main_register_manager.dart';
import 'package:prohealth/data/api_data/hr_module_data/add_employee/clinical.dart';
import 'package:prohealth/data/api_data/hr_module_data/register_data/main_register_screen_data.dart';

import '../../../data/api_data/establishment_data/company_identity/company_identity_data_.dart';
import '../../services/api/managers/establishment_manager/company_identrity_manager.dart';

class HrRegisterProvider extends ChangeNotifier {
  String _selectedValue = 'Sort';
  bool _load = false;
  bool get load => _load;
  String get selectedValue => _selectedValue;

   List<RegisterDataCompID> _allData = [];
  List<RegisterDataCompID> get allData => _allData;
  //final registerController = ValueNotifier<List<RegisterDataCompID>>([]);

  final StreamController<List<RegisterDataCompID>> _registerController = StreamController.broadcast();
  Stream<List<RegisterDataCompID>> get registerStream  => _registerController.stream;

  List<AEClinicalDiscipline>? _clinicalDisciplines;
  List<AEClinicalCity>? _clinicalCities;
  List<CompanyOfficeListData>? _companyOffices;
  List<AEClinicalZone>?  _zone;

  List<AEClinicalDiscipline> get clinicalDisciplines => _clinicalDisciplines!;
  List<AEClinicalCity> get clinicalCities => _clinicalCities!;
  List<CompanyOfficeListData> get companyOffices => _companyOffices!;
  List<AEClinicalZone> get zone => _zone!;

  Future<void> fetchDropdownData(BuildContext context) async {
    _load = true;
    notifyListeners();

    try {
      _clinicalDisciplines = await HrAddEmplyClinicalDisciplinApi(context, 1);
      _clinicalCities = await HrAddEmplyClinicalCityApi(context);
      _companyOffices = await getCompanyOfficeList(context);
      _zone = await HrAddEmplyClinicalZoneApi(context);
    } catch (e) {
      debugPrint("Error fetching dropdown data: $e");
    }

    _load = false;
    notifyListeners();
  }

  void loaderTrue(){
    _load = true;
    notifyListeners();
  }
  void loaderFalse(){
    _load = false;
    notifyListeners();
  }
  /// Main fetch data
  Future<void> fetchData(BuildContext context,[String? value]) async {
    //_isLoading = true;
    //notifyListeners();
    if(value == 'Sort'){
      _selectedValue = 'Sort';
      notifyListeners();
    }

    try {
      List<RegisterDataCompID> data = await GetRegisterByCompId(context);
      _allData = data;
      _registerController.add(data);
    } catch (error) {
      // Handle error
      debugPrint('Error fetching data: $error');
    } finally {
      //_isLoading = false;
      notifyListeners();
    }
  }

  /// Sort data status wise
  void updateSelectedValue(String newValue) {
    _selectedValue = newValue;
    filterData();
    notifyListeners();
  }

  void filterData() {
    String selectedStatus = _selectedValue.trim().toLowerCase();

    if (selectedStatus == 'Sort') {
      _registerController.add(allData);
    } else {
      List<RegisterDataCompID> filteredData = allData.where((data) {
        String dataStatus = data.status.trim().toLowerCase();
        return dataStatus == selectedStatus;
      }).toList();
      _registerController.add(filteredData);
    }
  }
}

class HrEnrollEmployeeProvider extends ChangeNotifier{
  String? _positionError;
  String? _zoneError;
  String? _reportingOfficeError;
  String? _cityError;
  String? _phoneError;
  String? _firstnameError;
  String? _lastnameError;
  String? _emailError;
  String? _specialityError;
  String? _clinicalType;
  bool _isFormValid = true;
  String? _expiryTypeError;
  String _generatedURL = '';
  bool _load = false;

  bool isLoading = true;
  List<EnrollServices> _enrollService = [];


  String get generatedURL => _generatedURL;
  bool get load => _load;
  String? get clinicalType => _clinicalType;
  String? get positionError => _positionError;
  String? get zoneError => _zoneError;
  String? get reportingOfficeError => _reportingOfficeError;
  String? get cityError => _cityError;
  String? get phoneError => _phoneError;
  String? get firstnameError => _firstnameError;
  String? get lastnameError => _lastnameError;
  String? get emailError => _emailError;
  String? get specialityError => _specialityError;
  String? get expiryTypeError => _expiryTypeError;
  bool get isFormValid => _isFormValid;
  List<EnrollServices> get enrollService => _enrollService;
  // List<AEClinicalDiscipline>? _clinicalDisciplines;
  // List<AEClinicalCity>? _clinicalCities;
  // List<CompanyOfficeListData>? _companyOffices;
  //
  // List get clinicalDisciplines => _clinicalDisciplines!;
  // List get clinicalCities => _clinicalCities!;
  // List get companyOffices => _companyOffices!;
  //
  // Future<void> fetchDropdownData(BuildContext context) async {
  //   isLoading = true;
  //   notifyListeners();
  //
  //   try {
  //     _clinicalDisciplines = await HrAddEmplyClinicalDisciplinApi(context, 1);
  //     _clinicalCities = await HrAddEmplyClinicalCityApi(context);
  //     _companyOffices = await getCompanyOfficeList(context);
  //   } catch (e) {
  //     debugPrint("Error fetching dropdown data: $e");
  //   }
  //
  //   isLoading = false;
  //   notifyListeners();
  // }


void loaderTrue(){
    _load = true;
    notifyListeners();
  }
  void loaderFalse(){
    _load = false;
    notifyListeners();
  }

  Future<String> generateUrlLink() async {
    final String url = '${AppConfig.dev}/#/onBordingWelcome';
    _generatedURL = url;
    print('Generated URL: $_generatedURL');
    return url;
  }
  String? validateTextField(String value, String fieldName) {
    if (value.isEmpty) {
      _isFormValid = false;
      notifyListeners();
      return "$fieldName";
    }
    notifyListeners();
    return null;
  }
// Validation for a single field
  void validateField(String value, String fieldName, Function(String?) setError) {
    if (value.isEmpty) {
      setError("$fieldName");
    } else {
      setError(null);
    }
    notifyListeners();
  }
  void enrollServicesList(BuildContext context) async{
    _enrollService = await EmpServiceRadioButtonApi(context);
    notifyListeners();
  }
  // Specific setters for each field error
  void setPositionError(String? error) {
    _positionError = error;
    notifyListeners();
  }

  void setPhoneError(String? error) {
    _phoneError = error;
    notifyListeners();
  }

  void setSpecialityError(String? error) {
    _specialityError = error;
    notifyListeners();
  }

  void setFirstnameError(String? error) {
    _firstnameError = error;
    notifyListeners();
  }

  void setLastnameError(String? error) {
    _lastnameError = error;
    notifyListeners();
  }

  void setEmailError(String? error) {
    _emailError = error;
    notifyListeners();
  }
  void setZoneError(String? error) {
    _zoneError = error;
    notifyListeners();
  }
  void setReportingOfficeError(String? error) {
    _reportingOfficeError = error;
    notifyListeners();
  }
  void setCityError(String? error) {
    _cityError = error;
    notifyListeners();
  }

  void setClinicalTypeError(String? error) {
    _clinicalType = error;
    notifyListeners();
  }
  void validateFields({
    required String position,
    required String phone,
    required String speciality,
    required String firstName,
    required String lastName,
    required String email,
    required String clinicalType,
    required String repoartingOffice,
   // required String zone,
    required String city
  }) {
    _isFormValid = true;

    validateField(position, 'Please Enter Position', (error) {
      _positionError = error;
      if (error != null) _isFormValid = false;
    });
    validateField(phone, 'Please Enter Phone Number', (error) {
      _phoneError = error;
      if (error != null) _isFormValid = false;
    });
    validateField(speciality, 'Please Enter Speciality', (error) {
      _specialityError = error;
      if (error != null) _isFormValid = false;
    });
    validateField(firstName, 'Please Enter First Name', (error) {
      _firstnameError = error;
      if (error != null) _isFormValid = false;
    });
    validateField(lastName, 'Please Enter Last Name', (error) {
      _lastnameError = error;
      if (error != null) _isFormValid = false;
    });
    validateField(email, 'Please Enter Email', (error) {
      _emailError = error;
      if (error != null) _isFormValid = false;
    });
    validateField(clinicalType, 'Please Select Clinical Type', (error) {
      _clinicalType = error;
      if (error != null) _isFormValid = false;
    });
    // validateField(zone, 'Please Select Zone', (error) {
    //   _zoneError = error;
    //   if (error != null) _isFormValid = false;
    // });
    validateField(repoartingOffice, 'Please Select Reporting Office', (error) {
      _reportingOfficeError = error;
      if (error != null) _isFormValid = false;
    });
    validateField(city, 'Please Select City', (error) {
      _cityError = error;
      if (error != null) _isFormValid = false;
    });

    notifyListeners();
  }
  // void validateFields({required String position,  required String phone,required String speciality,
  //   required String firstName,required String lastName, required String email, required String clinicalType }) {
  //     _isFormValid = true;
  //     _positionError = validateTextField(position, 'Please Enter Position');
  //     _phoneError = validateTextField(phone, 'Please Enter Phone Number');
  //     _specialityError = validateTextField(speciality, 'Please Enter Speciality');
  //     _firstnameError = validateTextField(firstName, 'Please Enter First Name');
  //     _lastnameError = validateTextField(lastName, 'Please Enter Last Name');
  //     _emailError = validateTextField(email, 'Please Enter Email');
  //     _clinicalType = validateTextField(clinicalType, 'Please select clinical type');
  //     //_ZoneError = _validateTextField(selectedZone!, 'Please Select Zone');
  //   notifyListeners();
  // }
  void clearValidationText(){
    _positionError = null;
    _phoneError = null;
    _specialityError = null;
    _firstnameError = null;
    _lastnameError = null;
    _emailError = null;
    _clinicalType = null;
    _reportingOfficeError = null;
    _zoneError = null;
    _cityError = null;
    notifyListeners();
  }
}


class HrProgressMultiStape extends ChangeNotifier{
  bool _isGneralSaved = false;
  bool _isEducationSaved = false;
  bool _isEmployeementSaved = false;
  bool _isLicenseSaved = false;
  bool _isBankingSaved = false;
  bool _isReferenceSaved = false;
  bool _isClicalLicenseSaved = false;
  bool _isHealthRecordSaved = false;
  bool _isAckRecordSaved = false;


  bool get isGneralSaved => _isGneralSaved;
  bool get isEducationSaved => _isEducationSaved;
  bool get isEmployeementSaved => _isEmployeementSaved;
  bool get isLicenseSaved => _isLicenseSaved;
  bool get isBankingSaved => _isBankingSaved;
  bool get isReferenceSaved => _isReferenceSaved;
  bool get isClicalLicenseSaved => _isClicalLicenseSaved;
  bool get isHealthRecordSaved => _isHealthRecordSaved;
  bool get isAckRecordSaved => _isAckRecordSaved;


  void isGeneralChnaged(){
    _isGneralSaved = true;
    notifyListeners();
  }

  void isEducationChnaged(){
    _isEducationSaved = true;
    notifyListeners();
  }

  void isEmployeementChnaged(){
    _isEmployeementSaved = true;
    notifyListeners();
  }

  void isLicenseChnaged(){
    _isLicenseSaved = true;
    notifyListeners();
  }

  void isReferenceChnaged(){
    _isReferenceSaved = true;
    notifyListeners();
  }

  void isBankingChnaged(){
    _isBankingSaved = true;
    notifyListeners();
  }

  void isClinicalLicenseChnaged(){
    _isClicalLicenseSaved = true;
    notifyListeners();
  }

  void isHealthRecordChnaged(){
    _isHealthRecordSaved = true;
    notifyListeners();
  }

  void isAckRecordChnaged(){
    _isAckRecordSaved = true;
    notifyListeners();
  }
}

