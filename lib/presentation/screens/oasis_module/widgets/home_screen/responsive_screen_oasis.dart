import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/oasis_module/charts/charts_detail_screen/charts_detail_screen.dart';

import '../../../../../app/resources/screen_route_name.dart';
import '../../../../../app/resources/value_manager.dart';

class OasisScreenEMR extends StatelessWidget {
  static String routeName = RouteStrings.EMRDesktop;
  const OasisScreenEMR({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 800) {
          return HomeScreenEMR();
        } else {
          return Container(
            color: Colors.white,
            height: AppSize.s100,
            width: AppSize.s500,
            child: Center(
              child: Text(
                'Tablet Screen EMR',
                style: TextStyle(fontSize: AppSize.s20),
              ),
            ),
          );
        }
      },
    );
  }
}

class HomeScreenEMR extends StatefulWidget {
  const HomeScreenEMR({super.key});

  @override
  State<HomeScreenEMR> createState() => _HomeScreenEMRState();
}

class _HomeScreenEMRState extends State<HomeScreenEMR> {
  @override
  Widget build(BuildContext context) {
    return ChartsDetailScreen();

    ///todo change this with original path
    // return EMRDesktopScreen();
  }
}
