import 'package:flutter/material.dart';
import 'package:prohealth/data/api_data/hr_module_data/add_employee/clinical.dart';
import 'package:prohealth/data/api_data/version/version_model_data.dart';

import '../../services/api/managers/version_manager/version_api_manager.dart';

class VersionProviderManager extends ChangeNotifier{
  String _versionText = '';
  String _refreshVersionText = '';
  String get versionText => _versionText;
  String get refreshVersionText => _refreshVersionText;

  Future<void> getVersionManager(BuildContext context) async{
    VersionData versionData = await getApplicationVersion(context);
    _versionText = versionData.versionName;
    notifyListeners();
  }

  void refreshText(){
    _refreshVersionText = 'Please refresh your browser for new version.';
    notifyListeners();
  }
}