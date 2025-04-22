import 'package:flutter/material.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_insurance/widgets/intake_insurance_primary/intake_insurance_primary_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_insurance/widgets/intake_insurance_secondary/intake_insurance_secondary_screen.dart';
import 'package:prohealth/presentation/screens/scheduler_model/sm_Intake/widgets/intake_insurance/widgets/save_page/insurance_save_page.dart';
import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../../../app/resources/font_manager.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../widgets/constant_widgets/schedular_success_popup.dart';

class IntakeInsuranceScreen extends StatefulWidget {
  final int patientId;
  const IntakeInsuranceScreen({super.key, required this.patientId,});

  @override
  State<IntakeInsuranceScreen> createState() => _IntakeInsuranceScreenState();
}

class _IntakeInsuranceScreenState extends State<IntakeInsuranceScreen> {
  int selectedIndex = 0;
  final PageController smIntakePageController = PageController();


  bool isShowingInsuranceSavePage = false;
  void switchToInsuranceSavePage() {
    setState(() {
      isShowingInsuranceSavePage = true;
    });
  }

  void goBackToInsuranceTabView() {
    setState(() {
      isShowingInsuranceSavePage = false;
    });
  }

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
     return Column(
          children: [
            SizedBox(height: AppSize.s25,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: AppSize.s30,
                    width: AppSize.s315,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.blueprime,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Shift & Batch Button
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () => selectButton(0),
                          child: Container(
                            height: AppSize.s30,
                            width: AppSize.s160,
                            decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                              color: selectedIndex == 0
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                'Primary',
                                style: BlueBgTabbar.customTextStyle(
                                    0, selectedIndex),
                              ),
                            ),
                          ),
                        ),
                        // Define Holiday Button
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () => selectButton(1),
                          child: Container(
                            height: AppSize.s30,
                            width: AppSize.s155,
                            decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                              color: selectedIndex == 1
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                'Secondary',
                                style: BlueBgTabbar.customTextStyle(
                                    1, selectedIndex),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ///
                  // SizedBox(width: MediaQuery.of(context).size.width / 5),
                  // if (selectedIndex == 0)
                  //   Container(
                  //     height: AppSize.s26,
                  //     width: AppSize.s102,
                  //     child: ElevatedButton(
                  //       onPressed: () async {
                  //         final companyId = await TokenManager.getCompanyId();
                  //         // String? dateOfDeath = ctlrDateOfDeath.text.isEmpty ? null : ctlrDateOfDeath.text;
                  //         ApiData result = await IntakeInfoSave(
                  //           context,
                  //           ctlrSos.text,
                  //           //"2024-08-12",
                  //           ctlrMedicalRecord.text,
                  //           selectedStatus!.toString() ?? '',
                  //           // 'Pending',
                  //           ctlrfirstName.text,
                  //           ctlrLastName.text,
                  //           ctlrMI.text,
                  //           ctlrSuffix.text,
                  //           statusType ?? '',
                  //           //"2024-08-12",
                  //           ctlrDate.text,
                  //           ctlrStreet.text,
                  //           selectedState!.toString(),
                  //           // "291000",//
                  //           ctlrZipCode.text,
                  //           ctlrApartment.text,
                  //           selectedcity!.toString(),
                  //           selectedCountry.toString() ?? '',
                  //           ctlrMajorStreet.text,
                  //           ctlrPrimeNo.text,
                  //           ctlrSecNo.text,
                  //           ctlrEmail.text,
                  //           ctlrSocialSec.text,
                  //           selectedLanguage.toString() ?? '',
                  //           ctlrDischargeResaon.text,
                  //           selectedRace.toString() ?? '',
                  //           selectedReligion.toString() ?? '',
                  //           selectedMaritalStatus.toString() ?? '',
                  //           //"2024-08-12",
                  //           // ctlrDateOfDeath.text,    //  :"2024-08-14T00:00:00Z",
                  //           ctlrDateOfDeath.text.isEmpty
                  //               ? null
                  //               : ctlrDateOfDeath.text,
                  //           0,
                  //           'At Land OSC',
                  //           'case',
                  //           'Type',
                  //           companyId,
                  //         );
                  //
                  //         if (result.success) {
                  //           patientId = result.patientId!;
                  //           widget.onPatientIdGenerated(patientId);
                  //           ctlrMedicalRecord.clear();
                  //           ctlrfirstName.clear();
                  //           ctlrLastName.clear();
                  //           ctlrMI.clear();
                  //           ctlrSuffix.clear();
                  //           ctlrStreet.clear();
                  //           ctlrZipCode.clear();
                  //           ctlrApartment.clear();
                  //           ctlrCity.clear();
                  //           ctlrMajorStreet.clear();
                  //           ctlrPrimeNo.clear();
                  //           ctlrSecNo.clear();
                  //           ctlrEmail.clear();
                  //           ctlrSocialSec.clear();
                  //           ctlrDischargeResaon.clear();
                  //         } else {}
                  //       },
                  //       child: Text(
                  //         AppString.save,
                  //         style: CustomTextStylesCommon.commonStyle(
                  //           fontSize: FontSize.s14,
                  //           fontWeight: FontWeight.w700,
                  //           color: ColorManager.white,
                  //         ),
                  //       ),
                  //       style: ElevatedButton.styleFrom(
                  //         padding: const EdgeInsets.symmetric(
                  //           horizontal: 25,
                  //           vertical: 10,
                  //         ),
                  //         backgroundColor: ColorManager.blueprime,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(12),
                  //         ),
                  //       ),
                  //     ),
                  //   )
                  // else
                  //   SizedBox(width: AppSize.s80),
                ]),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  //horizontal: MediaQuery.of(context).size.width / 45,
                    vertical: 5),
                child:isShowingInsuranceSavePage
                    ? InsuranceSavePage(
                  patientId: widget.patientId,
                  onBack: goBackToInsuranceTabView,
                )
                    : PageView(
                    controller: smIntakePageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      IntakePrimaryScreen(patientId: widget.patientId,
                        onSave: switchToInsuranceSavePage,

                      ),
                      IntakeSecondaryScreen(patientId: widget.patientId,),
                    ]),
              ),
            ),
          ],
        );
  }
}
