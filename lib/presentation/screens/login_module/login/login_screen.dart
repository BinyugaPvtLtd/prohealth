import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/provider/version_provider.dart';
import 'package:prohealth/presentation/screens/login_module/login/widgets/login_mobile.dart';
import 'package:prohealth/presentation/screens/login_module/login/widgets/login_tablet.dart';
import 'package:prohealth/presentation/screens/login_module/login/widgets/login_web.dart';
import 'package:prohealth/presentation/widgets/responsive_screen.dart';
import 'package:provider/provider.dart';

import '../../../../app/constants/app_config.dart';
import '../../../../app/services/api/managers/version_manager/version_api_manager.dart';
import '../../../../data/api_data/version/version_model_data.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/logIn";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<VersionData> getApplicationVersionData(BuildContext context) async {
    VersionData versionData = await getApplicationVersion(context);
    if (versionData.versionName != AppConfig.version) {
      print("Not Matching ${versionData.versionName}");
      Provider.of<VersionProviderManager>(context, listen: false).refreshText(
          'A new version ${versionData.versionName} is available!\n Please refresh your browser or clear your cache to get the latest updates.');
      _showUpdateDialog;
      fetched = false;
    } else {
      Provider.of<VersionProviderManager>(context, listen: false)
          .refreshText('');
    }
    return versionData;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApplicationVersionData(context);
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("New Update Available"),
        content: Text(
            "A new version of the app is available. Please refresh to update."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Later"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _reloadPage();
            },
            child: Text("Refresh"),
          ),
        ],
      ),
    );
  }

  void _reloadPage() {
    html.window.location.reload();
  }

  bool fetched = true;

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreen(
        mobile: LoginMobile(),
        web: const LoginWeb(),
        tablet: const LoginTablet());
  }
}
