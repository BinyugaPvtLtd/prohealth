import 'dart:async';
import 'package:flutter/services.dart';
import 'package:prohealth/app/constants/app_config.dart';
import 'package:prohealth/app/resources/establishment_resources/establishment_string_manager.dart';
import 'package:prohealth/app/resources/value_manager.dart';
import 'package:prohealth/app/services/api/managers/hr_module_manager/profile_mnager.dart';
import 'package:prohealth/app/services/api/managers/hr_module_manager/register_manager/register_manager.dart';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

import 'package:prohealth/app/resources/color.dart';
import 'package:prohealth/app/services/api/managers/establishment_manager/zone_manager.dart';
import 'package:prohealth/data/api_data/api_data.dart';
import 'package:prohealth/data/api_data/establishment_data/pay_rates/pay_rates_finance_data.dart';
import 'package:prohealth/data/api_data/establishment_data/zone/zone_model_data.dart';
import 'package:prohealth/data/api_data/hr_module_data/profile_editor/profile_editor.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/ci_corporate_compliance_doc/widgets/corporate_compliance_constants.dart';
import 'package:prohealth/presentation/screens/em_module/company_identity/widgets/whitelabelling/success_popup.dart';
import 'package:prohealth/presentation/screens/hr_module/register/confirmation_constant.dart';
import 'package:prohealth/presentation/screens/hr_module/register/widgets/offer_letter_constant.dart';
import 'package:provider/provider.dart';
import '../../../../app/resources/common_resources/common_theme_const.dart';
import '../../../../app/resources/const_string.dart';
import '../../../../app/resources/establishment_resources/establish_theme_manager.dart';
import '../../../../app/resources/font_manager.dart';
import '../../../../app/resources/hr_resources/hr_theme_manager.dart';
import '../../../../app/resources/theme_manager.dart';
import '../../../widgets/error_popups/failed_popup.dart';
import '../../../widgets/error_popups/four_not_four_popup.dart';
import '../../../widgets/widgets/constant_textfield/const_textfield.dart';

class OfferLetterScreen extends StatelessWidget {
  final String email;
  final int userId;
  final String role;
  final String status;
  final String firstName;
  final String lastName;
  final String position;
  final String phone;
  final String reportingOffice;
  final String services;
  final String employement;
  final String soecalityName;
  final int clinicalId;
  final int employeeId;
  final int depId;
  final ApiData? apiData;
  final int cityId;
  final int countyId;
  final int zoneId;
  final int countryId;
  final String link;
  final Function() onRefreshRegister;

  const OfferLetterScreen(
      {super.key,
      required this.email,
      required this.userId,
      required this.role,
      required this.status,
      required this.firstName,
      required this.lastName,
      required this.position,
      required this.phone,
      required this.reportingOffice,
      required this.services,
      required this.employement,
      required this.soecalityName,
      required this.clinicalId,
      required this.employeeId,
      this.apiData,
      required this.onRefreshRegister,
      required this.depId,
      required this.cityId,
      required this.countyId,
      required this.zoneId,
      required this.link,
      required this.countryId});

  // String _salary = "";
  // String generatedURL = '';

  // void popNavigation(){
  //   setState((){
  //    Navigator.pop(context);
  //   });
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   // addContainer();
  //   //_initAppLinks();
  //
  // }

  // List<GlobalKey<_DynamciContainerState>> containerKeys = [];
  //
  // void addContainer() {
  //   setState(() {
  //     containerKeys.add(GlobalKey<_DynamciContainerState>());
  //   });
  // }
  //
  // void removecontainer(GlobalKey<_DynamciContainerState> key) {
  //   setState(() {
  //     containerKeys.remove(key);
  //   });
  // }

  // AppLinks? _appLinks;
  //
  // void _initAppLinks() async {
  //   _appLinks = AppLinks();
  // }
  // Future<String> _generateUrlLink(String email, String Id) async {
  //   final String user = email;
  //   final String id = Id;
  //   final String url = '${AppConfig.deployment}/$id';
  //   generatedURL = url;
  //   print('Generated URL: $generatedURL');
  //   return url;
  // }
  // int? selectedCountyId;
  // Map<String, bool> checkedZipCodes = {};
  // Map<String, bool> checkedCityName = {};
  //List<String> selectedZipCodes = [];
  @override
  Widget build(BuildContext context) {
    List<String> selectedCityName = [];
    final _formKey = GlobalKey<FormState>();
    // bool issueDate= false;
    // bool verbalAcceptanceDate= false;
    // bool startDate= false;
    // bool lastDate= false;
    // bool noOfPatientDate = false;
    TextEditingController issueDateController = TextEditingController();
    TextEditingController lastDateController = TextEditingController();
    TextEditingController startDateController = TextEditingController();
    TextEditingController verbalAcceptanceController = TextEditingController();
    TextEditingController patientsController = TextEditingController();
    TextEditingController salaryController = TextEditingController();
    //final StreamController<List<ZipcodeByCountyIdAndZoneIdData>> _countyStreamController = StreamController<List<ZipcodeByCountyIdAndZoneIdData>>.broadcast();

    String selectedDropdownValue = 'Per day';
    String dropdownValue = 'Salaried';
    final providerState =
        Provider.of<HrEnrollOfferLatterProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      providerState.clearSalary();
      providerState.addContainer();
    });
    List<ApiAddCovrageData> addCovrage = [];
    return Consumer<HrEnrollOfferLatterProvider>(
        builder: (context, hrProviderState, state) {
      // Future.delayed(Duration(seconds: 2),(){
      //   providerState.addContainer;
      // });
      return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border(
              //   top: BorderSide(color: ColorManager.bluebottom, width: 8.0), // Top blue border
              // ),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Bottom shadow
                  offset: const Offset(0, 4),
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('Offer Letter',
                              style: FormHeading.customTextStyle(context)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 20, left: 105),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppStringLegalDocument.popupMsgHead,
                            style: LegalDocumentPopupMessage.customTextStyle(
                                context),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ConstTextField(
                            text: 'Issue Date',
                            validationLabel: 'Issue Date',
                            hintText: 'yyyy-mm-dd',
                            controller: issueDateController,
                            errorText: hrProviderState.issueDate
                                ? "Please enter issue date"
                                : null),
                        //SizedBox(width: MediaQuery.of(context).size.width / 80),
                        ConstTextField(
                            text: 'Last Date',
                            validationLabel: 'Last Date',
                            hintText: 'yyyy-mm-dd',
                            controller: lastDateController,
                            errorText: hrProviderState.lastDate
                                ? "Please enter last date"
                                : null),
                        // SizedBox(width: MediaQuery.of(context).size.width / 80),
                        ConstTextField(
                            text: 'Anticipated Start Date',
                            validationLabel: 'Anticipated Start Date',
                            hintText: 'yyyy-mm-dd',
                            controller: startDateController,
                            errorText: hrProviderState.startDate
                                ? "Please enter anticipated start date"
                                : null),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 60),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 11,
                            ),
                            ConstTextField(
                                hintText: 'yyyy-mm-dd',
                                text: 'Verbal Acceptance',
                                validationLabel: 'Verbal Acceptance',
                                controller: verbalAcceptanceController,
                                errorText: hrProviderState.verbalAcceptanceDate
                                    ? "Please enter Verbal Acceptance date"
                                    : null),
                          ],
                        ),
                        if (depId == AppConfig.salesId ||
                            depId == AppConfig.AdministrationId)
                          SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width /
                                5, // Set the height of the SizedBox here as needed
                          )
                        else
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "No. of Patients", // Main text
                                  style: DocumentTypeDataStyle.customTextStyle(
                                      context), // Main style
                                  children: [
                                    TextSpan(
                                      text: ' *', // Asterisk
                                      style:
                                          DocumentTypeDataStyle.customTextStyle(
                                                  context)
                                              .copyWith(
                                        color:
                                            ColorManager.red, // Asterisk color
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //Text("No. of Patients", style: DocumentTypeDataStyle.customTextStyle(context),),
                              SizedBox(
                                height: 5,
                              ),

                              Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width / 5,
                                child: StatefulBuilder(
                                  builder: (BuildContext context, void Function(void Function()) setState) {
                                    return TextField(
                                      cursorColor: Colors.black,
                                      controller: patientsController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}$')),
                                      ],
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffB1B1B1), width: 1.0),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffB1B1B1), width: 1.0),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffB1B1B1), width: 1.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        hintText: 'Enter No. of Patients',
                                        hintStyle: onlyFormDataStyle.customTextStyle(context),
                                        suffixIcon: SizedBox(
                                          width: MediaQuery.of(context).size.width / 14, // Half of text field width
                                          child: SuffixDropDown(
                                            width: MediaQuery.of(context).size.width / 14,
                                            value: selectedDropdownValue,
                                            items: ['Per day', 'Per week', 'Per month'],
                                            onChanged: (String? value) {
                                              if (value != null) {
                                                setState(() {
                                                  selectedDropdownValue = value;
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets.only(left: 10, bottom: 5),
                                      ),
                                      style: DocumentTypeDataStyle.customTextStyle(context),
                                    );
                                  },
                                ),
                              ),

                              ///old 2 working
                                // Container(
                                //   height: 30,
                                //   width: MediaQuery.of(context).size.width / 5,
                                //   child: StatefulBuilder(
                                //     builder: (BuildContext context, void Function(void Function()) setState) {
                                //       return TextField(
                                //         cursorColor: Colors.black,
                                //         controller: patientsController,
                                //         decoration: InputDecoration(
                                //           border: const OutlineInputBorder(
                                //             borderSide: BorderSide(color: Color(0xffB1B1B1), width: 1.0),
                                //           ),
                                //           enabledBorder: const OutlineInputBorder(
                                //             borderSide: BorderSide(color: Color(0xffB1B1B1), width: 1.0),
                                //           ),
                                //           focusedBorder: const OutlineInputBorder(
                                //             borderSide: BorderSide(color: Color(0xffB1B1B1), width: 1.0),
                                //           ),
                                //           filled: true,
                                //           fillColor: Colors.transparent,
                                //           focusColor: Colors.transparent,
                                //           hoverColor: Colors.transparent,
                                //           hintText: 'Enter No. of Patients',
                                //           hintStyle: onlyFormDataStyle.customTextStyle(context),
                                //           suffixIcon: SuffixDropDown(
                                //             width: 100,
                                //             value: selectedDropdownValue,
                                //             items: ['Per day', 'Per week', 'Per month'],
                                //             onChanged: (String? value) {
                                //               if (value != null) {
                                //                 setState(() {
                                //                   selectedDropdownValue = value;
                                //                 });
                                //               }
                                //             },
                                //           ),
                                //           contentPadding: const EdgeInsets.only(left: 10, bottom: 5),
                                //         ),
                                //         style: DocumentTypeDataStyle.customTextStyle(context),
                                //       );
                                //     },
                                //   ),
                                // ),

                              ///old 1
                              // Container(
                              //   height: 30,
                              //   width: MediaQuery.of(context).size.width / 5,
                              //   child: StatefulBuilder(
                              //     builder: (BuildContext context,
                              //         void Function(void Function()) setState) {
                              //       return TextField(
                              //         cursorColor: Colors.black,
                              //         controller: patientsController,
                              //         // onChanged: (value){
                              //         // setState(() {
                              //         // if ("No. of Patients" == "No. of Patients") noOfPatientDate = value.isEmpty;});
                              //         // },
                              //         decoration: InputDecoration(
                              //           border: const OutlineInputBorder(
                              //             borderSide: BorderSide(
                              //                 color: Color(0xffB1B1B1),
                              //                 width: 1.0),
                              //           ),
                              //           enabledBorder: const OutlineInputBorder(
                              //             borderSide: BorderSide(
                              //                 color: Color(0xffB1B1B1),
                              //                 width: 1.0),
                              //           ),
                              //           focusedBorder: const OutlineInputBorder(
                              //             borderSide: BorderSide(
                              //                 color: Color(0xffB1B1B1),
                              //                 width: 1.0),
                              //           ),
                              //           filled: true,
                              //           fillColor: Colors.white,
                              //           hintText: 'Enter No. of Patients',
                              //           hintStyle: onlyFormDataStyle.customTextStyle(context),
                              //           suffixIcon: SuffixDropDown(
                              //             value: selectedDropdownValue,
                              //             items: ['Per day', 'Per week', 'Per month'],
                              //             onChanged: (String? value) {
                              //               if (value != null) {
                              //                 setState(() {
                              //                   selectedDropdownValue = value;
                              //                 });
                              //               }
                              //             },
                              //           ),
                              //           contentPadding: const EdgeInsets.only(left: 10, bottom: 5),
                              //         ),
                              //         style: DocumentTypeDataStyle.customTextStyle(context),
                              //       );
                              //     },
                              //   ),
                              // ),
                              if (hrProviderState.noOfPatientDate == true)
                                Padding(
                                  padding: const EdgeInsets.only(top: 1),
                                  child: Text(
                                    "Please enter no. of Patients",
                                    style:
                                        CommonErrorMsg.customTextStyle(context),
                                  ),
                                ),
                            ],
                          ),
                        //SizedBox(width: MediaQuery.of(context).size.width / 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Divider(
                        color: ColorManager.cream,
                        thickness: 4,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Column(
                      children: hrProviderState.containerKeys
                          .asMap()
                          .entries
                          .map((entry) {
                        int index = entry.key;
                        GlobalKey<_DynamciContainerState> key = entry.value;
                        return DynamciContainer(
                          key: key,
                          index: index + 1,
                          onRemove: () => hrProviderState.removecontainer(key),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 180,
                            height: 30,
                            child: ElevatedButton(
                              onPressed: hrProviderState.addContainer,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff1696C8),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Add New Coverage',
                                style: BlueButtonTextConst.customTextStyle(
                                    context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 60),

                    ///salery
                    ///
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: StatefulBuilder(
                        builder: (BuildContext context,
                            void Function(void Function()) setState) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                                width: 300,
                                child: CustomDropdownTextFieldpadding(
                                  hintText: 'Salaried',
                                  // Conditionally show "Per Visit" in the dropdown if depId is not salesId or AdministrationId
                                  items: depId == AppConfig.salesId ||
                                          depId == AppConfig.AdministrationId
                                      ? [
                                          'Salaried'
                                        ] // Only show 'Salaried' option
                                      : [
                                          'Salaried',
                                          'Per Visit'
                                        ], // Show both 'Salaried' and 'Per Visit'
                                  value: dropdownValue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      dropdownValue = newValue! ?? 'Salaried';
                                      print('dropDownValue ${dropdownValue}');
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 30),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 120, // Set this to an appropriate fixed width
                                    child: Text(
                                      hrProviderState.salary.isNotEmpty
                                          ? "\$ ${hrProviderState.salary}"
                                          : "Not Defined",
                                      style: DocumentTypeDataStyle.customTextStyle(context).copyWith(
                                        color: ColorManager.black, // Asterisk color
                                      ),
                                      overflow: TextOverflow.ellipsis, // Optional: handles overflow gracefully
                                    ),
                                  ),
                                  // Text(
                                  //   hrProviderState.salary.isNotEmpty
                                  //       ? "\$ ${hrProviderState.salary}"
                                  //       : "Not Defined",
                                  //   style: DocumentTypeDataStyle.customTextStyle(context).copyWith(
                                  //     color: ColorManager.black, // Asterisk color
                                  //   ),
                                  // ),
                                  const SizedBox(width: 30),
                                  Row(
                                    children: [
                                      Container(
                                        width: 100,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(12.0),
                                                  ),
                                                  titlePadding: EdgeInsets.zero,
                                                  title: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(12),
                                                      ),
                                                    width: 302,
                                                    height: 230,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 35,
                                                          width: double.infinity,
                                                          decoration: const BoxDecoration(
                                                            color: Color(0xff1696C8),
                                                            borderRadius: BorderRadius.only(
                                                              topLeft: Radius.circular(12.0),
                                                              topRight: Radius.circular(12.0),
                                                            ),
                                                          ),
                                                          padding: const EdgeInsets.only(right: 5, bottom: 5),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            children: [
                                                              Center(
                                                                child: IconButton(
                                                                  splashColor: Colors.transparent,
                                                                  highlightColor: Colors.transparent,
                                                                  hoverColor: Colors.transparent,
                                                                  icon: const Icon(
                                                                    Icons.close,
                                                                    color: Colors.white,
                                                                    size: IconSize.I18,
                                                                  ),
                                                                  onPressed: () {
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              // Display the appropriate text based on dropdown selection
                                                              dropdownValue == 'Salaried'
                                                                  ? Text(
                                                                      'Salary',
                                                                      style: DefineWorkWeekStyle.customTextStyle(context),
                                                                    )
                                                                  : Text(
                                                                      'Per Visit',
                                                                      style: DefineWorkWeekStyle.customTextStyle(context),
                                                                    ),
                                                              SizedBox(
                                                                height: MediaQuery.of(context).size.height / 30,
                                                              ),
                                                              Container(
                                                                height: 30,
                                                                child: TextFormField(
                                                                  controller: salaryController,
                                                                  cursorColor: Colors.black,
                                                                  style: DocumentTypeDataStyle.customTextStyle(context),
                                                                  decoration: InputDecoration(
                                                                    prefix: const Text("\$ "),
                                                                    hintText: '0.00',
                                                                    hintStyle: DocumentTypeDataStyle.customTextStyle(context),
                                                                    enabledBorder: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                      borderSide: const BorderSide(
                                                                          color: Color(0xff51B5E6),
                                                                          width: 1.0),
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                      borderSide: const BorderSide(
                                                                          color: Color(0xff51B5E6),
                                                                          width: 1.0),
                                                                    ),
                                                                    border: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                      borderSide: const BorderSide(color: Color(0xff51B5E6),
                                                                          width: 1.0),
                                                                    ),
                                                                    contentPadding: const EdgeInsets.symmetric(
                                                                        horizontal: 16.0,
                                                                        vertical: 12.0),
                                                                  ),
                                                                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                                                                      inputFormatters: [
                                                                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}$')),
                                                                      ],
                                                                  onChanged: (value) {
                                                                    // hrProviderState.addSalary(value);
                                                                    // print("Salary:: ${hrProviderState.salary}");
                                                                  },
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(context).size.height / 20,
                                                              ),
                                                              Center(
                                                                child: ElevatedButton(
                                                                  onPressed: () {
                                                                    // Handle the submit action
                                                                    hrProviderState.addSalary(salaryController.text);
                                                                    print("Salary:: ${hrProviderState.salary}");
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  style: ElevatedButton.styleFrom(
                                                                    backgroundColor: const Color(0xff1696C8),
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(12),
                                                                    ),
                                                                  ),
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.symmetric(
                                                                        horizontal: 24.0,
                                                                        vertical: 8.0),
                                                                    child: Text('Submit',
                                                                      style: BlueButtonTextConst.customTextStyle(context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xff1696C8),
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: dropdownValue == 'Salaried'
                                              ? Text(
                                                  'Add',
                                                  style: BlueButtonTextConst.customTextStyle(context),
                                                )
                                              : Text(
                                                  'Add Visit',
                                                  style: BlueButtonTextConst.customTextStyle(context),
                                                ),
                                        ),
                                      ),
                                      Text(
                                        ' *', // Asterisk
                                        style: DocumentTypeDataStyle.customTextStyle(context)
                                            .copyWith(color: ColorManager.red, // Asterisk color
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 15),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    ///
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 100),
                    //   child: StatefulBuilder(
                    //     builder: (BuildContext context, void Function(void Function()) setState) {
                    //       return  Row(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           SizedBox(
                    //             height: 30,
                    //             width: 300,
                    //             child: CustomDropdownFormField(
                    //                 hintText: 'Salaried',
                    //                 items: ['Salaried', 'Per Visit'],
                    //                 value: dropdownValue,
                    //                 onChanged: (newValue){
                    //                   setState(() {
                    //                     dropdownValue = newValue! ?? 'Salaried';
                    //                     print('dropDownValue ${dropdownValue}');
                    //                   });
                    //                 }),
                    //           ),
                    //           const SizedBox(width: 30,),
                    //           Row(
                    //             children: [
                    //               Text(
                    //                 _salary.isNotEmpty
                    //                     ? "\$ ${_salary}"
                    //                     : "Not Defined",
                    //                 style: DropdownItemStyle.customTextStyle(context),
                    //               ),
                    //               const SizedBox(width: 30,),
                    //               ElevatedButton(
                    //                   onPressed: () {
                    //                     showDialog(
                    //                       context: context,
                    //                       builder: (BuildContext context) {
                    //                         return AlertDialog(
                    //                           shape: RoundedRectangleBorder(
                    //                             borderRadius: BorderRadius.circular(12.0),
                    //                           ),
                    //                           titlePadding: EdgeInsets.zero,
                    //                           title: Container(
                    //                             decoration: const BoxDecoration(
                    //                               color: Colors.white,
                    //                               borderRadius: BorderRadius.only(
                    //                                 topLeft: Radius.circular(12),
                    //                                 bottomLeft: Radius.circular(12),
                    //                                 bottomRight: Radius.circular(12),
                    //                                 topRight: Radius.circular(12),
                    //                               ),
                    //                             ),
                    //                             width: 302,
                    //                             height: 230,
                    //                             child: Column(
                    //                               children: [
                    //                                 Container(
                    //                                   height: 35,
                    //                                   width: double.infinity,
                    //                                   decoration: const BoxDecoration(
                    //                                     color: Color(0xff1696C8),
                    //                                     borderRadius: BorderRadius.only(
                    //                                       topLeft: Radius.circular(12.0),
                    //                                       topRight: Radius.circular(12.0),
                    //                                     ),
                    //                                   ),
                    //                                   padding: const EdgeInsets.only(right: 5,bottom: 5),
                    //                                   child: Row(
                    //                                     mainAxisAlignment: MainAxisAlignment.end,
                    //                                     children: [
                    //                                       IconButton(
                    //                                         icon: const Icon(Icons.close,
                    //                                             color: Colors.white),
                    //                                         onPressed: () {
                    //                                           Navigator.of(context).pop();
                    //                                         },
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                 ),
                    //                                 Padding(
                    //                                   padding: const EdgeInsets.symmetric(
                    //                                       vertical: 15.0, horizontal: 16.0),
                    //                                   child: Column(
                    //                                     crossAxisAlignment:
                    //                                     CrossAxisAlignment.start,
                    //                                     children: [
                    //                                       dropdownValue == 'Salaried' ?  Text(
                    //                                         'Salary',
                    //                                         style:DefineWorkWeekStyle.customTextStyle(context),
                    //                                       ) : Text(
                    //                                         'Per Visit',
                    //                                         style: DefineWorkWeekStyle.customTextStyle(context),
                    //                                       ),
                    //                                       SizedBox(
                    //                                         height: MediaQuery.of(context)
                    //                                             .size
                    //                                             .height /
                    //                                             30,
                    //                                       ),
                    //                                       Container(
                    //                                         height: 30,
                    //                                         child: TextFormField(
                    //                                           cursorColor: Colors.black,
                    //                                           style: DocumentTypeDataStyle.customTextStyle(context),
                    //                                           decoration: InputDecoration(
                    //                                             prefix:const Text("\$ "),
                    //                                             hintText: '0.00',
                    //                                             hintStyle:  DocumentTypeDataStyle.customTextStyle(context),
                    //                                             enabledBorder:
                    //                                             OutlineInputBorder(
                    //                                               borderRadius:
                    //                                               BorderRadius.circular(
                    //                                                   8.0),
                    //                                               borderSide: const BorderSide(
                    //                                                 color: Color(0xff51B5E6),
                    //                                                 width: 1.0,
                    //                                               ),
                    //                                             ),
                    //                                             focusedBorder:
                    //                                             OutlineInputBorder(
                    //                                               borderRadius:
                    //                                               BorderRadius.circular(
                    //                                                   8.0),
                    //                                               borderSide: const BorderSide(
                    //                                                 color: Color(0xff51B5E6),
                    //                                                 width: 1.0,
                    //                                               ),
                    //                                             ),
                    //                                             border: OutlineInputBorder(
                    //                                               borderRadius:
                    //                                               BorderRadius.circular(
                    //                                                   8.0),
                    //                                               borderSide: const BorderSide(
                    //                                                 color: Color(0xff51B5E6),
                    //                                                 width: 1.0,
                    //                                               ),
                    //                                             ),
                    //                                             contentPadding:
                    //                                             const EdgeInsets.symmetric(
                    //                                                 horizontal: 16.0,
                    //                                                 vertical: 12.0),
                    //                                           ),
                    //                                           keyboardType:
                    //                                           TextInputType.number,
                    //                                           onChanged: (value) {
                    //                                             setState((){
                    //                                               _salary = value;
                    //                                             });
                    //                                             print("Salary:: ${_salary}");
                    //                                           },
                    //                                         ),
                    //                                       ),
                    //                                       SizedBox(
                    //                                           height: MediaQuery.of(context)
                    //                                               .size
                    //                                               .height /
                    //                                               20),
                    //                                       Center(
                    //                                         child: ElevatedButton(
                    //                                           onPressed: () {
                    //                                             // Handle the submit action
                    //                                             Navigator.of(context).pop();
                    //                                           },
                    //                                           style: ElevatedButton.styleFrom(
                    //                                             backgroundColor:
                    //                                             const Color(0xff1696C8),
                    //                                             shape: RoundedRectangleBorder(
                    //                                               borderRadius:
                    //                                               BorderRadius.circular(
                    //                                                   12),
                    //                                             ),
                    //                                           ),
                    //                                           child: Padding(
                    //                                             padding: const EdgeInsets
                    //                                                 .symmetric(
                    //                                                 horizontal: 24.0,
                    //                                                 vertical: 8.0),
                    //                                             child: Text(
                    //                                               'Submit',
                    //                                               style: BlueButtonTextConst.customTextStyle(context),
                    //                                             ),
                    //                                           ),
                    //                                         ),
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         );
                    //                       },
                    //                     );
                    //                   },
                    //                   style: ElevatedButton.styleFrom(
                    //                     backgroundColor: const Color(0xff1696C8),
                    //                     foregroundColor: Colors.white,
                    //                     shape: RoundedRectangleBorder(
                    //                       borderRadius: BorderRadius.circular(12),
                    //                     ),
                    //                   ),
                    //                   child: dropdownValue == 'Salaried' ? Text(
                    //                     'Add',
                    //                     style: BlueButtonTextConst.customTextStyle(context),
                    //                   ) : Text(
                    //                     'Add Visit',
                    //                     style: BlueButtonTextConst.customTextStyle(context),
                    //                   )
                    //               ),
                    //               const SizedBox(width: 15),
                    //
                    //             ],
                    //           ),
                    //
                    //         ],
                    //       );
                    //     },
                    //   ),
                    // ),
                    SizedBox(height: MediaQuery.of(context).size.height / 9),

                    ///bottom button
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              hrProviderState.clearAllFields();
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xff1696C8),
                              side: const BorderSide(color: Color(0xff1696C8)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Back',
                                style:
                                    TransparentButtonTextConst.customTextStyle(
                                        context)),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 75),
                        Container(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () async {
                              // Validate the salary field
                              if (hrProviderState.salary.isEmpty) {
                                // You can either show a Snackbar, a dialog, or update the UI
                                await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AddFailePopup(
                                      message: 'Something is missing',
                                    );
                                  },
                                );
                                return; // Return early if salary is empty
                              }

                              hrProviderState.validateFieldsUseController(
                                  issueDateController: issueDateController,
                                  startDateController: startDateController,
                                  lastDateController: lastDateController,
                                  verbalAcceptanceController:
                                      verbalAcceptanceController);
                              // setState(() {
                              //   // _collegeUniversityError = widget.effectiveDateController.text.isEmpty;
                              //   //_phoneError = !_isPhoneValid(widget.phoneController.text); // Update phone validation logic
                              //   issueDate = issueDateController.text.isEmpty;
                              //   startDate = startDateController.text.isEmpty;
                              //   lastDate = lastDateController.text.isEmpty;
                              //   verbalAcceptanceDate = verbalAcceptanceController.text.isEmpty;
                              //  // noOfPatientDate = patientsController.text.isEmpty;
                              //   // _radioButtonError = !_isRadioButtonSelected;
                              // });
                              if (!hrProviderState.issueDate &&
                                  !hrProviderState.startDate &&
                                  !hrProviderState.lastDate &&
                                  !hrProviderState.verbalAcceptanceDate) {
                                for (var key in hrProviderState.containerKeys) {
                                  final st = key.currentState!;

                                  print('County ID: ${st.selectedCountyId}');
                                  print('Zone ID:::::::::=>> ${st.docZoneId}');
                                  print('Zip Codes: ${st.selectedZipCodes}');
                                  //print('EmployeeEnrollId : ${widget.apiData!.employeeEnrollId!}');
                                  addCovrage.add(ApiAddCovrageData(
                                      city: '',
                                      countyId: st.selectedCountyId,
                                      zoneId: st.docZoneId,
                                      zipCodes: st.zipCodes));
                                }
                                print(
                                    "Added covrage:::::::::::::>>>>>>>>>>> ${addCovrage}");
                                //await _generateUrlLink(widget.email, widget.userId.toString());
                                // print("Widget employeeId ${widget.apiData!.employeeId!}");
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ConfirmationPopup(
                                      // loadingDuration: _isLoading,
                                      onCancel: () {
                                        Navigator.pop(context);
                                      },
                                      onConfirm: () async {
                                        // Print selected values for debugging
                                        // print('selected county id : ${selectedCountyId}');
                                        print(
                                            'selected city : ${selectedCityName}');
                                        print(
                                            'Salary: ${hrProviderState.salary}');
                                        print('Salary Type: $dropdownValue');
                                        print(
                                            'Patient Count: ${patientsController.text}');

                                        try {
                                          // Set patientsValue based on depId
                                          int patientsValue;
                                          if (depId == AppConfig.salesId || depId == AppConfig.AdministrationId) {
                                            patientsValue = 0; // If depId is sales or administration, set to 0
                                          } else {
                                            patientsValue = int.parse(patientsController.text); // Otherwise, parse the text from the controller
                                          }
                                          ApiData response = await addEmpEnroll(
                                            context: context,
                                            employeeId: employeeId,
                                            code: "",
                                            userId: userId,
                                            firstName: firstName,
                                            lastName: lastName,
                                            phoneNbr: phone,
                                            email: email,
                                            link: link,
                                            status: status,
                                            departmentId: depId,
                                            position: position,
                                            speciality: soecalityName,
                                            clinicianTypeId: clinicalId,
                                            reportingOfficeId: reportingOffice,
                                            cityId: cityId,
                                            countryId: countryId,
                                            countyId: countyId,
                                            zoneId: zoneId,
                                            // employment: "Full Time",
                                            employment: employement,
                                            // service: "Hospice",
                                            service: services,
                                          );
                                          if (response.statusCode == 200 || response.statusCode == 201) {
                                            // Call the API with the correct patientsValue
                                            onRefreshRegister();
                                            var empEnrollOfferResponse = await addEmpEnrollOffers(
                                              context,
                                              response.employeeEnrollId!,
                                              response.employeeId!,
                                              patientsValue, // Use patientsValue here
                                              issueDateController.text,
                                              lastDateController.text,
                                              startDateController.text,
                                              verbalAcceptanceController.text,
                                            );

                                            // print('County id : ${selectedCountyId}');
                                            // print('Zone id : ${selectedZoneId}');

                                            // Call other enrollment-related APIs
                                            await addEmpEnrollAddCoverage(
                                              context,
                                              response.employeeEnrollId!,
                                              response.employeeId!,
                                              addCovrage,
                                            );

                                            await addEmpEnrollAddCompensation(
                                              context,
                                              response.employeeEnrollId!,
                                              response.employeeId!,
                                              dropdownValue.toString(),
                                              int.parse(
                                                  hrProviderState.salary!),
                                            );

                                            // Clear controllers
                                            issueDateController.clear();
                                            lastDateController.clear();
                                            startDateController.clear();
                                            verbalAcceptanceController.clear();

                                            Navigator.pop(context);
                                            if (empEnrollOfferResponse.statusCode == 200||
                                                empEnrollOfferResponse
                                                        .statusCode ==
                                                    201) {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  Future.delayed(
                                                      const Duration(
                                                          seconds: 2), () {
                                                    if (Navigator.of(context)
                                                        .canPop()) {
                                                      Navigator.pop(context);
                                                      hrProviderState
                                                          .clearAllFields();
                                                      hrProviderState
                                                          .popNavigation(
                                                              context);
                                                    }
                                                  });
                                                  return const offerSuccessPopup(
                                                      message:
                                                          'Employee Enrolled Successfully');
                                                },
                                              );
                                            } else if (empEnrollOfferResponse
                                                        .statusCode ==
                                                    400 ||
                                                empEnrollOfferResponse
                                                        .statusCode ==
                                                    404) {
                                              // Navigator.pop(context);
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    const FourNotFourPopup(),
                                              );
                                            } else {
                                              // Navigator.pop(context);
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    FailedPopup(
                                                        text:
                                                            empEnrollOfferResponse
                                                                .message),
                                              );
                                            }
                                          } else {
                                            Navigator.pop(context);
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  FailedPopup(
                                                      text:
                                                          "Something Went Wrong!!"),
                                            );
                                          }

                                          // Check the response status
                                        } catch (e) {
                                          print("Error during enrollment: $e");
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                FailedPopup(text: "Error during enrollment: $e"),
                                          );
                                          // ScaffoldMessenger.of(context).showSnackBar(
                                          //   SnackBar(content: Text('Enrollment failed: $e')),
                                          // );
                                        } finally {
                                          // setState(() { _isLoading = false; });
                                        }
                                      },

                                      // onConfirm: ()  async{
                                      //   //await Future.delayed(Duration(seconds: 2));
                                      //   // setState(() {
                                      //   //   _isLoading = true;
                                      //   // });
                                      //   print('selected county id : ${selectedCountyId}');
                                      //   //  print('selected zone id : ${st.docZoneId}');
                                      //   // print('selected zipCode : ${st.selectedZipCodes}');
                                      //   print('selected city : ${selectedCityName}');
                                      //   print('Salari ${_salary}');
                                      //   print('Salari Type ${dropdownValue}');
                                      //   print('PatianCount ${patientsController.text}');
                                      //   try {
                                      //
                                      //
                                      //     if (widget.depId == AppConfig.salesId || widget.depId == AppConfig.AdministrationId) {
                                      //       patientsValue = 0;  // If depId is sales or administration, set to 0
                                      //     } else {
                                      //       patientsValue = int.parse(patientsController.text);  // Otherwise, parse the text from the controller
                                      //     }
                                      //     var empEnrollOfferResponse = await addEmpEnrollOffers(
                                      //       context,
                                      //       widget.apiData!.employeeEnrollId!,
                                      //       widget.apiData!.employeeId!,
                                      //       int.parse(patientsController.text),
                                      //       issueDateController.text,
                                      //       lastDateController.text,
                                      //       startDateController.text,
                                      //       verbalAcceptanceController.text,
                                      //     );
                                      //     print('County id : ${selectedCountyId}');
                                      //     print('Zone id : ${selectedZoneId}');
                                      //     await addEmpEnrollAddCoverage(
                                      //         context,
                                      //         widget.apiData!.employeeEnrollId!,
                                      //         widget.apiData!.employeeId!,
                                      //         addCovrage
                                      //     );
                                      //     await addEmpEnrollAddCompensation(
                                      //       context,
                                      //       widget.apiData!.employeeEnrollId!,
                                      //       widget.apiData!.employeeId!,
                                      //       dropdownValue.toString(),
                                      //       int.parse(_salary),
                                      //     );
                                      //     // Clear controllers
                                      //     issueDateController.clear();
                                      //     lastDateController.clear();
                                      //     startDateController.clear();
                                      //     verbalAcceptanceController.clear();
                                      // Navigator.pop(context);
                                      //     if(empEnrollOfferResponse.statusCode == 200 || empEnrollOfferResponse.statusCode == 201){
                                      //       showDialog(
                                      //         context: context,
                                      //         builder: (BuildContext context) {
                                      //           Future.delayed(const Duration(seconds: 3),(){
                                      //             if(Navigator.of(context).canPop()) {
                                      //        Navigator.pop(context);
                                      //        popNavigation();
                                      //             }
                                      //           });
                                      //           return  const offerSuccessPopup(message: 'Employee Enrolled Successfully',);
                                      //         },
                                      //       );
                                      //     }
                                      //   } catch (e) {
                                      //     print("Error during enrollment: $e");
                                      //     ScaffoldMessenger.of(context).showSnackBar(
                                      //       SnackBar(content: Text('Enrollment failed: $e')),
                                      //     );
                                      //   } finally {
                                      //     // setState(() {
                                      //     //   _isLoading = false;
                                      //     // });
                                      //   }
                                      // },
                                      title: 'Confirm Enrollment',
                                      containerText:
                                          'Do you really want to enroll?',
                                    );
                                  },
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff1696C8),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Enroll',
                                style: BlueButtonTextConst.customTextStyle(
                                    context)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class ConstTextField extends StatefulWidget {
  final TextEditingController controller;
  final String validationLabel;
  final String text;
  final String hintText;
  VoidCallback? onTap;
  ConstTextField({
    super.key,
    required this.controller,
    String? errorText,
    required this.validationLabel,
    required this.text,
    required this.hintText, this.onTap,
  });

  @override
  State<ConstTextField> createState() => _ConstTextFieldState();
}

class _ConstTextFieldState extends State<ConstTextField> {
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Consumer<HrEnrollOfferLatterProvider>(
        builder: (context, hrProviderState, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: widget.text, // Main text
              style:
                  DocumentTypeDataStyle.customTextStyle(context), // Main style
              children: [
                TextSpan(
                  text: ' *', // Asterisk
                  style:
                      DocumentTypeDataStyle.customTextStyle(context).copyWith(
                    color: ColorManager.red, // Asterisk color
                  ),
                ),
              ],
            ),
          ),
          // Text(text,style: DocumentTypeDataStyle.customTextStyle(context),),
          SizedBox(
            height: 5,
          ),

          CustomTextFieldOfferScreen(
              hintText: widget.hintText,

              height: 36,
              controller: widget.controller,
              onChanged: (value) {
                hrProviderState.validateFields(
                    validationLabel: widget.validationLabel, value: value);

              },
          onTap:() async {
          DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime(3000),
          );
          if (pickedDate != null) {
          widget.controller.text = "${pickedDate.toLocal()}".split(' ')[0];
          }
          } ,
            ),

          errorText != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(
                    errorText!,
                    style: CommonErrorMsg.customTextStyle(context),
                  ),
                )
              : SizedBox(
                  height: 13,
                )
        ],
      );
    });
  }
}

class CheckBoxTileConst extends StatelessWidget {
  final String text;
  bool value;
  ValueChanged<bool?> onChanged;

  CheckBoxTileConst({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 50,
      color: ColorManager.white,
      child: CheckboxListTile(
        hoverColor: Colors.transparent,
        activeColor: ColorManager.bluebottom,
        splashRadius: 0,
        selectedTileColor: Colors.red,
        title: Text(
          text,
          style: DocumentTypeDataStyle.customTextStyle(context),
        ),
        value: value,
        onChanged: onChanged,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}

class DynamciContainer extends StatefulWidget {
  final VoidCallback onRemove;
  final int index;
  const DynamciContainer(
      {super.key, required this.onRemove, required this.index});

  @override
  _DynamciContainerState createState() => _DynamciContainerState();
}

class _DynamciContainerState extends State<DynamciContainer> {
  int selectedZoneId = 0;
  int selectedCountyId = 0;
  int selectedCityId = 0;
  String? selectedCounty;
  Map<String, bool> checkedZipCodes = {};
  Map<String, bool> checkedCityName = {};
  List<int> selectedZipCodes = [];
  List<String> selectedCityName = [];
  String selectedZipCodesString = '';
  String selectedCityString = '';
  List<DropdownMenuItem<String>> dropDownList = [];
  int countyId = 0;
 // final StreamController<List<ZipcodeByCountyIdData>> _ZipStreamController = StreamController<List<ZipcodeByCountyIdData>>.broadcast();
  // final StreamController<List<AllCountyGetList>> _countyStreamController = StreamController<List<AllCountyGetList>>.broadcast();
  List<int> zipCodes = [];
  int? employementIndex;
  final StreamController<List<CountyWiseZoneModal>> _zoneController = StreamController<List<CountyWiseZoneModal>>.broadcast();
  final StreamController<List<ZipcodeByCountyIdAndZoneIdData>> _countyStreamController = StreamController<List<ZipcodeByCountyIdAndZoneIdData>>.broadcast();

  String selectedZipCodeZone=" ";
  int docZoneId = 0;
  List<ApiAddCovrageData> addCovrage = [];
  bool isButtonEnabled = false;
  Widget _buildPlaceholder({String text = ""}) {
    return Container(
      width: 250,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.containerBorderGrey, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(child: Text(text, style: AllNoDataAvailable.customTextStyle(context))),
    );
  }

  // void _fetchCountyWiseZone() async {
  //   if (selectedCountyId > 0) {
  //     try {
  //       List<CountyWiseZoneModal> data = await fetchCountyWiseZone(context, selectedCountyId);
  //       _zoneController.add(data);
  //       selectedZipCodeZone = null;
  //       if (data.isNotEmpty) {
  //         setState(() {
  //           print("zone offer letter ::::::::::::::::::::::::::::::: ${selectedZipCodeZone}");
  //           selectedZipCodeZone = data.first.zoneName;
  //           docZoneId = data.first.zone_id;
  //           print("zone offer letter after ::::::::::::::::::::::::::::::: ${selectedZipCodeZone}");
  //         });
  //
  //         // Fetch updated zip codes for the first zone
  //         _fetchZipCodes();
  //       } else {
  //         // Reset values if no zones are available
  //         setState(() {
  //           selectedZipCodeZone = null;
  //           docZoneId = 0;
  //         });
  //         _countyStreamController.add([]); // Clear zip code list
  //       }
  //     } catch (e) {
  //       _zoneController.addError("Error fetching zones");
  //     }
  //   }
  // }
  ///
  // void _fetchCountyWiseZone() async {
  //   if (selectedCountyId > 0) {
  //     try {
  //       List<CountyWiseZoneModal> data = await fetchCountyWiseZone(context, selectedCountyId);
  //       _zoneController.add(data);
  //
  //       setState(() {
  //         selectedZipCodeZone = data.isNotEmpty ? data.first.zoneName : null;
  //         docZoneId = data.isNotEmpty ? data.first.zone_id : 0;
  //         print("zone offer letter ::::::::::::::::::::::::::::::: ${selectedZipCodeZone}");
  //       });
  //
  //       _fetchZipCodes(); // Fetch updated zip codes
  //     } catch (e) {
  //       _zoneController.addError("Error fetching zones");
  //     }
  //   }
  // }
  void _fetchCountyWiseZone() async {
    if (selectedCountyId > 0) {
      try {
        List<CountyWiseZoneModal> data = await fetchCountyWiseZone(context, selectedCountyId);
        _zoneController.add(data);

        if (data.isNotEmpty) {
          setState(() {
            selectedZipCodeZone = data.first.zoneName;
            docZoneId = data.first.zone_id;
          });

          _fetchZipCodes(); // Fetch updated zip codes for the selected zone
        } else {
          // Reset values if no zones are available
          setState(() {
            selectedZipCodeZone = " ";
            docZoneId = 0;
          });
          _countyStreamController.add([]); // Clear zip code list
        }
      } catch (e) {
        _zoneController.addError("Error fetching zones");
      }
    }
  }


  void _fetchZipCodes() async {
    if (selectedCountyId > 0 && docZoneId > 0) {
      try {
        List<
            ZipcodeByCountyIdAndZoneIdData> data = await getZipcodeByCountyIdAndZoneId(
          context: context,
          countyId: selectedCountyId,
          zoneId: docZoneId,
        );
        _countyStreamController.add(data);
      } catch (e) {
        _countyStreamController.addError("Error fetching zip codes");
      }
    }
  }
  // void _updateButtonState() {
  //   setState(() {
  //     isButtonEnabled = selectedCounty != null &&
  //         selectedCounty!.isNotEmpty &&
  //         (zipCodes.isEmpty || selectedZipCodes.isNotEmpty) &&
  //         selectedZipCodeZone != null &&
  //         selectedZipCodeZone!.isNotEmpty;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      child: StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Container(
            width: double.infinity, //1030
            height: 330, //MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff1696C8)),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        employementIndex == null
                            ? 'Coverage #${widget.index}'
                            : 'Coverage #${employementIndex}',
                        style: DefineWorkWeekStyle.customTextStyle(context),
                      ),
                      if (widget.index > 1)
                        IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: widget.onRemove,
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ///county
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'County', // Main text
                              style: DocumentTypeDataStyle.customTextStyle(
                                  context), // Main style
                              children: [
                                TextSpan(
                                  text: ' *', // Asterisk
                                  style: DocumentTypeDataStyle.customTextStyle(
                                      context)
                                      .copyWith(
                                    color: ColorManager.red, // Asterisk color
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          FutureBuilder<List<AllCountyGetList>>(
                            future: getCountyZoneList(context),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CICCDropdown(
                                    width: 250, hintText: 'Select County', items: []);
                              }
                              if (snapshot.hasError) {
                                return const Text("Error fetching counties");
                              }
                              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return Container(
                                    width: AppSize.s250,
                                    height: AppSize.s30,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Center(child: Text('No Data available',
                                    style: DocumentTypeDataStyle.customTextStyle(context),)));
                              }

                              List<DropdownMenuItem<String>> countyDropDownList = snapshot.data!
                                  .map((county) =>
                                  DropdownMenuItem<String>(
                                    value: county.countyName,
                                    child: Text(county.countyName),
                                  ))
                                  .toList();
                              return CICCDropdown(
                                items: countyDropDownList,
                                initialValue: selectedCounty,
                                width: 250,
                                onChange: (newValue) {
                                  setState(() {
                                    selectedCounty = newValue;
                                    selectedCountyId = snapshot.data!
                                        .firstWhere((county) => county.countyName == newValue)
                                        .countyId;

                                    // Reset previous selections
                                    selectedZipCodeZone = " ";
                                    docZoneId = 0;

                                    _fetchCountyWiseZone(); // Fetch zones for the selected county
                                   // _updateButtonState();
                                  });
                                },

                                // onChange: (newValue) {
                                //   setState(() {
                                //     selectedCounty = newValue;
                                //     selectedCountyId = snapshot.data!.firstWhere((county) => county.countyName == newValue).countyId;
                                //
                                //     // Reset previous selections
                                //     selectedZipCodeZone = null;
                                //     docZoneId = 0;
                                //
                                //     _fetchCountyWiseZone(); // Fetch zones for the selected county
                                //     _updateButtonState();
                                //   });
                                // },

                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.height / 15),

                      ///zone api
                      // StatefulBuilder(
                      //   builder: (BuildContext context, void Function(void Function()) setState) { return
                          Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Zone", // Main text
                                style: DocumentTypeDataStyle.customTextStyle(
                                    context), // Main style
                                children: [
                                  TextSpan(
                                    text: ' *', // Asterisk
                                    style: DocumentTypeDataStyle.customTextStyle(
                                        context)
                                        .copyWith(
                                      color: ColorManager.red, // Asterisk color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            FutureBuilder<List<CountyWiseZoneModal>>(
                              future: fetchCountyWiseZone(context ,selectedCountyId),
                              //stream: _zoneController.stream,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Container(
                                    width: 250,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(5),),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Text(
                                            selectedZipCodeZone,
                                            style: DocumentTypeDataStyle.customTextStyle(context),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                                          child: Icon(Icons.arrow_drop_down),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                if(selectedCountyId == 0 ){
                                  return _buildPlaceholder(text: " ");
                                }
                                if ( !snapshot.hasData || snapshot.data!.isEmpty) {
                                  return _buildPlaceholder(text: "No zones available");
                                }

                                List<DropdownMenuItem<String>> zoneDropDownList = snapshot.data!.map((zone) => DropdownMenuItem<String>(
                                  value: zone.zoneName,
                                  child: Text(zone.zoneName),
                                ))
                                    .toList();

                                return CICCDropdown(
                                  width: 250,
                                  initialValue: selectedZipCodeZone, // Auto-select first zone
                                  onChange: (val) {
                                    setState(() {
                                      selectedZipCodeZone = val;
                                      docZoneId = snapshot.data!.firstWhere((zone) => zone.zoneName == val).zone_id;
                                    });

                                    _fetchZipCodes(); // Fetch updated zip codes
                                    //  _updateButtonState();
                                  },
                                  items: zoneDropDownList,
                                );
                              },
                            ),
                          ],
                        ),
                      //     },
                      // )
                    ],
                  ),
                  const SizedBox(height: 20,),

                  ///old code tabbar
                  StatefulBuilder(
                    builder: (BuildContext context, void Function(void Function()) setState) { return Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Zip Codes", // Main text
                                  style: DocumentTypeDataStyle.customTextStyle(
                                      context), // Main style
                                  children: [
                                    TextSpan(
                                      text: ' *', // Asterisk
                                      style:
                                      DocumentTypeDataStyle.customTextStyle(
                                          context)
                                          .copyWith(
                                        color: ColorManager.red, // Asterisk color
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          Expanded(
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 20.0, right: 300.0),
                              child: StreamBuilder<List<ZipcodeByCountyIdAndZoneIdData>>(
                                stream: _countyStreamController.stream,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return const SizedBox();
                                  }
                                  if (selectedCountyId == 0 || !snapshot.hasData || snapshot.data!.isEmpty) {
                                    return Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: AppPadding.p180,bottom: AppPadding.p20 ),
                                        child: Text(
                                          selectedCountyId == 0
                                              ? 'Select County'
                                              : 'No Zipcode Available!',
                                          style: NumberTExtFieldLegalDoc.customTextStyle(context),
                                        ),
                                      ),
                                    );
                                  }

                                  List<ZipcodeByCountyIdAndZoneIdData> zipCodeList = snapshot.data!;

                                  // If only one zip code is available, set it as checked
                                  WidgetsBinding.instance.addPostFrameCallback((_) {
                                    if (zipCodeList.length == 1) {
                                      String singleZip = zipCodeList.first.zipCode;
                                      if (!checkedZipCodes.containsKey(singleZip)) {
                                        setState(() {
                                          checkedZipCodes[singleZip] = true;
                                          // selectedZipCodes.add(singleZip);
                                          zipCodes.add(int.parse(singleZip));
                                          selectedZipCodesString = selectedZipCodes.join(', ');
                                          // _updateButtonState();
                                        });
                                      }
                                    }
                                  });

                                  return GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, // Two items per row
                                      childAspectRatio: 10,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                    ),
                                    itemCount: zipCodeList.length,
                                    itemBuilder: (context, index) {
                                      String zipCode = zipCodeList[index].zipCode;
                                      bool isChecked = checkedZipCodes[zipCode] ?? false;

                                      return CheckBoxTileConst(
                                        text: zipCode,
                                        value: isChecked,
                                        onChanged: (bool? val) {
                                          setState(() {
                                            checkedZipCodes[zipCode] = val ?? false;
                                            if (val == true) {
                                              // selectedZipCodes.add(zipCode);
                                              zipCodes.add(int.parse(zipCode));
                                            } else {
                                              selectedZipCodes.remove(zipCode);
                                              zipCodes.remove(int.parse(zipCode));
                                            }
                                            selectedZipCodesString = selectedZipCodes.join(', ');
                                            // _updateButtonState();
                                          });
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ); },

                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// provider class
class HrEnrollOfferLatterProvider extends ChangeNotifier {
  String _salary = '';
  bool _issueDate = false;
  bool _verbalAcceptanceDate = false;
  bool _startDate = false;
  bool _lastDate = false;
  bool _noOfPatientDate = false;
  bool _isLoading = false;
  bool get issueDate => _issueDate;
  bool get verbalAcceptanceDate => _verbalAcceptanceDate;
  bool get startDate => _startDate;
  bool get lastDate => _lastDate;
  bool get noOfPatientDate => _noOfPatientDate;
  String get salary => _salary;
  bool get isLoading => _isLoading;
  List<GlobalKey<_DynamciContainerState>> _containerKeys = [];
  List<GlobalKey<_DynamciContainerState>> get containerKeys => _containerKeys;

  void validateFields(
      {required String validationLabel, required String value}) {
    // Update error state based on the field
    if (validationLabel == "Issue Date") _issueDate = value.isEmpty;
    if (validationLabel == "Last Date") _lastDate = value.isEmpty;
    if (validationLabel == "Anticipated Start Date") _startDate = value.isEmpty;
    if (validationLabel == "Verbal Acceptance")
      _verbalAcceptanceDate = value.isEmpty;
    notifyListeners();
  }

  void validateFieldsUseController(
      {required TextEditingController issueDateController,
      required TextEditingController startDateController,
      required TextEditingController lastDateController,
      required TextEditingController verbalAcceptanceController}) {
    // _collegeUniversityError = widget.effectiveDateController.text.isEmpty;
    //_phoneError = !_isPhoneValid(widget.phoneController.text);
    _issueDate = issueDateController.text.isEmpty;
    _startDate = startDateController.text.isEmpty;
    _lastDate = lastDateController.text.isEmpty;
    _verbalAcceptanceDate = verbalAcceptanceController.text.isEmpty;
    // noOfPatientDate = patientsController.text.isEmpty;
    // _radioButtonError = !_isRadioButtonSelected;
    notifyListeners();
  }

  void clearAllFields() {
    _salary = '';
    _containerKeys.clear();
    notifyListeners();
  }

  void clearSalary() {
    _salary = '';
    notifyListeners();
  }

  void addSalary(String value) {
    _salary = value;
    notifyListeners();
  }

  void addContainer() {
    _containerKeys.add(GlobalKey<_DynamciContainerState>());
    notifyListeners();
  }

  void removecontainer(GlobalKey<_DynamciContainerState> key) {
    _containerKeys.remove(key);
    notifyListeners();
  }

  void popNavigation(BuildContext context) {
    Navigator.pop(context);
    notifyListeners();
  }
}

///old zipcode streambuilder code

// StreamBuilder<List<ZipcodeByCountyIdData>>(
//   stream: _ZipStreamController.stream,
//   builder: (BuildContext context, snapshot) {
//     getZipcodeByCountyId(context: context, countyId: selectedCountyId).then((data) {
//       _ZipStreamController.add(data);
//     }).catchError((error) {
//       // Handle error
//     });
//
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const SizedBox();
//     }
//
//     if (selectedCountyId == 0) {
//       return Text(
//         'Select county',
//         style: DocumentTypeDataStyle.customTextStyle(context),
//       );
//     }
//
//     if (snapshot.data!.isEmpty) {
//       return Text(
//         'No ZipCode Found!',
//         style: DocumentTypeDataStyle.customTextStyle(context),
//       );
//     }
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // Two items per row
//           childAspectRatio: 12,
//           crossAxisSpacing: 5,
//           mainAxisSpacing:5
//       ),
//       itemCount: snapshot.data!.length,
//       itemBuilder: (BuildContext context, int index) {
//         String zipCode = snapshot.data![index].zipCode;
//         bool isChecked = checkedZipCodes[zipCode] ?? false;
//
//         return StatefulBuilder(
//           builder: (BuildContext context, void Function(void Function()) setState) {
//             return CheckBoxTileConst(
//               text: zipCode,
//               value: isChecked,
//               onChanged: (bool? val) {
//                 setState(() {
//                   print('Clicked check box 1');
//                   checkedZipCodes[zipCode] = val ?? false;
//                   if (val == true) {
//                     selectedZipCodes.add(int.parse(zipCode));
//                   } else {
//                     selectedZipCodes.remove(int.parse(zipCode));
//                   }
//                   selectedZipCodesString = selectedZipCodes.join(', ');
//                 });
//               },
//             );
//           },
//         );
//       },
//     );
//   },
// ),
