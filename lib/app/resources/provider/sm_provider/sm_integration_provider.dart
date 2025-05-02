import 'package:flutter/material.dart';

class SmIntegrationProviderManager extends ChangeNotifier{
  int _patientId = 0;
  int get patientId => _patientId;

  void passPatientId({required int patientIdNo}){
    _patientId = patientIdNo;
    notifyListeners();
  }
  void passPatientIdClear(){
    _patientId = 0;
    notifyListeners();
  }
}