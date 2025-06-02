import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/provider/hr_onboarding_provider.dart';
import 'package:prohealth/app/resources/provider/hr_register_provider.dart';
import 'package:prohealth/app/resources/provider/hr_search_provider.dart';
import 'package:prohealth/app/resources/provider/navigation_provider.dart';
import 'package:prohealth/app/resources/provider/office_location.dart';
import 'package:prohealth/app/resources/provider/office_location.dart';
import 'package:prohealth/app/resources/provider/version_provider.dart';
import 'package:prohealth/app/services/token/token_manager.dart';
import 'package:prohealth/presentation/screens/em_module/manage_hr/manage_work_schedule/work_schedule/define_holidays.dart';
import 'package:prohealth/presentation/screens/hr_module/add_employee/widget/dateprovider.dart';
import 'package:prohealth/presentation/screens/hr_module/register/offer_letter_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_demographics/widgets/patients_plan_care/planer_notifier.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_demographics/widgets/patients_related_party/intake_patients_related_party.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_orders/intake_orders_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_refferal/widgets/refferal_pending_widgets/r_p_eye_pageview_screen.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'app/resources/provider/em_provider/em_main_provider.dart';
import 'app/resources/provider/sm_provider/sm_integration_provider.dart';
import 'app/resources/provider/sm_provider/sm_slider_provider.dart';
import 'oasis_form_builder/services/provider/form_builder_provider.dart';
import 'presentation/screens/hr_module/hr_home_screen/referesh_provider.dart';

Future<void> main() async {
  bool token = await checkToken();

  //
  // // Check if the page has been reloaded recently
  // if (html.window.localStorage['isRefreshed'] != 'true') {
  //   html.window.localStorage['isRefreshed'] = 'true'; // Mark as refreshed
  //   html.window.location.reload(); // Reload the page
  //   return; // Stop execution to prevent duplicate app initialization
  // }
  //
  // // Reset flag after reload
  // html.window.localStorage.remove('isRefreshed');
  //



  if (isChrome()) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => EmMainProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => DateProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ContainerProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => RouteProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => PageIndexProvider(),
          ),
          // ChangeNotifierProvider(create: (_) => SeeAllPaginationProvider(itemsPerPage: 10),),
          // ChangeNotifierProvider(create: (_) => SeeAllProvider()),
          // ChangeNotifierProvider(create: (_) => UserCreationProvider()),
          // ChangeNotifierProvider(create: (_) =>  ButtonProvider()),
          // ChangeNotifierProvider(create: (context) => DeleteUserProvider()),

          // ChangeNotifierProvider(
          //   create: (_) => EditUserProvider(),
          // ),
          ChangeNotifierProvider(create: (context) => VersionProviderManager()),
          ChangeNotifierProvider(create: (_) => DefineHolidaysProvider()),
          ChangeNotifierProvider(create: (_) => HrSearchProviderManager()),
          ChangeNotifierProvider(create: (_) => LocationProvider()),
          ChangeNotifierProvider(create: (_) => HrManageProvider()),
          ChangeNotifierProvider(create: (_) => HrRegisterProvider()),
          ChangeNotifierProvider(create: (_) => HrEnrollEmployeeProvider()),
          ChangeNotifierProvider(create: (_) => HrEnrollOfferLatterProvider()),
          ChangeNotifierProvider(create: (_) => HrOnboardingProvider()),
          ChangeNotifierProvider(create: (_) => FormBuilderProvider()),
          ChangeNotifierProvider(create: (_) => HrProgressMultiStape()),
          ChangeNotifierProvider(create: (_) => SmIntakeProviderManager()),
          ChangeNotifierProvider(create: (_) => PriDiagnosisProvider()),
          // ChangeNotifierProvider(create: (_) => SmIntegrationProviderManager()),
          ChangeNotifierProvider(create: (_) => DiagnosisProvider()),
          ChangeNotifierProvider(create: (_) => EmergencyContactProvider()),


          ChangeNotifierProvider(
              create: (context) => AddressProvider(
                  controller: '' as TextEditingController,
                  onChange: '' as Function(String p1)?))
        ],

        child: App(
          signedIn: token,
        ),
        //child: NonChromeApp(),
      ),
    );
  } else {
    runApp(NonChromeApp());
  }

  // runApp(
  //     ChangeNotifierProvider(
  //         create: (context) => DateProvider(),
  //    child: App(
  //       signedIn: token,
  //     )
  // ));
}

// Function to detect if the browser is Chrome
bool isChrome() {
  final userAgent = html.window.navigator.userAgent.toLowerCase();

  // Check for Chrome, but exclude Edge and Opera
  bool isChrome = userAgent.contains('chrome') &&
      !userAgent.contains('edg') &&
      !userAgent.contains('opr');

  // Additional check: Chrome should have 'google' in the vendor property
  bool isGoogleVendor =
      html.window.navigator.vendor.toLowerCase().contains('google');

  return isChrome && isGoogleVendor;
}

// Show a message if the browser is not Chrome
void showNotSupportedMessage() {
  html.document.body!.innerHtml = '''
    <h1>This application is supported only in Google Chrome.</h1>
    <p>Please open this application using Google Chrome.</p>
  ''';
}

Future<bool> checkToken() async {
  String token = await TokenManager.getAccessToken();
  if (token.isEmpty) {
    return false;
  } else {
    return true;
  }
}
