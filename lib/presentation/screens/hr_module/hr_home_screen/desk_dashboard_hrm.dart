import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/hr_module/hr_home_screen/home_hr.dart';
import 'package:provider/provider.dart';

import '../../../../app/resources/provider/hr_search_provider.dart';

///saloni
class HomeScreenHRM extends StatefulWidget {
  const HomeScreenHRM({super.key});

  @override
  State<HomeScreenHRM> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenHRM> {
  @override
  Widget build(BuildContext context) {
    final providerState = Provider.of<HrSearchProviderManager>(context,listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      providerState.clearFilter();
    });
    return HomeHrScreen();
  }
}
