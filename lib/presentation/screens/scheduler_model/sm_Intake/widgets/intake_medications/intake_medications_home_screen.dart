import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_medications/widgets/intake_medication_profile/intake_medication_profile_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_medications/widgets/intake_pharmacy_vendor/intake_pharmacy_vendor_screen.dart';
import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/font_manager.dart';

class IntakeMedicationScreen extends StatefulWidget {
  const IntakeMedicationScreen({super.key});

  @override
  State<IntakeMedicationScreen> createState() => _IntakeMedicationScreenState();
}

class _IntakeMedicationScreenState extends State<IntakeMedicationScreen> {
  int selectedIndex = 0;
  final PageController smIntakePageController = PageController();

  void selectButton(int index) {
    setState(() {
      selectedIndex = index;
    });

    smIntakePageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(14),
      child: Column(
        children: [
          SizedBox(height: 15,),
          Container(
            width: MediaQuery.of(context).size.width/5, //4.8
            height: 30,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
                color: ColorManager.blueprime,
                borderRadius: BorderRadius.circular(14)
            ),
            child: Row(
              children: [
                InkWell(
                  child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width / 10,
                    padding: EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20),
                      color: selectedIndex == 0
                          ? Colors.white
                          : null,
                    ),
                    child: Text(
                      'Pharmacy Vendor',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.firaSans(
                        fontSize: 12,
                        fontWeight: FontWeightManager.semiBold,
                        color: selectedIndex == 0
                            ? ColorManager.mediumgrey
                            : Colors.white,
                      ),
                    ),
                  ),
                  onTap: () => selectButton(0),
                ),
                InkWell(
                  child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width / 10,
                    padding: EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedIndex == 1
                          ? Colors.white
                          : null,
                    ),
                    child: Text(
                      'Medication Profile',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.firaSans(
                        fontSize: 12,
                        fontWeight: FontWeightManager.semiBold,
                        color: selectedIndex == 1
                            ? ColorManager.mediumgrey
                            : Colors.white,
                      ),
                    ),
                  ),
                  onTap: () => selectButton(1),
                ),
                // InkWell(
                //   child: Container(
                //     height: 30,
                //     width: MediaQuery.of(context).size.width / 10,
                //     padding: EdgeInsets.symmetric(vertical: 6),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: selectedIndex == 2
                //           ? Colors.white
                //           : null,
                //     ),
                //     child: Text(
                //       'Physician Orders',
                //       textAlign: TextAlign.center,
                //       style: GoogleFonts.firaSans(
                //         fontSize: 12,
                //         fontWeight: FontWeightManager.semiBold,
                //         color: selectedIndex == 2
                //             ? ColorManager.mediumgrey
                //             : Colors.white,
                //       ),
                //     ),
                //   ),
                //   onTap: () => selectButton(2),
                // ),
                // InkWell(
                //   child: Container(
                //     height: 30,
                //     width: MediaQuery.of(context).size.width / 9.5,
                //     padding: EdgeInsets.symmetric(vertical: 6),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: selectedIndex == 3
                //           ? Colors.white
                //           : null,
                //     ),
                //     child: Text(
                //       'Face To Face',
                //       textAlign: TextAlign.center,
                //       style: GoogleFonts.firaSans(
                //         fontSize: 12,
                //         fontWeight: FontWeightManager.semiBold,
                //         color: selectedIndex == 3
                //             ? ColorManager.mediumgrey
                //             : Colors.white,
                //       ),
                //     ),
                //   ),
                //   onTap: () => selectButton(3),
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                //horizontal: MediaQuery.of(context).size.width / 45,
                  vertical: 5),
              child: PageView(
                  controller: smIntakePageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    IntakePharmacyVendorScreen(),
                    IntakeMedicationProfileScreen(),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}