import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/presentation/widgets/app_bar/app_bar.dart';

import '../../../../../oasis_form_builder/oasis_form_builder.dart';

class ChartsDetailScreen extends StatefulWidget {
  const ChartsDetailScreen({super.key});

  @override
  State<ChartsDetailScreen> createState() => _ChartsDetailScreenState();
}

class _ChartsDetailScreenState extends State<ChartsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: ApplicationAppBar(
          headingText: 'Home-Health EMR',
        ),
        preferredSize: Size(double.maxFinite, 100),
      ),
      body: Row(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                ),
              ),
              Expanded(
                flex: 12,
                child: Container(
                  width: 250,
                  color: ColorManager.blueprime,
                ),
              ),
            ],
          ),
          Expanded(
            flex: 5,
            child: OasisFormBuilder(),
          ),
        ],
      ),
    );
  }
}
