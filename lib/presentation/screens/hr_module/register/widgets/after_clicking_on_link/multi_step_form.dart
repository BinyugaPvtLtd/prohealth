import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:prohealth/app/resources/provider/hr_register_provider.dart';
import 'package:prohealth/presentation/screens/hr_module/register/widgets/after_clicking_on_link/thank_you_screen.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/constants/app_config.dart';
import '../../../../../../app/resources/color.dart';
import '../../../../../../app/resources/hr_resources/hr_theme_manager.dart';
import '../../../../../../app/resources/value_manager.dart';
import '../../../../../../app/services/token/token_manager.dart';
import '../../../manage/widgets/bottom_row.dart';
import '../../../manage/widgets/custom_icon_button_constant.dart';
import '../../../manage/widgets/top_row.dart';
import '../../taxtfield_constant.dart';
import '../dropdown_const.dart';
import 'constant_in_all.dart';
import 'form_screen/form_acknowledgements_screen.dart';
import 'form_screen/form_banking_screen.dart';
import 'form_screen/form_clinical_license.dart';
import 'form_screen/form_educaton_screen.dart';
import 'form_screen/form_employment_screen.dart';
import 'form_screen/form_general_Screen.dart';
import 'form_screen/form_health_records_screen.dart';
import 'form_screen/form_legal_documents_screen.dart';
import 'form_screen/form_licenses_screen.dart';
import 'form_screen/form_reference_screen.dart';

class MultiStepForm extends StatefulWidget {
  final int depID;
  final int employeeID;

  const MultiStepForm({super.key, required this.employeeID, required this.depID, });
  @override
  _MultiStepFormState createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  double textFieldWidth = 430;
  double textFieldHeight = 38;

  TextEditingController firstName = TextEditingController();

  ///
  // TextEditingController _controller = TextEditingController();
  // TextEditingController _controllerIssueDate = TextEditingController();
  // TextEditingController _controllerExpirationDate = TextEditingController();
  // Current step in the stepper
  int _currentStep = 0;

  bool isChecked = false;

  bool get isFirstStep => _currentStep == 0;
  bool _isEducationSaved = false;
  bool _isEmployeementSaved = false;
  bool _isLicenseSaved = false;
  bool _isBankingSaved = false;
  bool _isReferenceSaved = false;
  bool _isClicalLicenseSaved = false;
  bool _isHealthRecordSaved = false;
  bool _isAckRecordSaved = false;

  bool get isLastStep => _currentStep == steps().length - 1;
  bool isCompleted = false;
  // String? _selectedCountry;
  // String? _selectedClinician;
  // String? _selectedSpeciality;
  // String? _selectedDegree;
  // bool _passwordVisible = false;
  // String? _selectedType;
  // String? _selectedType1;
// Navigator.push(context, MaterialPageRoute(builder: (context)=>MultiStepForm()));
  @override
  Widget build(BuildContext context) {

    return
      isCompleted
          ? OnBoardingThankYou()
          :
      Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: TopRowConstant(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Details",
                    style: FormHeading.customTextStyle(context),
                  ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: const Color(0xff50B5E5),
                  //     foregroundColor: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //   ),
                  //   onPressed: () {},
                  //   child: Text(
                  //     "Save Progress",
                  //     style: GoogleFonts.firaSans(
                  //       fontSize: 14.0,
                  //       fontWeight: FontWeight.w700,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSize.s5,
            ),
            Container(
              // height: MediaQuery.of(context).size.height / 4,
              // width: MediaQuery.of(context).size.width / 1.1,
              // color: Colors.yellow,
              child: Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent
                    ),
                    child: Stepper(
                      physics: const ScrollPhysics(),
                      type: StepperType.horizontal,
                      steps: steps(),
                      currentStep: _currentStep,
                      onStepContinue: () {
                        if (isLastStep) {
                          setState(() => isCompleted = true);
                        } else {
                          setState(() => _currentStep += 1);
                        }
                      },
                      onStepCancel: isFirstStep
                          ? null
                          : () => setState(() => _currentStep -= 1),
                      controlsBuilder: (context, details) => Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!isFirstStep) ...[
                              const SizedBox(
                                width: 20,
                              ),
                              // ElevatedButton.icon(
                              //   style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.white,
                              //     foregroundColor: const Color(0xff1696C8),
                              //     side: const BorderSide(color: Color(0xff1696C8)),
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(8),
                              //     ),
                              //   ),
                              //   onPressed: details.onStepCancel,
                              //   label: Text(
                              //     "Back",
                              //     style: GoogleFonts.firaSans(
                              //       fontSize: 12.0,
                              //       fontWeight: FontWeight.w700,
                              //       //color: Colors.white,
                              //     ),
                              //   ),
                              //   icon: const Icon(Icons.arrow_back,  size: 16,),
                              // )
                              SizedBox(),
                              // Container(
                              //   width: 20,
                              //   height: 20,
                              //   alignment: Alignment.center,
                              //   decoration: BoxDecoration(
                              //     color:ColorManager.blueprime,
                              //     shape: BoxShape.rectangle,
                              //     borderRadius: BorderRadius.circular(4),
                              //     border: Border.all(
                              //       color: ColorManager.fmediumgrey.withOpacity(0.2),
                              //       // width: 0.79,
                              //     ),
                              //   ),
                              //   child: Center(
                              //     child: IconButton(
                              //       splashColor: Colors.transparent,
                              //       hoverColor: Colors.transparent,
                              //       highlightColor: Colors.transparent,
                              //       padding: EdgeInsets.only(bottom: 1.5),
                              //       icon: Icon(Icons.chevron_left),
                              //       onPressed:  details.onStepCancel,
                              //       color: Colors.white,
                              //       iconSize: 20,
                              //     ),
                              //   ),
                              // ),
                              // InkWell(
                              //   splashColor: Colors.transparent,
                              //   highlightColor: Colors.transparent,
                              //   child: Center(
                              //     child: Icon(
                              //       Icons.arrow_back,
                              //       color: ColorManager.black,
                              //       size: 20,
                              //     ),
                              //   ),
                              //   onTap: details.onStepCancel,
                              // )
                            ],
                            SizedBox(),
                            // Container(
                            //   width: 20,
                            //   height: 20,
                            //   alignment: Alignment.center,
                            //   decoration: BoxDecoration(
                            //     color:ColorManager.blueprime,
                            //     shape: BoxShape.rectangle,
                            //     borderRadius: BorderRadius.circular(4),
                            //     border: Border.all(
                            //       color: ColorManager.fmediumgrey.withOpacity(0.2),
                            //       // width: 0.79,
                            //     ),
                            //   ),
                            //   child: Center(
                            //     child: IconButton(
                            //       splashColor: Colors.transparent,
                            //       hoverColor: Colors.transparent,
                            //       highlightColor: Colors.transparent,
                            //       padding: EdgeInsets.only(bottom: 1.5),
                            //       icon: Icon(Icons.chevron_right),
                            //       onPressed:()async{
                            //         isLastStep ? Navigator.push(context, MaterialPageRoute(builder: (_)=>OnBoardingThankYou())): details.onStepContinue!();
                            //       },
                            //       color: Colors.white,
                            //       iconSize: 20,
                            //     ),
                            //   ),
                            // ),
                            // InkWell(
                            //     splashColor: Colors.transparent,
                            //     highlightColor: Colors.transparent,
                            //     child: Center(
                            //       child: Icon(
                            //         Icons.arrow_forward,
                            //         color: ColorManager.bluelight,
                            //         size: 20,
                            //       ),
                            //     ),
                            //     onTap:()async{
                            //       isLastStep ? Navigator.push(context, MaterialPageRoute(builder: (_)=>OnBoardingThankYou())): details.onStepContinue!();
                            //     }
                            // ),



                            // Container(
                            //   height: 30,
                            //   width: 140,
                            //   child: CustomIconButton(
                            //     icon: Icons.arrow_forward_rounded,
                            //     text: isLastStep ? 'Submit' : 'Continue',
                            //     onPressed: () async{
                            //       //details.onStepContinue!();
                            //       isLastStep ? Navigator.push(context, MaterialPageRoute(builder: (_)=>OnBoardingThankYou())): details.onStepContinue!();
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      onStepTapped: (step) =>
                          setState(() => _currentStep = step),
                    ),
                  ),
                ),
              ),
            ),
            // const Row(
            //   children: [BottomBarRow()],
            // )
          ],
        ),
        bottomNavigationBar: BottomBarRow(),
      );
  }



  List<Step> steps() {
    final providerState = Provider.of<HrProgressMultiStape>(context,listen: false);
    List<Step> stepsList = [
      // General step
      Step(
        state: _currentStep <= 0 ? StepState.editing : StepState.complete,
        isActive: _currentStep >= 0,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'General',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: generalForm(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // Employment step
      Step(
        state:  _isEmployeementSaved ? StepState.complete : StepState.editing,
        isActive: _currentStep >= 1,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'Employment',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: EmploymentScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
            _currentStep = _currentStep + 1;
              _isEmployeementSaved = true;
            });
          },
          onBack: () {
            setState(() {
              _currentStep = _currentStep - 1;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // Education step
      Step(
        state: providerState.isEducationSaved ? StepState.complete : StepState.editing,
        isActive: _currentStep >= 2,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'Education',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: EducationScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
             _currentStep = _currentStep + 1;
              providerState.isEducationChnaged();
            });
          },
          onBack: () {
            setState(() {
              _currentStep = _currentStep - 1;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // References step
      Step(
        state:  _isReferenceSaved ? StepState.complete : StepState.editing,
        isActive: _currentStep >= 3,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'References',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: ReferencesScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
              _currentStep = _currentStep + 1;
              _isReferenceSaved = true;
            });
          },
          onBack: () {
            setState(() {
              _currentStep = _currentStep - 1;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // Licenses step
      Step(
        state: _isLicenseSaved ? StepState.complete : StepState.editing,
        isActive: _currentStep >= 4,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'Licenses',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: LicensesScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
              _currentStep = _currentStep + 1;
              _isLicenseSaved = true;
            });
          },
          onBack: () {
            setState(() {
              _currentStep = _currentStep - 1;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // Conditionally add Clinical License if depID matches clinicalId
        Step(
          state: _isClicalLicenseSaved ? StepState.complete : StepState.editing,
          isActive: _currentStep >= 5,
          title: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: Text(
              'Clinical\nLicense',
              style: formNameText.customTextStyle(context),
            ),
          ),
          content: Clinical_licenses(
            context: context,
            employeeID: widget.employeeID,
            onSave: () {
              setState(() {
                _currentStep = _currentStep + 1;
                _isClicalLicenseSaved = true;
              });
            },
            onBack: () {
              setState(() {
                _currentStep = _currentStep - 1;
              });
            },
            onNext: () {
              setState(() {
                _currentStep = _currentStep + 1;
              });
            },
          ),
        ),
      // Banking step

      Step(

        state:  _isBankingSaved ? StepState.complete : StepState.editing,
        isActive: _currentStep >= 6,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'Banking',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: BankingScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            //print(">>>>>>>${_currentStep}");
            setState(() {
              _currentStep = _currentStep + 1;
              _isBankingSaved = true; // Mark education data as saved
            });
          },
          onBack: () {
            print(">>>>>>>${_currentStep}");
            setState(() {
              _currentStep = _currentStep - 1;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // Health Records step
      Step(
        state: _isHealthRecordSaved ? StepState.complete : StepState.editing,
        isActive: _currentStep >= 7,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'Health \nRecords',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: HealthRecordsScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
              _currentStep = _currentStep + 1;
              _isHealthRecordSaved = true;
            });
          },
          onBack: () {
            setState(() {
              _currentStep = _currentStep - 1;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // Acknowledgements step
      Step(
        state: _isAckRecordSaved ? StepState.complete : StepState.editing,
        isActive: _currentStep >= 8,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'Acknowledgements',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: AcknowledgementsScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
              _currentStep = _currentStep + 1;
              _isAckRecordSaved = true;
            });
          },
          onBack: () {
            setState(() {
              _currentStep = _currentStep - 1;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // Legal Documents step
      Step(
        state: _currentStep <= 9 ? StepState.editing : StepState.complete,
        isActive: _currentStep >= 9,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'Legal \nDocuments',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: LegalDocumentsScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => OnBoardingThankYou()),
              );
            });
          },
          onBack: () {
            setState(() {
              _currentStep = _currentStep - 1;
            });
          },
        ),
      ),
    ];
    List<Step> stepsLista = [
      // General step
      Step(
        state: _currentStep <= 0 ? StepState.editing : StepState.complete,
        isActive: _currentStep >= 0,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'General',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: generalForm(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // Employment step
      Step(
        state: _isEmployeementSaved ? StepState.complete : StepState.editing,
        isActive: _currentStep >= 1,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'Employment',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: EmploymentScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
              _currentStep = _currentStep + 1;
              _isEmployeementSaved = true;
            });
          },
          onBack: () {
            setState(() {
              _currentStep = _currentStep - 1;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // Education step
      Step(
        state: _isEducationSaved ? StepState.complete : StepState.editing,
        isActive: _currentStep >= 2,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'Education',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: EducationScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
              _currentStep = _currentStep + 1;
              _isEducationSaved = true;
            });
          },
          onBack: () {
            setState(() {
              _currentStep = _currentStep - 1;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // References step
      Step(
        state: _isReferenceSaved ? StepState.complete : StepState.editing,
        isActive: _currentStep >= 3,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'References',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: ReferencesScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
              _currentStep = _currentStep + 1;
              _isReferenceSaved = true;
            });
          },
          onBack: () {
            setState(() {
              _currentStep = _currentStep - 1;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // Licenses step
      Step(
        state: _isLicenseSaved ? StepState.complete : StepState.editing,
        isActive: _currentStep >= 4,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'Licenses',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: LicensesScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
              _currentStep = _currentStep + 1;
              _isLicenseSaved = true;
            });
          },
          onBack: () {
            setState(() {
              _currentStep = _currentStep - 1;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // Conditionally add Clinical License if depID matches clinicalId
      // if (widget.depID == AppConfig.clinicalId)
      //   Step(
      //     state: _currentStep <= 5 ? StepState.editing : StepState.complete,
      //     isActive: _currentStep >= 5,
      //     title: Theme(
      //       data: ThemeData(
      //         splashColor: Colors.transparent,
      //         highlightColor: Colors.transparent,
      //       ),
      //       child: Text(
      //         'Clinical\nLicense',
      //         style: formNameText.customTextStyle(context),
      //       ),
      //     ),
      //     content: Clinical_licenses(
      //       context: context,
      //       employeeID: widget.employeeID,
      //       onSave: () {
      //         setState(() {
      //           _currentStep = _currentStep + 1;
      //         });
      //       },
      //       onBack: () {
      //         setState(() {
      //           _currentStep = _currentStep - 1;
      //         });
      //       },
      //       onNext: () {
      //         setState(() {
      //           _currentStep = _currentStep + 1;
      //         });
      //       },
      //     ),
      //   ),
      // Banking step

      Step(

        state: _isBankingSaved ? StepState.complete : StepState.editing,
        isActive: _currentStep >= 5,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'Banking',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: BankingScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            //print(">>>>>>>${_currentStep}");
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
          onBack: () {
            print(">>>>>>>${_currentStep}");
            setState(() {
              _currentStep = _currentStep - 1;
              _isBankingSaved = true;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // Health Records step
      Step(
        state:  _isHealthRecordSaved ? StepState.complete : StepState.editing,
        isActive: _currentStep >= 6,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'Health \nRecords',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: HealthRecordsScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
              _currentStep = _currentStep + 1;
              _isHealthRecordSaved = true;
            });
          },
          onBack: () {
            setState(() {
              _currentStep = _currentStep - 1;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // Acknowledgements step
      Step(
        state: _isAckRecordSaved ? StepState.complete : StepState.editing,
        isActive: _currentStep >= 7,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'Acknowledgements',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: AcknowledgementsScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
              _currentStep = _currentStep + 1;
              _isAckRecordSaved = true;
            });
          },
          onBack: () {
            setState(() {
              _currentStep = _currentStep - 1;
            });
          },
          onNext: () {
            setState(() {
              _currentStep = _currentStep + 1;
            });
          },
        ),
      ),
      // Legal Documents step
      Step(
        state: _currentStep <= 8 ? StepState.editing : StepState.complete,
        isActive: _currentStep >= 8,
        title: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Text(
            'Legal \nDocuments',
            style: formNameText.customTextStyle(context),
          ),
        ),
        content: LegalDocumentsScreen(
          context: context,
          employeeID: widget.employeeID,
          onSave: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => OnBoardingThankYou()),
              );
            });
          },
          onBack: () {
            setState(() {
              _currentStep = _currentStep - 1;
            });
          },
        ),
      ),
    ];


if(widget.depID == AppConfig.clinicalId) {
  return stepsList;
}else{
  return stepsLista;
}
  }
// List<Step> steps() {
//     List<Step> stepsList =[
//       ///
//       Step(
//         state: _currentStep <= 0 ? StepState.editing : StepState.complete,
//         isActive: _currentStep >= 0,
//         title: Theme(
//           data: ThemeData(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//           ),
//           child: Text(
//             'General',
//             style: formNameText.customTextStyle(context),
//           ),
//         ),
//         content: generalForm(context: context, employeeID: widget.employeeID,
//           onSave:(){
//           // details.onStepContinue!();
//           setState(() {
//             _currentStep = _currentStep +1 ;
//           });
//         },
//           onNext: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//
//           //   onBack: (){
//           //   setState(() {
//           //     _currentStep = _currentStep -1;
//           //   });
//           // },
//         ),
//       ),
//       ////////////////////////////
//       Step(
//         state: _currentStep <= 1 ? StepState.editing : StepState.complete,
//         isActive: _currentStep >= 1,
//         title: Theme(
//           data: ThemeData(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//           ),
//           child: Text(
//             'Employment',
//             style:  formNameText.customTextStyle(context),
//           ),
//         ),
//         content: EmploymentScreen(context: context, employeeID: widget.employeeID,
//           onSave: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//           onBack:(){
//             setState(() {
//               _currentStep = _currentStep -1;
//             });
//           },
//           onNext: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//         ),
//       ),
//       /////////////////
//       Step(
//         state: _currentStep <= 2 ? StepState.editing : StepState.complete,
//         isActive: _currentStep >= 2,
//         title: Theme(
//           data: ThemeData(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//           ),
//           child: Text(
//             'Education',
//             style:  formNameText.customTextStyle(context),
//           ),
//         ),
//         content: EducationScreen(context: context, employeeID: widget.employeeID,
//           onSave: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//           onBack:(){
//             setState(() {
//               _currentStep = _currentStep -1;
//             });
//           },
//           onNext: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//         ),
//       ),
//       //////////////////
//       Step(
//         state: _currentStep <= 3 ? StepState.editing : StepState.complete,
//         isActive: _currentStep >= 3,
//         title: Theme(
//           data: ThemeData(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//           ),
//           child: Text(
//             'References',
//             style:  formNameText.customTextStyle(context),
//           ),
//         ),
//         content: ReferencesScreen(context: context, employeeID: widget.employeeID,
//           onSave: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//           onBack:(){
//             setState(() {
//               _currentStep = _currentStep -1;
//             });
//           },
//           onNext: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//         ),
//       ),
//       ///////////////////
//       Step(
//         state: _currentStep <= 4 ? StepState.editing : StepState.complete,
//         isActive: _currentStep >= 4,
//         title: Theme(
//           data: ThemeData(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//           ),
//           child: Text(
//             'Licenses',
//             style: formNameText.customTextStyle(context),
//           ),
//         ),
//         content: LicensesScreen(context: context, employeeID: widget.employeeID,
//           onSave: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//           onBack:(){
//             setState(() {
//               _currentStep = _currentStep -1;
//             });
//           },
//           onNext: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//         ),
//       ),
//       /////////////
//       if (widget.depID == AppConfig.clinicalId)
//       Step(
//         state: _currentStep <= 5 ? StepState.editing : StepState.complete,
//         isActive: _currentStep >= 5,
//         title: Theme(
//           data: ThemeData(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//           ),
//           child: Text(
//             'Clinical\nLicense',
//             style: formNameText.customTextStyle(context),
//           ),
//         ),
//         content: Clinical_licenses(context: context, employeeID: widget.employeeID,
//           onSave: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//           onBack:(){
//             setState(() {
//               _currentStep = _currentStep -1;
//             });
//           },
//           onNext: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//         ),
//       ),
//
//       ///////////
//       Step(
//         state: _currentStep <= 6 ? StepState.editing : StepState.complete,
//         isActive: _currentStep >= 6,
//         title: Theme(
//           data: ThemeData(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//           ),
//           child: Text(
//             'Banking',
//             style:  formNameText.customTextStyle(context),
//           ),
//         ),
//         content: BankingScreen(context: context, employeeID: widget.employeeID,
//           onSave: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//           onBack:(){
//             setState(() {
//               _currentStep = _currentStep -1;
//             });
//           },
//           onNext: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//         ),
//       ),
//       Step(
//         state: _currentStep <= 7 ? StepState.editing : StepState.complete,
//         isActive: _currentStep >= 7,
//         title: Theme(
//           data: ThemeData(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//           ),
//           child: Text(
//             'Health \nRecords',
//             style: formNameText.customTextStyle(context),
//           ),
//         ),
//         content: HealthRecordsScreen(context: context, employeeID: widget.employeeID,
//           onSave: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//           onBack:(){
//             setState(() {
//               _currentStep = _currentStep -1;
//             });
//           },
//           onNext: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//         ),
//       ),
//       Step(
//         state: _currentStep <= 8 ? StepState.editing : StepState.complete,
//         isActive: _currentStep >= 8,
//         title: Theme(
//           data: ThemeData(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//           ),
//           child: Text(
//             'Acknowledgements',
//             style: formNameText.customTextStyle(context),
//           ),
//         ),
//         content: AcknowledgementsScreen(context: context, employeeID: widget.employeeID,
//           onSave: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//           onBack:(){
//             setState(() {
//               _currentStep = _currentStep -1;
//             });
//           },
//           onNext: (){
//             setState(() {
//               _currentStep = _currentStep +1 ;
//             });
//           },
//         ),
//       ),
//       Step(
//         state: _currentStep <= 9 ? StepState.editing : StepState.complete,
//         isActive: _currentStep >= 9,
//         title: Theme(
//           data: ThemeData(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//           ),
//           child: Text(
//             'Legal \nDocuments',
//             style:  formNameText.customTextStyle(context),
//           ),
//         ),
//         content: LegalDocumentsScreen(context: context, employeeID: widget.employeeID,
//           onSave: (){
//             setState(() {
//               Navigator.push(context, MaterialPageRoute(builder: (_)=>OnBoardingThankYou()));
//             });
//           },
//           onBack:(){
//             setState(() {
//               _currentStep = _currentStep -1;
//             });
//           },
//         ),
//       ),
//     ];
//     return stepsList;
//   }
}





// List<Step> steps() {
//   List<Step> stepsList = [
//     // General Step
//     Step(
//       state: _currentStep <= 0 ? StepState.editing : StepState.complete,
//       isActive: _currentStep >= 0,
//       title: Theme(
//         data: ThemeData(
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//         ),
//         child: Text(
//           'General',
//           style: formNameText.customTextStyle(context),
//         ),
//       ),
//       content: generalForm(
//         context: context,
//         employeeID: widget.employeeID,
//         onSave: () {
//           setState(() {
//             _currentStep = _currentStep + 1;
//           });
//         },
//         onNext: () {
//           setState(() {
//             _currentStep = _currentStep + 1;
//           });
//         },
//       ),
//     ),
//     // Employment Step
//     Step(
//       state: _currentStep <= 1 ? StepState.editing : StepState.complete,
//       isActive: _currentStep >= 1,
//       title: Theme(
//         data: ThemeData(
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//         ),
//         child: Text(
//           'Employment',
//           style: formNameText.customTextStyle(context),
//         ),
//       ),
//       content: EmploymentScreen(
//         context: context,
//         employeeID: widget.employeeID,
//         onSave: () {
//           setState(() {
//             _currentStep = _currentStep + 1;
//           });
//         },
//         onBack: () {
//           setState(() {
//             _currentStep = _currentStep - 1;
//           });
//         },
//         onNext: () {
//           setState(() {
//             _currentStep = _currentStep + 1;
//           });
//         },
//       ),
//     ),
//     // Education Step
//     Step(
//       state: _currentStep <= 2 ? StepState.editing : StepState.complete,
//       isActive: _currentStep >= 2,
//       title: Theme(
//         data: ThemeData(
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//         ),
//         child: Text(
//           'Education',
//           style: formNameText.customTextStyle(context),
//         ),
//       ),
//       content: EducationScreen(
//         context: context,
//         employeeID: widget.employeeID,
//         onSave: () {
//           setState(() {
//             _currentStep = _currentStep + 1;
//           });
//         },
//         onBack: () {
//           setState(() {
//             _currentStep = _currentStep - 1;
//           });
//         },
//         onNext: () {
//           setState(() {
//             _currentStep = _currentStep + 1;
//           });
//         },
//       ),
//     ),
//     // References Step
//     Step(
//       state: _currentStep <= 3 ? StepState.editing : StepState.complete,
//       isActive: _currentStep >= 3,
//       title: Theme(
//         data: ThemeData(
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//         ),
//         child: Text(
//           'References',
//           style: formNameText.customTextStyle(context),
//         ),
//       ),
//       content: ReferencesScreen(
//         context: context,
//         employeeID: widget.employeeID,
//         onSave: () {
//           setState(() {
//             _currentStep = _currentStep + 1;
//           });
//         },
//         onBack: () {
//           setState(() {
//             _currentStep = _currentStep - 1;
//           });
//         },
//         onNext: () {
//           setState(() {
//             _currentStep = _currentStep + 1;
//           });
//         },
//       ),
//     ),
//     // Licenses Step
//     Step(
//       state: _currentStep <= 4 ? StepState.editing : StepState.complete,
//       isActive: _currentStep >= 4,
//       title: Theme(
//         data: ThemeData(
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//         ),
//         child: Text(
//           'Licenses',
//           style: formNameText.customTextStyle(context),
//         ),
//       ),
//       content: LicensesScreen(
//         context: context,
//         employeeID: widget.employeeID,
//         onSave: () {
//           setState(() {
//             _currentStep = _currentStep + 1;
//           });
//         },
//         onBack: () {
//           setState(() {
//             _currentStep = _currentStep - 1;
//           });
//         },
//         onNext: () {
//           setState(() {
//             _currentStep = _currentStep + 1;
//           });
//         },
//       ),
//     ),
//   ];
//
//   // Check if the Clinical License step should be added
//   if (widget.depID == AppConfig.clinicalId) {
//     stepsList.add(Step(
//       state: _currentStep <= 5 ? StepState.editing : StepState.complete,
//       isActive: _currentStep >= 5,
//       title: Theme(
//         data: ThemeData(
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//         ),
//         child: Text(
//           'Clinical\nLicense',
//           style: formNameText.customTextStyle(context),
//         ),
//       ),
//       content: Clinical_licenses(
//         context: context,
//         employeeID: widget.employeeID,
//         onSave: () {
//           setState(() {
//             _currentStep = _currentStep + 1;
//           });
//         },
//         onBack: () {
//           setState(() {
//             _currentStep = _currentStep - 1;
//           });
//         },
//         onNext: () {
//           setState(() {
//             _currentStep = _currentStep + 1;
//           });
//         },
//       ),
//     ));
//   }
//
//   // Adjust _currentStep dynamically to shift the Banking Step index when Step 5 (Clinical License) is skipped
//   if (widget.depID != AppConfig.clinicalId) {
//     // If Clinical License step is skipped, shift the current step by one.
//     if (_currentStep > 5) {
//       _currentStep--; // Decrement current step if it's after Step 5
//     }
//   }
//
//   // Add the Banking step as the last step
//   stepsList.add(Step(
//     state: _currentStep <= (widget.depID == AppConfig.clinicalId ? 6 : 5) ? StepState.editing : StepState.complete,
//     isActive: _currentStep >= (widget.depID == AppConfig.clinicalId ? 6 : 5),
//     title: Theme(
//       data: ThemeData(
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//       ),
//       child: Text(
//         'Banking',
//         style: formNameText.customTextStyle(context),
//       ),
//     ),
//     content: BankingScreen(
//       context: context,
//       employeeID: widget.employeeID,
//       onSave: () {
//         setState(() {
//           _currentStep = _currentStep + 1;
//         });
//       },
//       onBack: () {
//         setState(() {
//           _currentStep = _currentStep - 1;
//         });
//       },
//       onNext: () {
//         setState(() {
//           _currentStep = _currentStep + 1;
//         });
//       },
//     ),
//   ));
//
//   // Health Records Step
//   stepsList.add(Step(
//     state: _currentStep <= 7 ? StepState.editing : StepState.complete,
//     isActive: _currentStep >= 7,
//     title: Theme(
//       data: ThemeData(
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//       ),
//       child: Text(
//         'Health \nRecords',
//         style: formNameText.customTextStyle(context),
//       ),
//     ),
//     content: HealthRecordsScreen(
//       context: context,
//       employeeID: widget.employeeID,
//       onSave: () {
//         setState(() {
//           _currentStep = _currentStep + 1;
//         });
//       },
//       onBack: () {
//         setState(() {
//           _currentStep = _currentStep - 1;
//         });
//       },
//       onNext: () {
//         setState(() {
//           _currentStep = _currentStep + 1;
//         });
//       },
//     ),
//   ));
//
//   // Acknowledgements Step
//   stepsList.add(Step(
//     state: _currentStep <= 8 ? StepState.editing : StepState.complete,
//     isActive: _currentStep >= 8,
//     title: Theme(
//       data: ThemeData(
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//       ),
//       child: Text(
//         'Acknowledgements',
//         style: formNameText.customTextStyle(context),
//       ),
//     ),
//     content: AcknowledgementsScreen(
//       context: context,
//       employeeID: widget.employeeID,
//       onSave: () {
//         setState(() {
//           _currentStep = _currentStep + 1;
//         });
//       },
//       onBack: () {
//         setState(() {
//           _currentStep = _currentStep - 1;
//         });
//       },
//       onNext: () {
//         setState(() {
//           _currentStep = _currentStep + 1;
//         });
//       },
//     ),
//   ));
//
//   // Legal Documents Step
//   stepsList.add(Step(
//     state: _currentStep <= 9 ? StepState.editing : StepState.complete,
//     isActive: _currentStep >= 9,
//     title: Theme(
//       data: ThemeData(
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//       ),
//       child: Text(
//         'Legal \nDocuments',
//         style: formNameText.customTextStyle(context),
//       ),
//     ),
//     content: LegalDocumentsScreen(
//       context: context,
//       employeeID: widget.employeeID,
//       onSave: () {
//         setState(() {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => OnBoardingThankYou()),
//           );
//         });
//       },
//       onBack: () {
//         setState(() {
//           _currentStep = _currentStep - 1;
//         });
//       },
//     ),
//   ));
//
//   return stepsList;
// }